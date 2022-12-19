# cp-kafka-with-planes
Set up Confluent platform Apache Kafka clusters with control and data planes. Two separate clusters will be use one for processing your business data and the other for monitoring, authorization & administration.

You can use thse terraform script to provision your infrastrcuture in this order:

cd ./cp-kafka-with-planes/terraform/control-plane
terraform apply

cd ../data-plane/
terraform apply

If you plan to use Confluent's cp-ansible tool for building these clusters then the instructions are provided on Confluent docs web pages. Here are some important links:

Prerequisites: https://docs.confluent.io/ansible/current/ansible-requirements.html

Ansible playbooks: https://docs.confluent.io/ansible/current/ansible-download.html

Runing the cp-ansible playbooks: https://docs.confluent.io/ansible/current/ansible-install.html#install-individual-cp-components

E.g. you will use the commands below to build your clusters with cp-ansible ad in this order:

ansible-playbook -i control-plane-hosts.yml confluent.platform.all

ansible-playbook -i data-plane-hosts.yml confluent.platform.all

Once your cluster have been built be sure to add the rolebindings to your 'c3' user or any user with which you plan to login to control center, this will ensure that both your clusters on visible 

confluent iam rbac role-binding create --principal User:c3 --role SystemAdmin --kafka-cluster-id dj2lyE2ETqe8Hyc7VyUgDQ

confluent iam rbac role-binding create --principal User:c3 --role ClusterAdmin --kafka-cluster-id dj2lyE2ETqe8Hyc7VyUgDQ
