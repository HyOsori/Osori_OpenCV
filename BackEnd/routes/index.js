var express = require('express');
var router = express.Router();

/* GET home page. */

global.inmemoryCount = [
  {
    time:'00h 00m 00s',
    num:0
  }
];

var inmemoryReply = [
  {
  time: '00h 00m 00s',
  Reply: 'hello world'
  }
];

router.get('/', function(req, res, next) {
  res.render('frontend_index', { counts: inmemoryCount, reply: inmemoryReply }); //title을 매개변수로 넘김
});

router.post('/',function(req,res,next){
  if(inmemoryCount.length<10) {
    inmemoryReply.push(req.body);
  }else{
    inmemoryReply.splice(1,0);
  }
  res.render('frontend_index',{ counts: inmemoryCount, reply: inmemoryReply });
});

module.exports = router;
