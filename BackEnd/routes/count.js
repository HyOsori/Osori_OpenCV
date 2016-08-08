var express = require('express'),
    Count = require('../models/count');

var exportVar = require('./index');

var router = express.Router();

router.get('/',function(req, res, next){
   //res.render('count',counts)
   //res.json(counts);
      console.log(inmemoryCount);
      res.json(inmemoryCount);

});

router.get('/:id',function(req, res){
   var count = inmemoryCount[req.params.id]; // counts[0]
   res.json(count);
});

router.post('/',function(req, res){
   /*console.log(req.body);
   counts.push(req.body);
   res.json(req.body);
   */
   var newCount = new Count({
      time: req.body.title,
      num: req.body.num,
   });

   //DB저장
   newCount.save(function(err){
      if(err){
         return next(err);
      }else{
         res.json(req.body);
      }
   });
   //memory캐싱
   inmemoryCount.push(newCount);

});

router.put('/:id',function(req, res){
   var count = req.body;
   var countToEdit = counts[req.params.id];
   countToEdit = count;
   counts.push(countToEdit);
   res.json(countToEdit);
});

router.delete('/:id',function(req, res){
   counts.splice(1,req.params.id);
   res.json(count)
});


/* GET count page. */
//router.get('/', function(req, res, next) {


//});

module.exports = router;
