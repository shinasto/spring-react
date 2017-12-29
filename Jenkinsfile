node () { // 'SLAVE_CENT7_115'
    def app
    stage('Preparation') { // for display purposes
        println "Git CheckOut Started"
        // Get code from a SDS GitHub repository
        // GitHub
        // git branch: 'master', credentialsId: '784fd14e-519f-4ed4-9b99-cb69fcd0c19e', url: 'git@70.2.90.114:ODP/odp-app-example.git'
        // GitLab
        // git branch: 'master', credentialsId: 'gitlab-dep-credentials', url: 'http://70.121.224.108/gitlab/nexplant-dep/spring-react-sample.git'
        checkout scm
    }
    stage('Build') {
        // Run the maven build
        if (isUnix()) {
            dir ('SpringReact') {
                sh "'./mvnw' -Dmaven.test.failure.ignore clean package"
                // sh "'./mvnw' -Dmaven.test.failure.ignore clean"
            }
        } else {
            dir ('SpringReact') {
                bat(/"mvnw" -Dmaven.test.failure.ignore clean package/)
            }
        }
    }
    stage('Unit Test') {
        junit '**/target/surefire-reports/TEST-*.xml'
    }
    stage('Pacaging') {
       docker.withRegistry('http://sds.redii.net', 'redii-dep-credentials') {
           app = docker.build('sds.redii.net/nexplant-dep/myapp:0.0.1')
       } 
    }
    stage('Publish') {
       docker.withRegistry('http://sds.redii.net', 'redii-dep-credentials') {
           app.push('0.0.1')
           app.push('latest')
       }
    }
}
