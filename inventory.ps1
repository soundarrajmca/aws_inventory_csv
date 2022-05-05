
## EC2 Instance ##
aws ec2 describe-instances --output text --query "Reservations[*].Instances[*].[InstanceId, Tags[?Key=='Name']|[0].Value, InstanceType, Placement.AvailabilityZone, Platform, State.Name, PrivateIpAddress, PublicIpAddress, VpcId, SubnetId,PrivateDnsName, PublicDnsName, Monitoring.State, LaunchTime]" --profile EXL-DEV > D:\EC2.csv

## VPC ##
aws ec2 describe-vpcs --output text --query "Vpcs[*].[VpcId, Tags[?Key=='Name']|[0].Value, CidrBlock ]" --profile EXL-DEV > D:\Vpcs.csv

## Subnet ##
aws ec2 describe-subnets --output text --query "Subnets[*].[SubnetId, Tags[?Key=='Name']|[0].Value, CidrBlock, VpcId, AvailabilityZone]" --profile Revv-Car > D:\Subnets.csv

## S3 ##

aws S3 ls --output text --query --profile Revv-Car > D:\S3.csv


aws elbv2 describe-load-balancers 


## List Volume Snapshot ##

aws ec2 describe-snapshots --output text --query "Snapshots[*].[]"

## List AMI IMAGE ##

aws ec2 describe-images --filters "Public=false" --output text --query "Images[*].[ImageId, Public, Name, ImageLocation, Description, BlockDeviceMappings[?Ebs=='SnapshotId']|[0].Value]" --profile Revv-Car > D:\AMI.csv


aws ec2 describe-images --filters Name=Public, Values=false --query 'Images[*].[ImageId]' --output text --profile Revv-Car


 aws ec2 describe-network-interfaces --filters 'Name=vpc-id,Values=vpc-027e8edb2936d8d98' --query 'NetworkInterfaces[*].NetworkInterfaceId' --profile Revv-Car





aws iam get-account-authorization-details --profile Revv-Car > output.json
