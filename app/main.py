import flask

app = flask.Flask(__name__, static_url_path='')

@app.route('/')
def index():
    return flask.render_template('index.html')

@app.route('/img/<path>')
def serve_images(path: str):
    return flask.send_from_directory('public/img', path)

@app.route('/stylesheets/<path>')
def serve_css(path: str):
    return flask.send_from_directory('public/css', path)