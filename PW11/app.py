from flask import Flask
from markupsafe import escape
import logging
import sys

log = logging.getLogger(__name__)
log.setLevel(logging.INFO)

# disable flask logging
logger = logging.getLogger('werkzeug')
logger.setLevel(logging.ERROR)

# out = logging.FileHandler('app.log')  # log to file
out = logging.StreamHandler(sys.stdout)  # log to stdout

formatter = logging.Formatter(
    '{"time":"%(asctime)s", "num": "%(message)s"}', "%Y-%m-%d %H:%M:%S"
)

out.setFormatter(formatter)

log.addHandler(out)

app = Flask(__name__)

@app.route("/<int:num>")
def double(num):
    log.info(num)
    return f"{escape(num)} * 2 = {num*2}"

@app.route("/")
def main():
     return '<p><a href="../2">Click me</a></p>'
 
if __name__ == "__main__":
    app.run(host='0.0.0.0')