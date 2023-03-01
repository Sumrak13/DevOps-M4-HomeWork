# DevOps-M4-HomeWork
Steps after running command: Vagrant up

1) Vagrant will crate 1VM with CentOS
2) Provisioning: git, java17, tree, docker, jenkins
3) Fixing the requierd user permission for jenkins and docker
4) Unlocks Jenkins Installation and make Timeout=600 for slower computers installation
5) Install Jenkins Plugins
6) Create Jenkins Job from Pipeline
7) Print ExitMsg

The process is fully automated and after successful vagrant up you will see ExitMsg content and in another 5 minutes you will have BGapp running in 2 docker containers (web and db) on address: http://localhost:9070/
