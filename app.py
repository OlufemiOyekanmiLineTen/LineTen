from flask import Flask

app = Flask(__name__)

@app.route('/')
def index():
    return "Hello LineTen, it's Olufemi"

app.run(host='0.0.0.0', port=80)