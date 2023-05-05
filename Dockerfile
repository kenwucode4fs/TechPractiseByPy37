FROM python:3.7.9

# 创建目录
WORKDIR /kenwu/app
COPY requirements.txt ./

# 安装第三方包
RUN pip install --upgrade pip \
    && pip install -r requirements.txt \
    && groupadd -r kenwu \
    && useradd -r -g kenwu kenwu \
    && mkdir -p /logs/app \
    && touch /logs/app/gunicorn.error.log \
    && touch /logs/app/gunicorn.access.log \
    && chown -R kenwu:kenwu /logs \
    && chmod -R 755 /logs

# 暴露端口
EXPOSE 8002

# 使用用户kenwu
USER kenwu
# 启动容器时，执行脚本
ENTRYPOINT ["gunicorn", "-c", "./gunicorn.conf.py", "hello.techpractiserun:app"]
