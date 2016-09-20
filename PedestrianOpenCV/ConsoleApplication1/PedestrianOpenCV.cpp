///////////////////////////////////////////////////////////////////////////
// OpenCV pedestrian detection examples.
// Written  by darkpgmr (http://darkpgmr.tistory.com), 2013

#include <iostream>
#include "use_opencv.h"

#ifndef __APPLE__
#include <windows.h>
#endif

#include <cpprest/http_client.h>
#include <cpprest/filestream.h>
#include<cpprest/json.h>
#include <utility>

#include<time.h>

using namespace web;
using namespace web::http;
using namespace web::http::client;
using namespace std;

//1분동안 사람수를 담는 구조체
struct Info{
	Info(int num, clock_t time) {
		Num = num;
		Time = time;
	}
	int Num;
	clock_t Time;
};

void detect_default_people(VideoCapture *vc);
void detect_hog_inria(VideoCapture *vc);
void detect_hog_daimler(VideoCapture *vc);		//가장 성능 좋음
void detect_hogcascades(VideoCapture *vc);
void detect_haarcascades(VideoCapture *vc);
void record_info(list <Info>& infoList, Info info);

// 서버에 post 요청할 list
list <Info> infoList;

int main(int argc, char* argv[])
{
	//select image source
	char data_src;
	cout << "  1. camera input (640 x 480)\n"
		 << "  2. camera input (320 x 240)\n"
		 << "  3. video file input (*.avi)\n";
	cout << "select video source[1-3]: ";
	cin >> data_src;

	VideoCapture *vc = NULL;
	if(data_src=='1')
	{
		//camera (vga)
		vc = new VideoCapture(0);
		if (!vc->isOpened())
		{
			cout << "can't open camera" << endl;
			return 0;
		}
		vc->set(CV_CAP_PROP_FRAME_WIDTH, 640);
		vc->set(CV_CAP_PROP_FRAME_HEIGHT, 480);
	}
	else if(data_src=='2')
	{
		//camera(qvga)
		vc = new VideoCapture(0);
		if (!vc->isOpened())
		{
			cout << "can't open camera" << endl;
			return 0;
		}
		vc->set(CV_CAP_PROP_FRAME_WIDTH, 320);
		vc->set(CV_CAP_PROP_FRAME_HEIGHT, 240);
	}
	else if(data_src=='3')
	{
#ifndef __APPLE__
		char cur_path[255];
		//::GetCurrentDirectory(255, cur_path);

		//video (avi)
		OPENFILENAME ofn;       // common dialog box structure
		char szFile[MAX_PATH] = "";  // buffer for file name
		ZeroMemory(&ofn, sizeof(OPENFILENAME));
		ofn.lStructSize = sizeof(OPENFILENAME);
		ofn.hwndOwner = NULL;
		//ofn.lpstrFile = szFile;
		ofn.nMaxFile = sizeof(szFile);
		//ofn.lpstrFilter = _T("Avi Files(*.avi)\0*.avi\0All Files (*.*)\0*.*\0");
		ofn.nFilterIndex = 1;
		ofn.lpstrFileTitle = NULL;
		ofn.nMaxFileTitle = 0;
		ofn.lpstrInitialDir = NULL;
		ofn.Flags = OFN_PATHMUSTEXIST | OFN_FILEMUSTEXIST;
		if(::GetOpenFileName(&ofn)==false) return 0;

//		::SetCurrentDirectory(cur_path);

		//vc = new VideoCapture("mitsubishi_768x576.avi");
		vc = new VideoCapture("donbang1.avi");
		if (!vc->isOpened())
		{
			cout << "can't open video file" << endl;
			return 0;
		}
#endif
	}
	else
		return 0;

	//select pedestrian detection method
	char method;
	cout << endl;
	cout << "  0. DEFAULT\n"
         << "  1. HOG (INRIA)\n"
		 << "  2. HOG (Daimler)\n"
		 << "  3. hogcascades\n"
		 << "  4. haarcascades\n";
	cout << "select detection method[1-4]: ";
	cin >> method;

	if(vc)
	{
		if(method=='0') detect_default_people(vc);
		if(method=='1') detect_hog_inria(vc);
		if(method=='2') detect_hog_daimler(vc);
		if(method=='3') detect_hogcascades(vc);
		if(method=='4') detect_haarcascades(vc);
	}
	if(vc) delete vc;

	destroyAllWindows();

	return 0;
}
void detect_default_people(VideoCapture* vc)
{
	Mat img;
	namedWindow("opencv", CV_WINDOW_AUTOSIZE);
	HOGDescriptor hog;
	hog.setSVMDetector(HOGDescriptor::getDefaultPeopleDetector());

	while (true)
	{
		*vc >> img;
		if (img.empty())
			continue;

		vector<Rect> found, found_filtered;
		hog.detectMultiScale(img, found, 0, Size(8, 8), Size(32, 32), 1.05, 2);
        
		record_info(infoList, Info((int)found.size(), clock()));
        
		size_t i, j;
		for (i = 0; i<found.size(); i++)
		{
			Rect r = found[i];
			for (j = 0; j<found.size(); j++)
				if (j != i && (r & found[j]) == r)
					break;
			if (j == found.size())
				found_filtered.push_back(r);
		}

		for (i = 0; i<found_filtered.size(); i++)
		{
			Rect r = found_filtered[i];
			r.x += cvRound(r.width*0.1);
			r.width = cvRound(r.width*0.8);
			r.y += cvRound(r.height*0.07);
			r.height = cvRound(r.height*0.8);
			rectangle(img, r.tl(), r.br(), Scalar(0, 255, 0), 3);
		}

		imshow("opencv", img);
		if (waitKey(10) >= 0)
			break;
	}

}

