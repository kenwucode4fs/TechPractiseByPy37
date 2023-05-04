FROM python:3.7.9
MAINTAINER kenwu/370483689@qq.com

# 设置镜像中的工作路径，并将宿主机的当前路径的程序文件拷贝到工作路径
WORKDIR /kenwu/kenwuapp/app

COPY requirements.txt ./

# 安装第三方包
RUN pip install --upgrade pip \
    && pip install -r requirements.txt

# 暴露端口
EXPOSE 8002

# 设置运行命令
ENTRYPOINT ["python3"]
CMD ["gunicorn", "-c", "./gunicorn.conf.py", "techpractiserun:app"]