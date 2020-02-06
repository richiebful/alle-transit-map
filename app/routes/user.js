var express = require('express');
var router = express.Router();

/* GET users listing. */
router.get('/create', function(req, res, next) {
    res.render('user_create', { title: 'Transit Data Manager' });
});

router.get('/create', function(req, res, next) {
    
});

module.exports = router;
