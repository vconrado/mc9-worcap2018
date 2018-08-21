# -*- coding=utf-8 -*-

from flask import Flask
from flask import jsonify
import psycopg2
import psycopg2.extras

app = Flask(__name__)

@app.route("/")
def hello():
    return "Hello World!"

@app.route("/minicursos")
def usuarios():
    try:
        conn = psycopg2.connect("dbname='worcap' user='postgres' host='pg' password='dbpass'")
        conn.set_client_encoding('UTF-8')
        cur = conn.cursor(cursor_factory=psycopg2.extras.DictCursor)
        cur.execute("SELECT * from minicurso")
        rows = cur.fetchall()
        return  jsonify(rows)   
    except Exception as e:
        return "I am unable to connect to the database {}".format(e)

if __name__ == '__main__':
    app.run(host='0.0.0.0')
