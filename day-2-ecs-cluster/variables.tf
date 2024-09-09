##### General #####

variable "project_name" {}

variable "region" {}

##### Networking #####

variable "ssm_vpc_id" {}

variable "ssm_pub_subnet_1a" {}

variable "ssm_pub_subnet_1b" {}

variable "ssm_pub_subnet_1c" {}

variable "ssm_pvt_subnet_1a" {}

variable "ssm_pvt_subnet_1b" {}

variable "ssm_pvt_subnet_1c" {}

##### Load Balancer #####

variable "load_balancer_internal" {}

variable "load_balancer_type" {}

##### ECS Cluster #####

variable "node_ami" {}

variable "node_instance_type" {}

variable "node_volume_size" {}

variable "node_volume_type" {}

variable "cluster_min_size" {}

variable "cluster_max_size" {}

variable "cluster_desired_size" {}