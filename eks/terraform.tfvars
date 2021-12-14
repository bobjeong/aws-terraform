region      = "ap-northeast-2"
cluster_id  = "eks-cluster"
prefix_name = "bob-cluster"

azs = [
  "ap-northeast-2a",
  "ap-northeast-2c"
]

// VPC
vpc_cidr = "10.0.0.0/16"
subnet_cidr = "10.0.1.0/20"

enable_nat_gateway = true
single_nat_gateway = true

// EC2 - Bastion

bastion_ami = "ami-0263588f2531a56bd"
bastion_instance_name = "bs-serverless-bastion"
bastion_instance_type = "t2.micro"
bastion_key_pair_name = "serverless-keypair"

key_name = "EKS_COMMON_KEY"


// EKS
cluster_name = "bob-eks"
cluster_version = "1.21"
kubeconfig_output_path = "./output/"


default_tag = "eks-cluster-terrafrom"
stage_tag = "dev"
