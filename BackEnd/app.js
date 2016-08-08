var express = require('express');
var path = require('path'); //파일경로
var logger = require('morgan'); //로그인 모듈
var cookieParser = require('cookie-parser'); //쿠키처리 모듈
var bodyParser = require('body-parser'); //바디내용들을 해석
var mongoose =require('mongoose'); // db 활용툴

var routes = require('./routes/index'); //라우트

var count = require('./routes/count');

var app = express();

app.locals.num= "3"; // webpage어디서든지 부를수 있다.
app.locals.jdata = require('./jdata.json')

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs'); // jade 등

// uncomment after placing your favicon in /public
//app.use(favicon(path.join(__dirname, 'public', 'favicon.ico')));
app.use(logger('dev'));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));


app.use('/', routes);
app.use('/count',count);

//db 접속 로그인 처리
mongoose.connect('mongodb://chikinmukjja:osori@ds023245.mlab.com:23245/osoritracking');
mongoose.connection.on('error',console.log);


// catch 404 and forward to error handler
app.use(function(req, res, next) {
  var err = new Error('Not Found');
  err.status = 404;
  next(err);
});

// error handlers

// development error handler
// will print stacktrace
if (app.get('env') === 'development') {
  app.use(function(err, req, res, next) {
    res.status(err.status || 500);
    res.render('error', {
      message: err.message,
      error: err
    });
  });
}

// production error handler
// no stacktraces leaked to user
app.use(function(err, req, res, next) {
  res.status(err.status || 500);
  res.render('error', {
    message: err.message,
    error: {}
  });
});


module.exports = app;
