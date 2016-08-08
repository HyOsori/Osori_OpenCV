var express = require('express'),
    Count = require('../models/count');

var exportVar = require('./index');
var inmemoryCount = exportVar._inmemoryCount;

var router = express.Router();

router.get('/',function(req, res, next){
   //res.render('count',counts)
   //res.json(counts);
   Count.find({},function(err,counts){
      if(err){
         return next(err);
      }

      console.log(inmemoryCount);

      res.render('count',{counts: counts});
   });

});

router.get('/:id',function(req, res){
   var count = counts[req.params.id]; // counts[0]
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

   newCount.save(function(err){
      if(err){
         return next(err);
      }else{
         res.json(req.body);
      }
   });

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
