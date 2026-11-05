

# Date: 2026-09-23
---
# [Goal]
A new DevOps Engineer has joined the team and he will be assigned some Jenkins related tasks. Before that, the team wanted to test a simple parameterized job to understand basic functionality of parameterized builds. He is given a simple parameterized job to build in Jenkins. Please find more details below:


Click on the Jenkins button on the top bar to access the Jenkins UI. Login using username admin and password Adm!n321.


1. Create a parameterized job which should be named as parameterized-job


2. Add a string parameter named Stage; its default value should be Build.


3. Add a choice parameter named env; its choices should be Development, Staging and Production.


4. Configure job to execute a shell command, which should echo both parameter values (you are passing in the job).


5. Build the Jenkins job at least once with choice parameter value Production to make sure it passes.


Note:

1. You might need to install some plugins and restart Jenkins service. So, we recommend clicking on Restart Jenkins when installation is complete and no jobs are running on plugin installation/update page i.e update centre. Also, Jenkins UI sometimes gets stuck when Jenkins service restarts in the back end. In this case, please make sure to refresh the UI page.


2. For these kind of scenarios requiring changes to be done in a web UI, please take screenshots so that you can share it with us for review in case your task is marked incomplete. You may also consider using a screen recording software such as loom.com to record and share your work.

 When do we need this?

When you want one job to be flexible. For example, a "Deploy" job where the user can choose which "Branch" or "Environment" (Dev/Prod) to target at runtime.

How to do this:

Check "This project is parameterized" in the job configuration and add a "String" or "Choice" parameter.

The Commands:

Inside the script, use the variable: echo "Deploying branch $BRANCH_NAME"

Key Points & Execution:

Variables: The parameter name becomes an environment variable.Expected Outcome:Clicking "Build" now prompts the user for input before starting.  

The devops team of xFusionCorp Industries is working on to setup centralised logging management system to maintain and analyse server logs easily. Since it will take some time to implement, they wanted to gather some server logs on a regular basis. At least one of the app servers is having issues with the Apache server. The team needs Apache logs so that they can identify and troubleshoot the issues easily if they arise. So they decided to create a Jenkins job to collect logs from the server. Please create/configure a Jenkins job as per details mentioned below:


Click on the Jenkins button on the top bar to access the Jenkins UI. Login using username admin and password Adm!n321

1. Create a Jenkins jobs named copy-logs.

2. Configure it to periodically build every 4 minutes to copy the Apache logs (both access_log and error_log) from App Server 2 (stapp02) from the default logs location to location /usr/src/itadmin on the Storage Server.

3. Build the job at least once so that the logs are copied and can be verified.

Note:

1. You might need to install some plugins and restart Jenkins. We recommend selecting Restart Jenkins when installation is complete and no jobs are running in the update centre. Refresh the page if the UI gets stuck after a restart.

2. Define the cron expression as required (e.g. */10 * * * * to run every 10 minutes).

3. For scenarios that require web UI changes, take screenshots or record your work (e.g. using loom.com) so you can share it for review if the task is marked incomplete.

sshpass -p "$SSHPASS" ssh -o StrictHostKeyChecking=no steve@stapp02 \
"echo \"$SSHPASS\" | sudo -S cp /var/log/httpd/error.log /var/log/httpd/access.log /usr/src/itadmin/"

 When do we need this?

When you want one job to be flexible. For example, a "Deploy" job where the user can choose which "Branch" or "Environment" (Dev/Prod) to target at runtime.

How to do this:

Check "This project is parameterized" in the job configuration and add a "String" or "Choice" parameter.

The Commands:

Inside the script, use the variable: echo "Deploying branch $BRANCH_NAME"

Key Points & Execution:

Variables: The parameter name becomes an environment variable.Expected Outcome:Clicking "Build" now prompts the user for input before starting.  

# [Pseudocode]


# [To-Do-List]

- []
```bash

```
- []
```bash

```
# [Edges]
- Edge: []
- Fix: []

# [Status: Success / Failure]
- Notes:



