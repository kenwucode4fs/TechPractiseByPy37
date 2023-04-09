# -*- coding: utf-8 -*-

"""
@File:         techpractiserun
@Description:  
@Author:       kenwu
@Date:         2023/4/3
@Email: 370483689@qq.com
"""
from flask import Flask

app = Flask(__name__)


@app.route('/hello')
def hello():
    """
    健康检查，hello接口
    :return:
    """
    return "<p>Hello, This is TechPractiseByPy37!</p>"


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8082, debug=app.config['DEBUG'])
