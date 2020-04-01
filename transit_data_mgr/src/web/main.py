import auth
import flask
import hashlib
import os
import psycopg2

connection = psycopg2.connect(os.getenv('DATABASE_CONNSTRING'))
app = flask.Flask(__name__, static_url_path='')
#TODO remove connstring

@app.route('/')
def index():
    return flask.render_template('index.html')

@app.route('/login')
def get_login():
    return flask.render_template('login.html')

@app.route('/login', methods=['POST'])
def post_login():
    form = flask.request.form
    cursor = connection.cursor()
    cursor.execute('''SELECT salt, password_hash
                      FROM user_account
                      WHERE email_address = %s''', (form['email'],))
    #TODO first check if user exists
    salt, stored_hash = cursor.fetchone()
    if salt and auth.check_password_hash(stored_hash, form['password'], salt):
        return 'You are successfully logged in'
    else:
        return 'Wrong password, try'

@app.route('/signup')
def get_signup():
    return flask.render_template('signup.html')

@app.route('/signup', methods=['POST'])
def post_signup():
    form = flask.request.form
    if form['password'] != form['confirm_password']:
        raise Exception()
    elif form['email'] is None:
        raise Exception()
    email_address = form['email']
    salt = os.urandom(512)
    password_hash, salt = auth.generate_password_hash(form['password'])
    cursor = connection.cursor()
    cursor.execute('''SELECT user_key
                      FROM user_account
                      WHERE email_address = %s''', (email_address,))
    if cursor.fetchone() is not None:
        raise Exception(f'User {email_address} already exists')

    cursor.execute('''INSERT INTO user_account (
                        email_address,
                        password_hash,
                        salt              
                    ) VALUES (%s, %s, %s);''', (email_address, password_hash, salt))
    cursor.commit()
    return f'Successful user creation for {email_address}'

@app.route('/img/<path>')
def serve_images(path: str):
    return flask.send_from_directory('public/img', path)

@app.route('/css/<path>')
def serve_css(path: str):
    return flask.send_from_directory('public/css', path)


@app.route('/js/<path>')
def serve_js(path: str):
    return flask.send_from_directory('public/js', path)