# Date: 2026-09-23
---
- [record the errorlogs and the access logs of an Apache]
```bash
sshpass -p "$SSHPASS" ssh -o StrictHostKeyChecking=no steve@stapp02 \
"echo \"$SSHPASS\" | sudo -S mkdir -p /usr/src/itadmin && echo \"$SSHPASS\" | sudo -S cp /var/log/httpd/error_log /var/log/httpd/access_log /usr/src/itadmin/"

```
- [so i relized i would need to hard code the password somewhere ]
```bash
# I also realized that the previous code saved it to itself so create a ssh key for both the apache and the where you would like to store 
# Quick check if the remote host is reachable via key authentication
if ! ssh -q -o BatchMode=yes -o ConnectTimeout=5 <username>@<hostname> exit; then
    echo "ERROR [$(date)]: SSH authentication failed. Please check keys for stapp02." >&2
    exit 1
fi
# do not automate this part if someone happens to highjack the script they can gain full access of the machine  
ssh-keygen -t ed25519 -C "server-id or a discription to id it later"
ssh-copy-id <username>@<hostname>
#once the keys are pushed #!/bin/bash
ssh -o StrictHostKeyChecking=no steve@stapp02 \
"sudo mkdir -p /usr/src/itadmin && sudo cp /var/log/httpd/error_log /var/log/httpd/access_log /usr/src/itadmin/"

******
sshpass -p "$SSHPASS" scp -r -o StrictHostKeyChecking=no steve@stapp02:/var/log/httpd ./
sshpass -p "$DSSHPASS" scp -r -o StrictHostKeyChecking=no natasha@ststor03:/usr/src/sysops ./


Started by user admin
Running as SYSTEM
Building in workspace /var/lib/jenkins/workspace/copy-logs
[copy-logs] $ /bin/sh -xe /tmp/jenkins15568071490752518335.sh
+ sshpass -p Am3ric@ scp -r -o StrictHostKeyChecking=no steve@stapp02:/var/log/httpd/. ./
+ sshpass -p Bl@kW ssh -o StrictHostKeyChecking=no mkdir -p /usr/src/sysops
hostname contains invalid characters
Build step 'Execute shell' marked build as failure
Finished: FAILURE
#appserver three actions
sshpass -p "$SSHPASS" ssh -o StrictHostKeyChecking=no banner@stapp03 'echo '"$SSHPASS"' | sudo -S cp /var/log/httpd/access_log /tmp/'
sshpass -p "$SSHPASS" ssh -o StrictHostKeyChecking=no banner@stapp03 'echo '"$SSHPASS"' | sudo -S cp /var/log/httpd/error_log /tmp/'
sshpass -p "$SSHPASS" scp -r -o StrictHostKeyChecking=no banner@stapp03:/tmp/access_log ./
sshpass -p "$SSHPASS" scp -r -o StrictHostKeyChecking=no banner@stapp03:/tmp/error_log ./
sshpass -p "$SSHPASS" scp -r -o StrictHostKeyChecking=no banner@stapp03 "rm -rf /tmp/error_log && rm -rf /tmp/access_log"
#storage server actions
sshpass -p "$DSSHPASS" ssh -o StrictHostKeyChecking=no natasha@ststor01 "mkdir -p /usr/src/sysops"
sshpass -p "$DSSHPASS" scp -r -o StrictHostKeyChecking=no ./access_log ./error_log natasha@ststor01:/usr/src/sysops/ 

#app server three actions
sshpass -p "$SSHPASS" ssh 'bash -s StrictHostKeyChecking=no banner@stapp03 << 'EOF'
echo "$SSHPASS" | sudo -S cp /var/log/httpd/access_log /tmp/
echo "$SSHPASS" | sudo -S cp /var/log/httpd/error_log /tmp/
sudo chmod 777 /tmp/access_log /tmp/error_log 
EOF
#dataserver actions
sshpass -p "$DSSHPASS" ssh -o StrictHostKeyChecking=no natasha@ststor01 "mkdir -p /usr/src/sysops"
sshpass -p "$DSSHPASS" scp -r -o StrictHostKeyChecking=no ./access_log ./error_log natasha@ststor01:/usr/src/sysops/ 
#clean-up
sshpass -p "$SSHPASS" scp -r -o StrictHostKeyChecking=no banner@stapp03 "rm -rf /tmp/error_log && rm -rf /tmp/access_log"



 ***************
#webserver actions
sshpass -p "$SSHPASS" ssh -o StrictHostKeyChecking=no steve@stapp02 'echo '"$SSHPASS"' | sudo -S cp /var/log/httpd/access_log /tmp/'
sshpass -p "$SSHPASS" ssh -o StrictHostKeyChecking=no steve@stapp02 'echo '"$SSHPASS"' | sudo -S cp /var/log/httpd/error_log /tmp/'
#push to jekins
sshpass -p "$SSHPASS" scp -o StrictHostKeyChecking=no steve@stapp02:/tmp/access_log ./
sshpass -p "$SSHPASS" scp -o StrictHostKeyChecking=no steve@stapp02:/tmp/error_log ./
#clean up
sshpass -p "$SSHPASS" ssh -o StrictHostKeyChecking=no steve@stapp02 'echo '"$SSHPAS"' | sudo -S rm -rf /tmp/error_log && sudo -S rm -rf /tmp/access_log'
#storage actions
sshpass -p "$DSSHPASS" ssh -o StrictHostKeyChecking=no natasha@ststor01 "mkdir -p /usr/src/itadmin/"
sshpass -p "$DSSHPASS" scp -r -o StrictHostKeyChecking=no ./error_log ./access_log natasha@ststor01:/usr/src/itadmin/
sshpass -p "$DSSHPASS" ssh -o StrictHostKeyChecking=no natasha@ststor01  'echo '"$DSSHPASS"' | sudo -S chmod 755 /usr/src/itadmin/error_log'
sshpass -p "$DSSHPASS" ssh -o StrictHostKeyChecking=no natasha@ststor01  'echo '"$DSSHPASS"' | sudo -S chmod 755 /usr/src/itadmin/access_log'


*** excecconnamd    
lab no longer accepts sshpass even though the solutions video uses it 
possible work aorunds
ssh -o StrictHostKeyChecking=no natasha@ststor01 "mkdir -p /usr/src/sysops"
ssh -o StrictHostKeyChecking=no tony@stapp01 'echo '"$PASS"' | sudo -S cp /var/log/httpd/access_log /var/log/httpd/error_log /tmp/'
scp -o StrictHostKeyChecking=no tony@stapp01:/tmp/access_log natasha@ststor01:/usr/src/sysops
scp -o StrictHostKeyChecking=no tony@stapp01:/tmp/error_log natasha@ststor01:/usr/src/sysops


mkdir -p /usr/src/data
sshpass -p "Am3ric@" ssh -o StrictHostKeyChecking=no steve@stapp02 'echo "Am3ric@" | sudo -S cat /var/log/httpd/access_log' > /tmp/access_log
sshpass -p "Am3ric@" ssh -o StrictHostKeyChecking=no steve@stapp02 'echo "Am3ric@" | sudo -S cat /var/log/httpd/error_log' > /tmp/error_log
sshpass -p "Am3ric@" ssh -o StictHostKeyChecking=no 'echo "Am3ric@" | chmod 644 /tmp/access_log /tmp/error_log'
sshpass -p "Am3ric@" scp -o StrictHostKeyChecking=no /tmp/error_log /usr/src/data/error_log
sshpass -p "Am3ric@" scp -o StrictHostKeyChecking=no /tmp/access_log /usr/src/data/access_log


mkdir -p /usr/src/data 
sshpass -p "Am3ric@" ssh -t -t -o StrictHostKeyChecking=no steve@stapp02 'echo "Am3ric@" | sudo -S cat /var/log/httpd/access_log' > /tmp/access_log 
sshpass -p "Am3ric@" ssh -t -t -o StrictHostKeyChecking=no steve@stapp02 'echo "Am3ric@" | sudo -S cat /var/log/httpd/error_log' > /tmp/error_log 
chmod 644 /tmp/access_log /tmp/error_log
sshpass -p "Am3ric@" scp -o StrictHostKeyChecking=no /tmp/error_log /usr/src/dba/error_log 
sshpass -p "Am3ric@" scp -o StrictHostKeyChecking=no /tmp/access_log /usr/src/dba/access_log


mkdir -p /home/natasha/db_backups
sshpass -p "Ir0nM@n" ssh -o StrictHostKeyChecking=no tony@stapp01 'mysqldump -u kodekloud_roy -pasdfgdsd kodekloud_db01 > backup_$(date +%F).sql
sshpass -p "Ir0nM@n" scp -o St     

pipeline {

    agent any

    stages {

        stage('Deploy') {

            steps { sh './deploy.sh' }

        }

    }

}

successful run webserver
******************************
sudo mkdir -p /usr/src/dba
sudo chown -R natasha:natasha /usr/src/dba
sshpass -p "BigGr33n" scp -o StrictHostKeyChecking=no banner@stapp03:/var/log/httpd/access_log /usr/src/dba/access_log
sshpass -p "BigGr33n" scp -o StrictHostKeyChecking=no banner@stapp03:/var/log/httpd/error_log /usr/src/dba/error_log
******************************* 
successful run mardb backup
*******************************
mkdir -p /home/natasha/db_backups
sudo chown -R natasha:natasha /home/natasha/db_backups
sshpass -p "Ir0nM@n" ssh -o StrictHostKeyChecking=no tony@stapp01 'mysqldump -u kodekloud_roy -pasdfgdsd kodekloud_db01 > backup_$(date +%F).sql'
sshpass -p "Ir0nM@n" scp -o StrictHostKeyChecking=no tony@stapp01:backup_$(date +%F).sql /home/natasha/db_backups
********************************
use rysync for better overhead not sending the entire db every couple of minutes this will only send new files
sshpass -p "Ir0nM@n" rsync -avz -e "ssh -o StrictHostKeyChecking=no" /home/natasha/db_backups/ tony@stapp01:/home/natasha/db_backups/
*********************************

        
*****************************
Ensure which java is being used by the enviorement 
sudo update-alternatives --config java
****************************
****************************
create a conditonal pipeline that only engages when push from main
****************************
pipeline {
    agent { label 'stapp01' }
    stages {
        stage('checkout') {
            steps {
                checkout([$class: 'GitSCM',
                    branches: [[name: 'master']],
                    extensions: [[$class: 'SparseCheckoutPaths', sparseCheckoutPaths: [[path: 'index.html']]]],
                    userRemoteConfigs: [[url: 'https://3000-port-du55ebv6y4exb3gs.labs.kodekloud.com/sarah/web.git']]
                ])

                sh '''
                echo "Ir0nM@n" | sudo -S chown tony:tony /var/www/html/
                echo "Ir0nM@n" | sudo -S cp index.html /var/www/html/
                echo "Ir0nM@n" | sudo -S systemctl restart httpd
                '''
            }
        }
    }
}

import jenkins.model.Jenkins
def instance = Jenkins.instance
instance.setCrumbIssuer(null)

https://8080-port-s6ghvflq44bxtku7.labs.kodekloud.com/job/datacenter-app-deployment/build?token=sarah


pipeline {
    agent none
    stages {
        stage('set up') {
            agent { label 'stapp01-tony' }
            steps {
                sh 'sudo chown -R sarah:sarah /var/www/html'
            }
        }
        stage('checkout') {
            agent {label 'stapp01-sarah'}
            when { branch 'master' }
            steps {
                checkout scm
                sh '''
                    cd /var/www/html
                    sudo git 
                    '''
            }
        }
    }
}



post job update

pipeline {
    agent none
    stages {
        stage('set up') {
            agent { label 'stapp01_tony_agent' }
            steps {
                sh 'sudo chown -R sarah:sarah /var/www/html'
            }
        }
        stage('checkout') {
            agent { label 'stapp01_sarah_agent' }
            when { branch 'master' }
            steps {
                sh '''
                cd /var/www/html
                git checkout master
                git merge --no-ff origin/master
                git pull origin master
            }
        }
    }
    post {
        success { build job: 'manage-services' }
    }
}

```
Similarly, click on the Gitea button on the top bar to access the Gitea UI. Login using username sarah and password Sarah_pass123.