void detect_hog_inria(VideoCapture *vc)
{
	// detector (64x128 template)
    HOGDescriptor hog;
    hog.setSVMDetector(HOGDescriptor::getDefaultPeopleDetector());

	// parameters
	double hit_thr = 0;
	double gr_thr = 2;

	Mat frame;
	__int64 freq,start,finish;
	//::QueryPerformanceFrequency((_LARGE_INTEGER*)&freq);
	while(1)
	{
		// input image
		*vc >> frame;
		if(frame.empty()) break;

		//::QueryPerformanceCounter((_LARGE_INTEGER*)&start);

		// detect
		vector<Rect> found;
        hog.detectMultiScale(frame, found, hit_thr, Size(8,8), Size(32,32), 1.05, gr_thr);

		record_info(infoList, Info((int)found.size(), clock()));

		// processing time (fps)
		//::QueryPerformanceCounter((_LARGE_INTEGER*)&finish);
		double fps = freq / double(finish - start + 1);
		char fps_str[20];
		//sprintf_s(fps_str, 20, "FPS: %.1lf", fps);
		putText(frame, fps_str, Point(5, 35), FONT_HERSHEY_SIMPLEX, 1., Scalar(0,255,0), 2);

		// draw results (bounding boxes)
		for(int i=0; i<(int)found.size(); i++)
			rectangle(frame, found[i], Scalar(0,255,0), 2);

		// display
		imshow("darkpgmr", frame);
		char ch = waitKey(10);
		if( ch == 27 ) break;				// ESC Key
		else if(ch == 32 )					// SPACE Key
		{
			while((ch = waitKey(10)) != 32 && ch != 27);
			if(ch == 27) break;
		}
	}
}

