FROM python:3.7.9
MAINTAINER kenwu/370483689@qq.com

# 将代码复制到镜像中的目录下
#COPY ./ /kenwu/kenwuapp/app

# 设置镜像中的工作路径，并将宿主机的当前路径的程序文件拷贝到工作路径
WORKDIR /kenwu/kenwuapp/app

COPY requirements.txt ./

# 安装第三方包
RUN pip install --upgrade pip \
    && pip install -r requirements.txt

# 创建日志文件目录及文件
RUN mkdir logs \
    && touch ./logs/gunicorn.error.log \
    && touch ./logs/gunicorn.access.log
    
# 暴露端口
EXPOSE 8002

# 启动容器时，执行脚本
ENTRYPOINT ["gunicorn", "-c", "./gunicorn.conf.py", "techpractiserun:app"]