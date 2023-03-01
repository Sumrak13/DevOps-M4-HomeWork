cd /vagrant
echo "* Unlock Jenkins Installation with GroovyScript ..."
curl -O http://jenkins.do1.lab:8080/jnlpJars/jenkins-cli.jar
PASSWORD=$(sudo cat /var/lib/jenkins/secrets/initialAdminPassword)
java -jar jenkins-cli.jar -s http://localhost:8080/ -auth admin:$PASSWORD groovy = < GroovyScripts/unlock_jenkins.groovy

echo "* Installing Jenkins Plugins ..."
java -jar jenkins-cli.jar -s http://localhost:8080/ -http -auth admin:Password1 install-plugin workflow-aggregator -deploy 
java -jar jenkins-cli.jar -s http://localhost:8080/ -http -auth admin:Password1 install-plugin schedule-build -deploy 
java -jar jenkins-cli.jar -s http://localhost:8080/ -http -auth admin:Password1 install-plugin ssh -deploy 
java -jar jenkins-cli.jar -s http://localhost:8080/ -http -auth admin:Password1 install-plugin github -deploy 
java -jar jenkins-cli.jar -s http://localhost:8080/ -http -auth admin:Password1 install-plugin pipeline-github -deploy 

echo "* Restart Jenkins Plugin to apply new settings ..."
sudo systemctl restart jenkins

echo "* Build Piplenie Job and running BGapp in Docker Container ..."
java -jar jenkins-cli.jar -s http://localhost:8080/ -http -auth admin:Password1 create-job BGapp_Docker < PipelineConfig.xml
java -jar jenkins-cli.jar -s http://localhost:8080/ -http -auth admin:Password1 build BGapp_Docker
