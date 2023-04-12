# -*- coding: utf-8 -*-

"""
@File:         gunicorn.conf_hello
@Description:  
@Author:       kenwu
@Date:         2023/4/3
@Email: 370483689@qq.com
"""
import multiprocessing

bind = "0.0.0.0:8002"
workers = 2  # workers是工作进程数，一般设置成：服务器CPU个数 + 1
worker_class = "gevent" # 采用gevent库，支持异步处理请求，提高吞吐量
daemon = False
loglevel = 'info'
access_log_format = '%(t)s %(p)s %(h)s "%(r)s" %(s)s %(L)s %(b)s %(f)s" "%(a)s"'
errorlog = '/Users/kenwu/Documents/TechSet/TechPractiseByPy37/logs/gunicorn.error.log'
accesslog = '/Users/kenwu/Documents/TechSet/TechPractiseByPy37/logs/gunicorn.access.log'
debug = False
