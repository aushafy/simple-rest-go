pipeline {

    agent any

    stages{

        stage("build"){
            steps{
               docker build -t harbor.tkgi.vxrail.local/demo/hello-golang:$BUILD_NUMBER .
            }
        }

        stage("test"){
            steps{
                echo "test stage ..."
            }
        }

        stage("deploy"){
            steps{
                echo "deploy the app ..."
            }
        }
    }
}
