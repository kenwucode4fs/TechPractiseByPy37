pipeline {
  parameters {
        string defaultValue: '1.0.0', description: '镜像主版本', name: 'TEST_TAG', trim: true
        string defaultValue: $WORKSPACE, description: '宿主机代码路径', name: 'HOST_CODE_PATH', trim: true
        string defaultValue: '/Users/kenwu/Documents/TechSet/logs', description: '宿主机日志路径', name: 'HOST_LOGS_PATH', trim: true
        string defaultValue: '8102', description: '宿主机服务暴露端口', name: 'HOST_PORT', trim: true
        string defaultValue: 'techpractisebypy37', description: '镜像名称', name: 'PACKAGE_NAME', trim: true
    }

  agent any
  stages {
    stage('Build') {
      steps {
        sh 'echo \'hello world!\''
      }
    }
  }
}