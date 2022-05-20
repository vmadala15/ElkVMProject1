# Columbia Cybersecurity Project 1
## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![project 1 diagram](https://user-images.githubusercontent.com/56736648/169594192-ac973e8a-68eb-41f6-82fd-99ed35348cb4.png)


These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the .yml file may be used to install only certain pieces of it, such as Filebeat.

  -Elk-Install.yml
  -Metricbeat-Playbook.yml
  -Filebeat-Playbook.yml


This document contains the following details:
- Description of the Topologu
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.
Load balancing ensures that the application will be highly available, in addition to restricting access to the network. Load balancing ensures availability to web-servers which is a core security aspect of the CIA Triad. Jump boxes allow for easier administration duties of multiple systems and provide additional layers between the outside and internal assets.
Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the event logs and system metrics.
Filebeats watches for log directories or specific log files.
Metricbeat helps you monitor your servers by collecting metrics from the system and services running on the server.

_Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.

| Name     | Function | IP Address | Operating System |
|----------|----------|------------|------------------|
| Jump Box | Gateway  | 10.0.0.1   | Linux            |
| Web 1    | Server   | 10.0.0.5   | Linux            |
| Web 2    | Server   | 10.0.0.6   | Linux            |
| ElkServer| LogServer| 10.1.0.4   | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump Box Provisioner machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
Personal IP address
Machines within the network can only be accessed by Jump Box. The Elk Machine has access from personal IP address through Port 5601.

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| Jump Box | Yes                 | Personal             |
|LoadBalanc| Yes                 | Open                 |
| Web 1    | No                  | 10.0.0.5             |
| ElkServer| Yes                 | Personal             |
### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because services running can be limited, system installations and updates can be streamlined, and processes become replicable.

The playbook implements the following tasks:
-Installs Docker and Python3-pip to use as default docker module
-Increase virtual memory to a value of ‘262144’
-Publish list of part that Elk runs on (5601, 9200, 5044)
-Launch Elk image (sebp/elk:761) into the container
-Allowing the docker service to be enabled on boot


The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![docker ps project](https://user-images.githubusercontent.com/56736648/169595454-a75d2c28-76f3-4f3f-9ed7-2bf4bc0bb897.png)


### Target Machines & Beats
This ELK server is configured to monitor the following machines:
-10.0.0.5 and 10.0.06
We have installed the following Beats on these machines:
-Filebeat and Metricbeat
These Beats allow us to collect the following information from each machine:
-Filebeat collects the logs for each virtual machine, it collets specific data logs such as how many visitors, traffic from specific countries and where they’re located. You also get a log view of user side errors like 404 or 503 instances. 
-Metricbeat provides metric logs for each virtual machine, you would have access to system metrics such as CPU and Memory usage.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned:
SSH into the control node and follow the steps below:
-Copy the configuration file from your Ansible container to your Web VM’s.
-Update the /etc/ansible/hosts file to include IP addresses of the Elk Server VM and web servers.
-Run the playbook, and navigate to http://Elk_VM_Public_IP]:5601/app/kibana to check that the installation worked as expected.
-Which file is the playbook? Filebeat-Configuration
-Where do you copy it? Copy /etc/ansible/files/filebeatconfig.yml to /etc/filebeat/filebeat.yml
-Which file do you update to make Ansible run the playbook on a specific machine? How do I specify which machine to install the ELK server on versus which to install --Filebeat on? Update Filebeatconfig.yml and specify which machine to install by updating Host file with the private IP addresses and selecting which group to run in ansible.
-Which URl do you navigate to in order to check that the ELK server is running? http://[your.Elk-VM.External.IP]:5601/app/kibana.

### Using Playbook
Filebeat
Edit /etc/ansible/files/filebeatconfig.yml in the ansible container on the control node to include the ELK Stack IP address. You should also change the default login credentials.
```
output.elasticsearch:
hosts: ["<elk.ip.addr>:9200"]
username: "elastic"
password: "changeme"
```
```
setup.kibana:
host: "<elk.ip.addr>:5601"
```
-Then run Playbook:
```
$ ansible-playbook /etc/ansible/roles/filebeat-playbook.yml
```

Metricbeat
Edit /etc/ansible/files/metricbeatconfig.yml in the ansible on the control node to include the ELK Stack IP address. You should also change the default login credentials.

```
output.elasticsearch:
hosts: ["<elk.ip.addr>:9200"]
username: "elastic"
password: "changeme"
```
```
setup.kibana:
host: "<elk.ip.addr>:5601"
```
