import flask
import hashlib
import os
import pyodbc

app = flask.Flask(__name__, static_url_path='')

@app.route('/')
def index():
    return flask.render_template('index.html')

@app.route('/login')
def get_login():
    return flask.render_template('login.html')

@app.route('/login', methods=['POST'])
def post_login():
    return 'You are logged in'

@app.route('/signup')
def get_signup():
    return flask.render_template('signup.html')

@app.route('/signup', methods=['POST'])
def post_signup():
    form = flask.request.form
    if form['password'] != form['confirm_password']:
        raise Exception()
    salt = os.urandom(512)
    password = bytes(form['password'], 'utf-8')
    hash = hashlib.scrypt(password, salt=salt, n=16, r=8, p=1)

@app.route('/img/<path>')
def serve_images(path: str):
    return flask.send_from_directory('public/img', path)

@app.route('/css/<path>')
def serve_css(path: str):
    return flask.send_from_directory('public/css', path)


@app.route('/js/<path>')
def serve_js(path: str):
    return flask.send_from_directory('public/js', path)