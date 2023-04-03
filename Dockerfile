FROM python:3.7.9
WORKDIR /var/app

COPY requirements.txt ./

RUN pip install -r requirements.txt

CMD ["gunicorn", "-c", "gunicorn.conf.py", "techpractiserun:app"]
EXPOSE 8002
