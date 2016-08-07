///////////////////////////////////////////////////////////////////////////
// OpenCV pedestrian detection examples.
// Written  by darkpgmr (http://darkpgmr.tistory.com), 2013

#include "stdafx.h"
#include <iostream>
#include <windows.h>
#include "use_opencv.h"

using namespace std;

void detect_hog_inria(VideoCapture *vc);
void detect_hog_daimler(VideoCapture *vc);
void detect_hogcascades(VideoCapture *vc);
void detect_haarcascades(VideoCapture *vc);

int _tmain(int argc, _TCHAR* argv[])
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
		//camera (qvga)
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
		char cur_path[255];
		::GetCurrentDirectory(255, cur_path);

		//video (avi)
		OPENFILENAME ofn;       // common dialog box structure
		char szFile[MAX_PATH] = "";  // buffer for file name
		ZeroMemory(&ofn, sizeof(OPENFILENAME));
		ofn.lStructSize = sizeof(OPENFILENAME);
		ofn.hwndOwner = NULL;
		ofn.lpstrFile = szFile;
		ofn.nMaxFile = sizeof(szFile);
		ofn.lpstrFilter = _T("Avi Files(*.avi)\0*.avi\0All Files (*.*)\0*.*\0");
		ofn.nFilterIndex = 1;
		ofn.lpstrFileTitle = NULL;
		ofn.nMaxFileTitle = 0;
		ofn.lpstrInitialDir = NULL;
		ofn.Flags = OFN_PATHMUSTEXIST | OFN_FILEMUSTEXIST;
		if(::GetOpenFileName(&ofn)==false) return 0;

		::SetCurrentDirectory(cur_path);

		vc = new VideoCapture(ofn.lpstrFile);
		if (!vc->isOpened())
		{
			cout << "can't open video file" << endl;
			return 0;
		}
	}
	else
		return 0;

	//select pedestrian detection method
	char method;
	cout << endl;
	cout << "  1. HOG (INRIA)\n"
		 << "  2. HOG (Daimler)\n"
		 << "  3. hogcascades\n"
		 << "  4. haarcascades\n";
	cout << "select detection method[1-4]: ";
	cin >> method;

	if(vc)
	{
		if(method=='1') detect_hog_inria(vc);
		if(method=='2') detect_hog_daimler(vc);
		if(method=='3') detect_hogcascades(vc);
		if(method=='4') detect_haarcascades(vc);
	}
	if(vc) delete vc;

	destroyAllWindows();

	return 0;
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
	::QueryPerformanceFrequency((_LARGE_INTEGER*)&freq);
	while(1)
	{
		// input image
		*vc >> frame;
		if(frame.empty()) break;

		::QueryPerformanceCounter((_LARGE_INTEGER*)&start);

		// detect
		vector<Rect> found;
        hog.detectMultiScale(frame, found, hit_thr, Size(8,8), Size(32,32), 1.05, gr_thr);

		// processing time (fps)
		::QueryPerformanceCounter((_LARGE_INTEGER*)&finish);
		double fps = freq / double(finish - start + 1);
		char fps_str[20];
		sprintf_s(fps_str, 20, "FPS: %.1lf", fps);
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
	::QueryPerformanceFrequency((_LARGE_INTEGER*)&freq);
	while(1)
	{
		// input image
		*vc >> frame;
		if(frame.empty()) break;

		::QueryPerformanceCounter((_LARGE_INTEGER*)&start);

		// detect
		vector<Rect> found;
        hog.detectMultiScale(frame, found, hit_thr, Size(8,8), Size(32,32), 1.05, gr_thr);

		// processing time (fps)
		::QueryPerformanceCounter((_LARGE_INTEGER*)&finish);
		double fps = freq / double(finish - start + 1);
		char fps_str[20];
		sprintf_s(fps_str, 20, "FPS: %.1lf", fps);
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
	::QueryPerformanceFrequency((_LARGE_INTEGER*)&freq);
	while(1)
	{
		// input image
		*vc >> frame;
		if(frame.empty()) break;

		::QueryPerformanceCounter((_LARGE_INTEGER*)&start);

		// detect
		vector<Rect> found;
		detector.detectMultiScale(frame, found, scale_step, gr_thr, 0, min_obj_sz, max_obj_sz);

		// processing time (fps)
		::QueryPerformanceCounter((_LARGE_INTEGER*)&finish);
		double fps = freq / double(finish - start + 1);
		char fps_str[20];
		sprintf_s(fps_str, 20, "FPS: %.1lf", fps);
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
	::QueryPerformanceFrequency((_LARGE_INTEGER*)&freq);
	while(1)
	{
		// input image
		*vc >> frame;
		if(frame.empty()) break;

		::QueryPerformanceCounter((_LARGE_INTEGER*)&start);

		// detect
		vector<Rect> found;
		detector.detectMultiScale(frame, found, scale_step, gr_thr, 0, min_obj_sz, max_obj_sz);

		// processing time (fps)
		::QueryPerformanceCounter((_LARGE_INTEGER*)&finish);
		double fps = freq / double(finish - start + 1);
		char fps_str[20];
		sprintf_s(fps_str, 20, "FPS: %.1lf", fps);
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
