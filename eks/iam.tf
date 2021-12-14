module "iam_policy_autoscaling" {
  source = "terraform-aws-modules/iam/aws//modules/iam-policy"

  name = "${local.cluster_name}-autoscaler"
  path = "/"
  description = "Autoscaling policy for cluster ${local.cluster_name}"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "eksWorkerAutoscalingAll",
            "Effect": "Allow",
            "Action": [
                "ec2:DescribeLaunchTemplateVersions",
                "autoscaling:DescribeTags",
                "autoscaling:DescribeLaunchConfigurations",
                "autoscaling:DescribeAutoScalingInstances",
                "autoscaling:DescribeAutoScalingGroups"
            ],
            "Resource": "*"
        },
        {
            "Sid": "eksWorkerAutoscalingOwn",
            "Effect": "Allow",
            "Action": [
                "autoscaling:UpdateAutoScalingGroup",
                "autoscaling:TerminateInstanceInAutoScalingGroup",
                "autoscaling:SetDesiredCapacity"
            ],
            "Resource": "*",
            "Condition": {
                "StringEquals": {
                    "autoscaling:ResourceTag/k8s.io/cluster-autoscaler/enabled": [
                        "true"
                    ],
                    "autoscaling:ResourceTag/k8s.io/cluster-autoscaler/${local.cluster_name}": [
                        "owned"
                    ]
                }
            }
        }
    ]
}
EOF
}

module "iam_policy_efs" {
  source = "terraform-aws-modules/iam/aws//modules/iam-policy"

  name = "${local.cluster_name}-efs-csi"
  path = "/"
  description = "EFS CSI policy for cluster ${local.cluster_name}"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "",
            "Effect": "Allow",
            "Action": [
                "elasticfilesystem:DescribeFileSystems",
                "elasticfilesystem:DescribeAccessPoints",
                "elasticfilesystem:DescribeMountTargets",
                "ec2:DescribeAvailabilityZones"
            ],
            "Resource": "*"
        },
        {
            "Sid": "",
            "Effect": "Allow",
            "Action": "elasticfilesystem:CreateAccessPoint",
            "Resource": "*",
            "Condition": {
                "StringEquals": {
                    "aws:RequestTag/efs.csi.aws.com/cluster": [
                        "true"
                    ]
                }
            }
        },
        {
            "Sid": "",
            "Effect": "Allow",
            "Action": "elasticfilesystem:DeleteAccessPoint",
            "Resource": "*",
            "Condition": {
                "StringEquals": {
                    "aws:ResourceTag/efs.csi.aws.com/cluster": [
                        "true"
                    ]
                }
            }
        }
    ]
}
EOF
}