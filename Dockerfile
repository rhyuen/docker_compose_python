FROM python:2.7
MAINTAINER rhyuen

RUN mkdir code

#ADD NON-ROOT USER
RUN useradd --user-group --create-home --shell /bin/false nonrootuser

#COPY REQ and CODE separately to prevent reruns of pip install when code changes are made and no dependency changes
COPY requirements.txt /code
WORKDIR /code
#make so that non-admin users can call pip on requirements.txt
RUN chown -R nonrootuser:nonrootuser /code/*
RUN pip install -r requirements.txt
COPY . /code
USER nonrootuser

CMD ["python", "app.py"]
