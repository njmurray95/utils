# Get an EC2's instance-id from within that EC2
# See: https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-metadata.html
curl http://169.254.169.254/latest/meta-data/instance-id
