#!/usr/bin/env python

import sys
import boto3
import time
import json

class IamRole:

    def __init__(self, roleName, assumedBy=None):
        self.name = roleName
        self.arn = None

        self._iamClient = boto3.client('iam')
        self._roleImpl = None

        # Create role if it does not already exist
        if not self._role_exists(roleName):

            if assumedBy is None:
                sys.exit("Cannot create '{}' without specifying which AWS service assumes it.".format(self.name))

            lambdaRoleDoc = {
                "Statement": [
                    {
                        "Effect": "Allow",
                        "Principal": {
                            "Service": assumedBy
                        },
                        "Action": "sts:AssumeRole"
                    }
                ]
            }

            self._iamClient.create_role(
                    RoleName=roleName,
                    AssumeRolePolicyDocument=json.dumps(lambdaRoleDoc)
            )

            # After creating the role, it often takes a few seconds
            # for aws to finish registering it, which needs to happen before
            # the lambda attaches it. ~10 seconds seems to work.
            time.sleep(10)

        self._roleImpl = boto3.resource('iam').Role(roleName)
        self.arn = self._roleImpl.arn
