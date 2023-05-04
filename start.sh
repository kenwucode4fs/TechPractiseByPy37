#!/bin/bash

# 创建日志路径及文件
mkdir logs
touch  ./logs/gunicorn.error.log
touch  ./logs/gunicorn.access.log

gunicorn -c ./gunicorn.conf.py hello.techpractiserun:app --daemon

# 保留一个 bash
/bin/bash
