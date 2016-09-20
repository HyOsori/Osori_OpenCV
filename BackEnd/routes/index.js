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

];

router.get('/', function(req, res, next) {
  res.render('frontend_index', { counts: inmemoryCount, reply: inmemoryReply }); //title을 매개변수로 넘김
});

router.post('/',function(req,res,next){
  inmemoryReply.push(req.body);

  if(inmemoryReply.length>=10)
    inmemoryReply.splice(0,1);

  console.log(inmemoryReply);
  res.json(inmemoryReply[inmemoryReply.length-1]);
});

module.exports = router;
