FROM python:3.6
LABEL maintainer="Vitor Gomes <vconrado@gmail.com>"

EXPOSE 5000

RUN pip3 install flask psycopg2 psycopg2-binary

RUN mkdir /data
COPY files/rest.py /data

CMD  ["python", "/data/rest.py"]