void detect_hog_daimler(VideoCapture *vc)
{
	// detector (48x96 template)
    HOGDescriptor hog(Size(48,96), Size(16,16), Size(8,8), Size(8,8), 9);
	hog.setSVMDetector(HOGDescriptor::getDaimlerPeopleDetector());

	// parameters
	double hit_thr = 1.2;
	double gr_thr = 6;

	// run
	Mat frame;
	__int64 freq,start,finish;
	//::QueryPerformanceFrequency((_LARGE_INTEGER*)&freq);

	while(1)
	{
		// input image
		*vc >> frame;
		if(frame.empty()) break;

		//::QueryPerformanceCounter((_LARGE_INTEGER*)&start);

		// detect
		vector<Rect> found;
        hog.detectMultiScale(frame, found, hit_thr, Size(8,8), Size(32,32), 1.05, gr_thr);

        record_info(infoList, Info((int)found.size(), clock()));

		// processing time (fps)
		//::QueryPerformanceCounter((_LARGE_INTEGER*)&finish);
		double fps = freq / double(finish - start + 1);
		char fps_str[20];
		//sprintf_s(fps_str, 20, "FPS: %.1lf", fps);
		putText(frame, fps_str, Point(5, 35), FONT_HERSHEY_SIMPLEX, 1., Scalar(0,255,0), 2);

		// draw results (bounding boxes)
		for(int i=0; i<(int)found.size(); i++)
			rectangle(frame, found[i], Scalar(0,255,0), 2);

		// display
		imshow("darkpgmr", frame);
		char ch = waitKey(10);
		if( ch == 27 ) break;				// ESC Key
		else if(ch == 32 )					// SPACE Key
		{
			while((ch = waitKey(10)) != 32 && ch != 27);
			if(ch == 27) break;
		}
	}
}

void detect_hogcascades(VideoCapture *vc)
{
	// detector (48x96 template)
	string cascadeName = "hogcascade_pedestrians.xml";
	CascadeClassifier detector;
	if( !detector.load( cascadeName ) )
	{
		cerr << "ERROR: Could not load classifier cascade" << endl;
		return;
	}

	// parameters
	int gr_thr = 6;
	double scale_step = 1.1;
	Size min_obj_sz(48,96);
	Size max_obj_sz(100,200);

	// run
	Mat frame;
	__int64 freq,start,finish;
	//::QueryPerformanceFrequency((_LARGE_INTEGER*)&freq);
	while(1)
	{
		// input image
		*vc >> frame;
		if(frame.empty()) break;

		//::QueryPerformanceCounter((_LARGE_INTEGER*)&start);

		// detect
		vector<Rect> found;
		detector.detectMultiScale(frame, found, scale_step, gr_thr, 0, min_obj_sz, max_obj_sz);

		record_info(infoList, Info((int)found.size(), clock()));

		// processing time (fps)
		//::QueryPerformanceCounter((_LARGE_INTEGER*)&finish);
		double fps = freq / double(finish - start + 1);
		char fps_str[20];
		//sprintf_s(fps_str, 20, "FPS: %.1lf", fps);
		putText(frame, fps_str, Point(5, 35), FONT_HERSHEY_SIMPLEX, 1., Scalar(0,255,0), 2);

		// draw results (bounding boxes)
		for(int i=0; i<(int)found.size(); i++)
			rectangle(frame, found[i], Scalar(0,255,0), 2);

		// display
		imshow("darkpgmr", frame);
		char ch = waitKey(10);
		if( ch == 27 ) break;				// ESC Key
		else if(ch == 32 )					// SPACE Key
		{
			while((ch = waitKey(10)) != 32 && ch != 27);
			if(ch == 27) break;
		}
	}
}

