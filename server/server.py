"""
server.py
===============================================================================
Last Modified: 16 May 2021
Modification By: Bryan Carl
Creation Date: 16 May 2021
Initial Author: Bryan Carl
===============================================================================
"""

from flask import Flask, render_template
from flask_restful import Api
import logging

# Some environment vars, don't mind me
ENV = 'production'
PORT = input("Please enter a PORT you would like to host on (four digits 0-9): ")
HOST = '0.0.0.0'

# Setup Apps/API
app = Flask(__name__)
api = Api(app)


# App routing
@app.route("/")
def index():
    return render_template("index.html")


if __name__ == "__main__":
    try:
        # Setup basic logging
        logging.basicConfig(filename='../tmp/server.log', level=logging.DEBUG,
                            format="%(asctime)s - %(levelname)s - %(message)s",
                            datefmt="%m/%d/%Y %H:%M:%S %p")
        try:
            # Attempt to run the app
            print("\n\t* Running on http://0.0.0.0:{} *\n".format(PORT))
            print("Unless Hosted on a domain, then replace the '0.0.0.0' with your domain")

            # Run the app and get the successful exit
            app.run(host=HOST, port=PORT, debug=False)
            app.logger.info("Successfully exited app")

        except Exception as ex:
            # Unsure which is being tripped so we have to check
            app.logger.warning("Could not host Flask App")
            app.logger.exception(ex.__traceback__)

    except FileNotFoundError as ex:
        print(ex)
        print("Unable to setup logging, please ensure you have ran the build script")