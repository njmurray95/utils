#!/usr/bin/env python

import boto3

T2_MICRO = 't2.micro'

class EC2:

    def __init__(self, forceCreate=False, **kwargs):
        self._ec2Resource = boto3.resource('ec2')
        self.instanceId = None

        if forceCreate:
            response = self._ec2Resource.create_instances(
                ImageId='' # FIXME fill with something real,
                MinCount=1,
                MaxCount=1,
                InstanceType=T2_MICRO,
            )

            # No other way to unpack the collection create_instances() returns
            for instance in response:
                self.instanceId = instance.id
                self._instance = instance
