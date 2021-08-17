provider "aws" {
    region = "sa-east-1"
}

resource "aws_iam_user" "myUser" {
    name = "GabrielNogueira"
}

resource "aws_iam_policy" "customPolicy" {
    name = "TerraformPolicy"
    policy = <<E0F
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "ec2:GetDefaultCreditSpecification",
                "ec2:DeleteTags",
                "ec2:GetEbsEncryptionByDefault",
                "ec2:GetCapacityReservationUsage",
                "ec2:DescribeVolumesModifications",
                "ec2:GetHostReservationPurchasePreview",
                "ec2:GetConsoleScreenshot",
                "ec2:GetConsoleOutput",
                "ec2:GetLaunchTemplateData",
                "ec2:GetSerialConsoleAccessStatus",
                "ec2:GetFlowLogsIntegrationTemplate",
                "ec2:DescribeScheduledInstanceAvailability",
                "ec2:GetEbsDefaultKmsKeyId",
                "ec2:GetManagedPrefixListEntries",
                "ec2:DescribeVpnConnections",
                "ec2:DescribeTags",
                "ec2:GetCoipPoolUsage",
                "ec2:CreateTags",
                "ec2:DescribeFastSnapshotRestores",
                "ec2:GetReservedInstancesExchangeQuote",
                "ec2:GetAssociatedEnclaveCertificateIamRoles",
                "ec2:GetPasswordData",
                "ec2:GetAssociatedIpv6PoolCidrs",
                "ec2:DescribeScheduledInstances",
                "ec2:GetManagedPrefixListAssociations",
                "ec2:DescribeElasticGpus"
            ],
            "Resource": "*"
        }
    ]
}
    E0F
}

resource "aws_iam_policy_attachment" "policyBind" {
    name = "attachment"
    users = [aws_iam_user.myUser.name]
    policy_arn = aws_iam_policy.customPolicy.arn
}