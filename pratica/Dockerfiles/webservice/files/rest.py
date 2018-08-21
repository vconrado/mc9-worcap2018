from flask import Flask
from flask import jsonify
import psycopg2
import psycopg2.extras

app = Flask(__name__)

@app.route("/")
def hello():
    return "Hello World!"

@app.route("/usuarios")
def usuarios():
    try:
        conn = psycopg2.connect("dbname='teste' user='postgres' host='pg' password='dbpass'")
        cur = conn.cursor(cursor_factory=psycopg2.extras.DictCursor)
        cur.execute("""SELECT * from public.usuario""")
        rows = cur.fetchall()
        return  jsonify(rows)   
    except:
        return "I am unable to connect to the database"

if __name__ == '__main__':
    app.run(host='0.0.0.0')
