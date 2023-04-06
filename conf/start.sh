#!/bin/bash

cd /kenwu/kenwuapp/app/

pip install -r /kenwu/kenwuapp/conf/requirements.txt
gunicorn -c /kenwu/kenwuapp/conf/gunicorn.conf.py techpractiserun:app
