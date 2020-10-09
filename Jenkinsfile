pipeline {

    agent any

    environment {
        // if any env variable write down here!Q!!
    }

    stages{

        stage("build"){
            steps{
               sh "docker build -t harbor.tkgi.vxrail.local/demo/hello-golang:$BUILD_NUMBER ."
               sh "docker login harbor.tkgi.vxrail.local --username $HARBOR_USERNAME --password $HARBOR_PASSWORD"
               sh "docker push harbor.tkgi.vxrail.local/demo/hello-golang:$BUILD_NUMBER"
               sh "export BUILD_NUMBER=$BUILD_NUMBER"
            }
        }

        stage("test"){
            steps{
                echo "test stage ..."
            }
        }

        stage("deploy"){
            steps{
                sh "kubectl config use-context cluster-small"
                sh "kubectl apply -f deployment.yaml -n prod"
                echo "deploy success to cluster-small"
            }
        }
    }
}
