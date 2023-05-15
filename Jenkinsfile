pipeline {
  parameters {
        string defaultValue: '1.0.0', description: '镜像主版本', name: 'TEST_TAG', trim: true
        string defaultValue: '/Users/kenwu/Documents/TechSet/logs', description: '宿主机日志路径', name: 'HOST_LOGS_PATH', trim: true
        string defaultValue: '8102', description: '宿主机服务暴露端口', name: 'HOST_PORT', trim: true
        string defaultValue: 'techpractisebypy37', description: '镜像名称', name: 'PACKAGE_NAME', trim: true
    }

  agent any
  stages {
    stage('清理历史镜像及容器'){
      steps {
        sh '''
            CONTAINER_ID=`docker ps |grep ${PACKAGE_NAME} |awk '{print $1}''
            IMAGE_ID=`docker images |grep ${PACKAGE_NAME} |awk \'{print $3}\'`
            echo "CONTAINER_ID : $CONTAINER_ID"
            echo "IMAGE_ID : $IMAGE_ID"
            if [ "$IMAGE_ID" !=  "" ] ; then
                if [ "$CONTAINER_ID" !=  "" ] ; then
                    CONTAINER_INFO=`docker ps |grep ${PACKAGE_NAME} |awk \'{print $0}\'`
                    echo "删除容器 $CONTAINER_INFO"
                    docker rm -f $CONTAINER_ID
                    fi
                    IMAGE_INFO=`docker images |grep ${PACKAGE_NAME} |awk \'{print $0}\'`
                    echo "删除镜像 $IMAGE_INFO"
                    docker rmi -f $IMAGE_ID
            fi
        '''
      }
    }

    stage('编译镜像') {
      steps {
        sh '''
        docker build -t ${PACKAGE_NAME}:v${TEST_TAG}.${BUILD_NUMBER} .
        echo ${TEST_TAG}
        echo ${WORKSPACE}
        echo ${HOST_LOGS_PATH}
        echo ${HOST_PORT}
        echo ${PACKAGE_NAME}
        '''
      }
    }

    stage('启动容器') {
      steps {
        sh 'docker run --user=kenwu:kenwu --name ${PACKAGE_NAME} -v ${WORKSPACE}:/kenwu/app  -v ${HOST_LOGS_PATH}:/logs/app -p ${HOST_PORT}:8002  --privileged=true -itd ${PACKAGE_NAME}:${TEST_TAG}.${BUILD_NUMBER}'
      }
    }

  }
}