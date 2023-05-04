#!/bin/bash

cd /kenwu/kenwuapp/app

gunicorn -c /kenwu/kenwuapp/app/conf/gunicorn.conf.py techpractiserun:app
