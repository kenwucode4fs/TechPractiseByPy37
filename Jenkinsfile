pipeline {
  parameters {
        string defaultValue: '1.0.0', description: '镜像主版本', name: 'TEST_TAG', trim: true
        string defaultValue: '/Users/kenwu/Documents/TechSet/logs', description: '宿主机日志路径', name: 'HOST_LOGS_PATH', trim: true
        string defaultValue: '8102', description: '宿主机服务暴露端口', name: 'HOST_PORT', trim: true
        string defaultValue: 'techpractisebypy37', description: '镜像名称', name: 'PACKAGE_NAME', trim: true
    }

  agent { dockerfile true}
  stages {
    stage('BuildImage') {
      steps {
        sh 'docker build -t ${PACKAGE_NAME}:v${TEST_TAG}.${BUILD_NUMBER} .'
        sh 'echo ${TEST_TAG}'
        sh 'echo ${WORKSPACE}'
        sh 'echo ${HOST_LOGS_PATH}'
        sh 'echo ${HOST_PORT}'
        sh 'echo ${PACKAGE_NAME}'
      }
    }

    stage('RunContainer') {
      steps {
        sh 'docker stop ${PACKAGE_NAME}'
        sh 'docker rm ${PACKAGE_NAME}'
        sh 'docker run --user=kenwu:kenwu --name ${PACKAGE_NAME} -v ${WORKSPACE}:/kenwu/app  -v ${HOST_LOGS_PATH}:/logs/app -p ${HOST_PORT}:8002  --privileged=true -itd ${PACKAGE_NAME}:${TEST_TAG}.${BUILD_NUMBER}'
      }
    }

    stage('Complete') {
      steps {
        sh 'echo ${TEST_TAG}'
        sh 'echo ${WORKSPACE}'
        sh 'echo ${HOST_LOGS_PATH}'
        sh 'echo ${HOST_PORT}'
        sh 'echo ${PACKAGE_NAME}'
      }
    }
  }
}