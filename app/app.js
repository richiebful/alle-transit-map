require('dotenv').config()
var createError = require('http-errors');
var express = require('express');
const session = require('express-session')
const uuid = require('uuid/v4')
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
var SqlConnection = require('tedious').Connection;
var SqlRequest = require('tedious').Request;

var indexRouter = require('./routes/index');
var userRouter = require('./routes/user');

var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'hbs');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));
console.log(process.env.SESSION_SECRET);
app.use(session({
  genid: (req) => {
    return uuid()
  },
  secret: process.env.SESSION_SECRET,
  resave: false,
  saveUninitialized: true
}))

app.use('/', indexRouter);
app.use('/user', userRouter);
app.use('/img', express.static(__dirname + '/public/img')); // redirect bootstrap JS
app.use('/js', express.static(__dirname + '/node_modules/bootstrap/dist/js')); // redirect bootstrap JS
app.use('/js', express.static(__dirname + '/node_modules/jquery/dist')); // redirect JS jQuery
app.use('/css', express.static(__dirname + '/node_modules/bootstrap/dist/css')); // redirect CSS bootstrap

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

var sqlConfig = {
  server: process.env.SQL_SERVER_URL,
    options: {},
    authentication: {
      type: "default",
      options: {  
        userName: process.env.SQL_SERVER_USERNAME,
        password: process.env.SQL_SERVER_PASSWORD,
      }
    }
};

var conn = new SqlConnection(sqlConfig);
conn.on('connect', function(err) {
  if(err) {
    console.log('Error: ', err)
  }
  
  var request = new SqlRequest("select 42, 'hello world'", function(err, rowCount) {
    if (err) {
      console.log(err);
    } else {
      console.log(rowCount + ' rows');
    }
  });
  
  conn.execSql(request);
});


module.exports = app;
