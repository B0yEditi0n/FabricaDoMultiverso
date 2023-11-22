from flask import Flask, request, jsonify

app = Flask(__name__)

@app.route('/') 
def home():
    return 'home'

if __name__ == '__main__':
    app.run()
    # app.run(debug=True)
