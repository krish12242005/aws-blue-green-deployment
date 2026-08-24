from flask import Flask

app = Flask(__name__)

@app.route("/")
def home():
    return """
    <html>
        <head>
            <title>Blue-Green Deployment</title>
        </head>
        <body>
            <h1>Blue-Green Deployment</h1>
            <h2>Version 1.0 - BLUE</h2>
            <p>Application is running successfully.</p>
        </body>
    </html>
    """

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)