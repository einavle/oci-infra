from flask import Flask, request, json
from bqsender import *
import os

app = Flask(__name__)
bq=BQ()

@app.route('/')
def home():
    return "<p>Hello from <b>big query sender!</b><br> \
            I'm alive!<br> \
            Try me and find more info about me on cybereason confluence pages</p>"


@app.route('/setdata', methods=['POST'])
def setdata():
    content_type = request.headers.get('Content-Type')
    if (content_type == 'application/json'):
        try:
            data = json.loads(request.data)
            return bq.setdata(data)
        except:
            return f'Error! payload expected to be in a valid json format.<br> \
                    Unable to process this payload:<br>{request.data}'
        
    else:
        return f'Content-Type {content_type} is not supported.<br>Only application/json Content-Type is supported!'

@app.route('/tryit')
def select():
    return f'<p>{bq.tryit()}</p>'


if __name__ == "__main__":
    port = int(os.environ.get('PORT', 5001))
    app.run(debug=True, host='0.0.0.0', port=port)