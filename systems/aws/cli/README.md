# AWS CLI

# <Program Name>

> Brief description>The AWS Command Line Interface (CLI) is a unified tool to manage your AWS services. With just one tool to download and configure, you can control multiple AWS services from the command line and automate them through scripts.
>
> -- AWS Command Line Interface: https://aws.amazon.com/cli/

* Source: Installing AWS CLI on Linux: https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-linux.html
* Docs: https://docs.aws.amazon.com/cli/latest/reference/

## Warnings

N/A

## Installation

AWS does not always keep their packages maintained in the linux repositories. Many distros only have version 1 of the CLI and not the most recent. For this reason just install from source the way AWS recommends:

```
$ curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
$ unzip awscliv2.zip
$ sudo ./aws/install
```

## Files

* Config: ~/.aws

## Use

Get an EC2's instance-id from within that EC2:

(See: https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-metadata.html)

```
$ curl http://169.254.169.254/latest/meta-data/instance-id
```
