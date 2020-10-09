pipeline {

    agent any

    stages{

        stage("build"){
            docker build -t hello-golang:$BUILD_NUMBER .
        }
    }
}
