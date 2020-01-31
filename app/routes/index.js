var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Transit Data Manager' });
});

router.get('/login', function(req, res, next){
  res.render('login', { title: 'Login | Transit Data Manager'})
});

module.exports = router;
