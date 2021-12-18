region      = "ap-northeast-2"
cluster_id  = "eks-cluster"
stage_tag   = "dev"

azs = [
  "ap-northeast-2a",
  "ap-northeast-2c"
]

// VPC
vpc_cidr = "10.0.0.0/16"
subnet_cidr = "10.0.1.0/20"

// EC2 - Bastion
bastion_ami = "ami-0263588f2531a56bd"
bastion_instance_name = "bastion"
bastion_instance_type = "t2.micro"
bastion_key_pair_name = "BASTION_KEY"

common_key_pair_name  = "EKS_COMMON_KEY"

// EKS
cluster_name = "bob-eks"
cluster_version = "1.21"
config_output_path = "./output/"