resource "aws_iam_role" "BarakIAM" {
  name = "barak-training-iam"
  description = "Allows write permissions to S3 buckets and RDS from an EC2 instance"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "sts:AssumeRole"
            ],
            "Principal": {
                "Service": [
                    "ec2.amazonaws.com"
                ]
            }
        }
    ]
}
EOF
}

resource "aws_iam_policy" "BarakPolicy" {
  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "s3:CreateAccessPoint",
                "s3:PutAnalyticsConfiguration",
                "s3:PutAccelerateConfiguration",
                "s3:PutAccessPointConfigurationForObjectLambda",
                "s3:DeleteObjectVersion",
                "s3:PutStorageLensConfiguration",
                "s3:RestoreObject",
                "s3:DeleteAccessPoint",
                "s3:CreateBucket",
                "s3:DeleteAccessPointForObjectLambda",
                "s3:ReplicateObject",
                "s3:PutEncryptionConfiguration",
                "s3:DeleteBucketWebsite",
                "s3:AbortMultipartUpload",
                "s3:PutLifecycleConfiguration",
                "s3:UpdateJobPriority",
                "s3:DeleteObject",
                "s3:CreateMultiRegionAccessPoint",
                "s3:DeleteBucket",
                "s3:PutBucketVersioning",
                "s3:PutIntelligentTieringConfiguration",
                "s3:PutMetricsConfiguration",
                "s3:PutBucketOwnershipControls",
                "s3:PutReplicationConfiguration",
                "s3:DeleteMultiRegionAccessPoint",
                "s3:PutObjectLegalHold",
                "s3:InitiateReplication",
                "s3:UpdateJobStatus",
                "s3:PutBucketCORS",
                "s3:PutInventoryConfiguration",
                "s3:PutObject",
                "s3:PutBucketNotification",
                "s3:DeleteStorageLensConfiguration",
                "s3:PutBucketWebsite",
                "s3:PutBucketRequestPayment",
                "s3:PutObjectRetention",
                "s3:PutBucketLogging",
                "s3:CreateAccessPointForObjectLambda",
                "s3:PutBucketObjectLockConfiguration",
                "s3:CreateJob",
                "s3:ReplicateDelete",
                "rds:FailoverGlobalCluster",
                "rds:StartDBCluster",
                "rds:DeleteGlobalCluster",
                "rds:RemoveRoleFromDBCluster",
                "rds:RestoreDBInstanceFromS3",
                "rds:CrossRegionCommunication",
                "rds:ResetDBParameterGroup",
                "rds:ModifyDBProxyEndpoint",
                "rds:CreateGlobalCluster",
                "rds:DeregisterDBProxyTargets",
                "rds:CreateOptionGroup",
                "rds:CreateDBSubnetGroup",
                "rds:PurchaseReservedDBInstancesOffering",
                "rds:ModifyCustomDBEngineVersion",
                "rds:ModifyDBParameterGroup",
                "rds:CreateDBProxyEndpoint",
                "rds:AddSourceIdentifierToSubscription",
                "rds:CopyDBParameterGroup",
                "rds:AddRoleToDBCluster",
                "rds:CreateDBProxy",
                "rds:ModifyDBInstance",
                "rds:ModifyDBClusterParameterGroup",
                "rds:RegisterDBProxyTargets",
                "rds:ModifyDBClusterSnapshotAttribute",
                "rds:DeleteDBInstance",
                "rds:CopyDBClusterParameterGroup",
                "rds:CreateDBClusterEndpoint",
                "rds:StopDBCluster",
                "rds:CreateDBParameterGroup",
                "rds:CancelExportTask",
                "rds:DeleteDBSnapshot",
                "rds:DeleteDBProxy",
                "rds:DeleteDBInstanceAutomatedBackup",
                "rds:RemoveFromGlobalCluster",
                "rds:DeleteCustomDBEngineVersion",
                "rds:PromoteReadReplica",
                "rds:StartDBInstance",
                "rds:StopActivityStream",
                "rds:RestoreDBClusterFromS3",
                "rds:DeleteDBSubnetGroup",
                "rds:CreateDBSnapshot",
                "rds:RestoreDBInstanceFromDBSnapshot",
                "rds:DeleteDBSecurityGroup",
                "rds:ModifyDBClusterEndpoint",
                "rds:ModifyDBCluster",
                "rds:CreateDBClusterSnapshot",
                "rds:DeleteDBParameterGroup",
                "rds:CreateDBClusterParameterGroup",
                "rds:ModifyDBSnapshotAttribute",
                "rds:PromoteReadReplicaDBCluster",
                "rds:ModifyRecommendation",
                "rds:CreateEventSubscription",
                "rds:ModifyOptionGroup",
                "rds:RestoreDBClusterFromSnapshot",
                "rds:StartExportTask",
                "rds:StartActivityStream",
                "rds:StopDBInstanceAutomatedBackupsReplication",
                "rds:DeleteOptionGroup",
                "rds:FailoverDBCluster",
                "rds:DeleteEventSubscription",
                "rds:DeleteDBProxyEndpoint",
                "rds:RemoveSourceIdentifierFromSubscription"
            ],
            "Resource": "*"
        }
    ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "BarakCustomPolicyAndRoleAttachment" {
  policy_arn = aws_iam_policy.BarakPolicy.arn
  role       = aws_iam_role.BarakIAM.name
}

resource "aws_iam_instance_profile" "BarakProfile" {
  name = "barak_profile"
  role = aws_iam_role.BarakIAM.name
}

output "barak_iam_profile_name" {
  value = aws_iam_instance_profile.BarakProfile.name
}

output "barak_role" {
  value = aws_iam_role.BarakIAM.name
}