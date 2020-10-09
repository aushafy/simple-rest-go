pipeline {

    agent any

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
                sh "tkgi get-credentials cluster-small"
                sh "kubectl get nodes"
                echo "deploy success to cluster-small"

            }
        }
    }
}
