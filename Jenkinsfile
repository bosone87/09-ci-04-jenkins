pipeline{
    agent {
  label 'ansible'
    }
    stages {
        stage('step-0'){
            steps{
                sh 'rm /tmp/role -r -f'
            }
        }
        stage('step-1'){
            steps{
                sh 'mkdir /tmp/role'
                sh 'ansible-galaxy role install git+https://github.com/AlexeySetevoi/ansible-clickhouse.git -p /tmp/role'
            }
        }
        stage('step-2'){
            steps{
                sh 'cd /tmp/role/ansible-clickhouse && molecule init scenario'
            }
        }
        stage('step-3'){
            steps{
                sh 'cd /tmp/role/ansible-clickhouse && molecule test'
            }
        }
    }
}