There is a repository named sarah/web in Gitea that is already cloned on App Server 1 under /var/www/html directory.

    Update the content of the file index.html under the same repository to Welcome to xFusionCorp Industries and push the changes to the origin into the master branch.

    Apache is already installed on the app server and is running on port 8080.

    Add App Server 1 as a Jenkins agent (slave) node: name App Server 1, label stapp01, remote root directory /home/sarah/jenkins_agent, launch via SSH with host stapp01 and credentials for user sarah. Install java-17-openjdk on App Server 1 if needed.

    Create a Jenkins pipeline job named deploy-job (it must not be a Multibranch pipeline job) and pipeline should have two stages Deploy and Test ( names are case sensitive ). Configure these stages as per details mentioned below.

    a. The Deploy stage should deploy the code from web repository under /var/www/html on App Server 1, as this is the document root of the app server.

    b. The pipeline should run on the App Server 1 node (e.g. use label stapp01).

    c. The Test stage should just test if the app is working fine and website is accessible. Its up to you how you design this stage to test it out, you can simply add a curl command as well to run a curl against the LBR URL (http://stlb01:8091) to see if the website is working or not. Make sure this stage fails in case the website/app is not working or if the Deploy stage fails.

Click on the App button on the top bar to see the latest changes you deployed. Please make sure the required content is loading on the main URL http://stlb01:8091 i.e there should not be a sub-directory like http://stlb01:8091/web etc.

Note:

    You might need to install some plugins and restart Jenkins service. So, we recommend clicking on Restart Jenkins when installation is complete and no jobs are running on plugin installation/update page i.e update centre. Also, Jenkins UI sometimes gets stuck when Jenkins service restarts in the back end. In this case, please make sure to refresh the UI page.

    For these kind of scenarios requiring changes to be done in a web UI, please take screenshots so that you can share it with us for review in case your task is marked incomplete. You may also consider using a screen recording software such as loom.com to record and share your work.




******************
this method is because i wanted it would not trigger the build so i used a generic web hook trigger in Jenkins Plugins
https://8080-port-ccyhc5zhikby73or.labs.kodekloud.com/generic-webhook-trigger/invoke?token=web-deploy-token

pipeline {
    agent none
    triggers {
        GenericTrigger(
            genericVariables: [
                [key: 'ref', value: '$.ref']
            ],
            token: 'web-deploy-token',
            causeString: 'Gitea Webhook Push',
            printContributedVariables: true,
            regexpFilterText: '$ref',
            regexpFilterExpression: 'refs/heads/master'
        )
    }
    stages {
        stage('Deploy') {
            agent { label 'stapp01' }
            when { branch 'master' }
            steps {
                sh '''
                cd /var/www/html
                git pull origin master
                '''
            }
        }
        stage('Test') {
            agent { label 'stapp01' }
            steps {
                sh 'curl -I http://stlb01:8091'
            }
        }
    }
}



Create a text file (inventory) and group your IP addresses.

The Commands:

Ini, TOML

[app_servers]

172.31.0.10

172.31.0.11

   

Expected Outcome:

Running ansible app_servers -m ping targets only those specific machines.  



*********** 
ansible


 


The Nautilus DevOps team is testing Ansible playbooks on various servers within their stack. They've placed some playbooks under /home/thor/playbook/ directory on the jump host and now intend to test them on app server 1 in Stratos DC. However, an inventory file needs creation for Ansible to connect to the respective app. Here are the requirements:

a. Create an ini type Ansible inventory file /home/thor/playbook/inventory on jump host.

b. Include App Server 1 in this inventory along with necessary variables for proper functionality.

c. Ensure the inventory hostname corresponds to the server name as per the wiki, for example stapp01 for app server 1 in Stratos DC.

Note: Validation will execute the playbook using the command ansible-playbook -i inventory playbook.yml. Ensure the playbook functions properly without any extra arguments.

- hosts: app_servers

  become: yes

  tasks:

    - name: install apache

      apt: name=apache2 state=present


all:
  children:
    app_servers:
      stapp03:
        ansible_user: banner
        ansible_ssh_password: BigGr33n
~                                         

- name: base
hosts: stapp01
become:yes
tasks:
  - name: min-set-up
    apt:
      name:
        - curl
        - git
        - apt-transport-https
      state: present
      cache_valid_time: 3600
script sytax verfier
ansible-playbook inventory --syntax-check -i inventory

point to the inventory
ansible-playbook playbook.yml -i inventory
ansible stapp01 -i inventory -m ping

- name: Copy index.html to servers
    copy:
    src: ./index.html
    dest: /var/www/html/index.html

