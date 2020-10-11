pipeline {

    agent any

    stages{

        stage("build"){
            steps{
		withCredentials([
			usernamePassword(credentials: 'harbor-credentials', usernameVariable: HARBOR_USERNAME, passwordVariable: HARBOR_PASSWD)
		])
               sh "docker build -t harbor.tkgi.vxrail.local/demo/hello-golang:$BUILD_NUMBER ."
               sh "docker login harbor.tkgi.vxrail.local --username $HARBOR_USERNAME --password $HARBOR_PASSWD"
               sh "docker push harbor.tkgi.vxrail.local/demo/hello-golang:$BUILD_NUMBER"
            }
        }

        stage("test"){
            steps{
                echo "test stage ..."
            }
        }

        stage("deploy"){
            steps{
		withCredentials([
			usernamePassword(credentials: 'tkgi-credentials', usernameVariable: TKGI_USERNAME, passwordVariable: TKGI_PASSWD)
		])
                sh "tkgi login -a api.tkgi.vxrail.local -u $TKGI_USERNAME -k -p $TKGI_PASSWD"
                sh "tkgi get-credentials cluster-small"
                sh "kubectl apply -f deployment.yaml"
            }
        }
    }
}
