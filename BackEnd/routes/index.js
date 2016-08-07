var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'OpenCV Project',name: 'pjw' }); //title을 매개변수로 넘김

});

module.exports = router;
