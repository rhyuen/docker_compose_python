FROM python:2.7
MAINTAINER rhyuen

#ADD NON-ROOT USER
RUN useradd --user-group --create-home --shell /bin/false nonrootuser
USER nonrootuser

ADD . /code
WORKDIR /code
RUN pip install -r requirements.txt
CMD ["python", "app.py"]