void detect_haarcascades(VideoCapture *vc)
{
	// detector (14x28 template)
	string cascadeName = "haarcascade_fullbody.xml";
	CascadeClassifier detector;
	if( !detector.load( cascadeName ) )
	{
		cerr << "ERROR: Could not load classifier cascade" << endl;
		return;
	}

	// parameters
	int gr_thr = 4;
	double scale_step = 1.1;
	Size min_obj_sz(48,96);
	Size max_obj_sz(100,200);

	// run
	Mat frame;
	__int64 freq,start,finish;
	//::QueryPerformanceFrequency((_LARGE_INTEGER*)&freq);
	while(1)
	{
		// input image
		*vc >> frame;
		if(frame.empty()) break;

		//::QueryPerformanceCounter((_LARGE_INTEGER*)&start);

		// detect
		vector<Rect> found;
		detector.detectMultiScale(frame, found, scale_step, gr_thr, 0, min_obj_sz, max_obj_sz);

		record_info(infoList, Info((int)found.size(), clock()));

		// processing time (fps)
		//::QueryPerformanceCounter((_LARGE_INTEGER*)&finish);
		double fps = freq / double(finish - start + 1);
		char fps_str[20];
		//sprintf_s(fps_str, 20, "FPS: %.1lf", fps);
		putText(frame, fps_str, Point(5, 35), FONT_HERSHEY_SIMPLEX, 1., Scalar(0,255,0), 2);

		// draw results (bounding boxes)
		for(int i=0; i<(int)found.size(); i++)
			rectangle(frame, found[i], Scalar(0,255,0), 2);

		// display
		imshow("darkpgmr", frame);
		char ch = waitKey(10);
		if( ch == 27 ) break;				// ESC Key
		else if(ch == 32 )					// SPACE Key
		{
			while((ch = waitKey(10)) != 32 && ch != 27);
			if(ch == 27) break;
		}
	}
}

void record_info(list <Info>& infoList, Info info)
{
			//info를 담는다
		infoList.push_back(info);
		
		//1분마다 post  요청 보냄
		if ((infoList.back().Time - infoList.front().Time) / CLOCKS_PER_SEC > 60)
		{
			int sum = 0;
			int size = (int)infoList.size();
			for (int i = 0; i < size; i++)
			{
				sum += infoList.front().Num;
				infoList.pop_front();
			}

			// 1분마다 보내는 평균인원
			int AVG = sum / size + 1;

			// 시간 보내줌
			struct tm *t = NULL;
			time_t timer = time(NULL);

#ifdef __APPLE__
			t = localtime(&timer);
            
            string stime = to_string(t->tm_hour) + "h " + to_string(t->tm_min) + "m " +
            to_string(t->tm_sec) + "s ";
            
            json::value obj;
            
            wstring ws;
            ws.assign(stime.begin(), stime.end());
            obj["title"] = json::value::string(stime);
            obj["num"] = json::value::number(AVG);
            
            cout << obj << endl;
            
            //http post request
            http_client client(U("http://localhost:3000/count"));
            
            http_request request(methods::POST);
            request.headers().add("Content-Type", "application/json; charset=UTF-8");
            request.headers().add("Content-Length", "100");
            request.headers().add("Host", "testhost.com");
            request.headers().add("X-Requested-With", "XMLHttpRequest");
            request.set_body(obj);
            
            auto resp = client.request(request).get();
            
            cout << U("STATUS : ") << resp.status_code() << endl;
            cout << "content-type : " << resp.headers().content_type() << endl;
            cout << resp.extract_string(true).get() << endl;
#else
			localtime_s(t, &timer);
            
            string stime = to_string(t->tm_hour) + "h " + to_string(t->tm_min) + "m " +
            to_string(t->tm_sec) + "s ";
            
			obj[L"title"] = json::value::string(ws);
			obj[L"num"] = json::value::number(AVG);

			wcout << obj << endl;

			//http post request
			http_client client(U("http://localhost:3000/count"));

			http_request request(methods::POST);
			request.headers().add(L"Content-Type", L"application/json; charset=UTF-8");
			request.headers().add(L"Content-Length", L"100");
			request.headers().add(L"Host", L"testhost.com");
			request.headers().add(L"X-Requested-With", L"XMLHttpRequest");
			request.set_body(obj);
            
            auto resp = client.request(request).get();
            
            wcout << U("STATUS : ") << resp.status_code() << endl;
            wcout << "content-type : " << resp.headers().content_type() << endl;
            wcout << resp.extract_string(true).get() << endl;
#endif

		}
}