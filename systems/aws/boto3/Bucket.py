#!/usr/bin/env python

class Bucket:

    def __init__(self, bucketName, **kwargs):
        self.name = bucketName
        s3 = boto3.resource('s3')

        # Since buckets are limited globally, we don't want to spin
        # one up here. Exit if we don't already have one.
        bucketsList = [ b.name for b in s3.buckets.all() ]
        if self.name not in bucketsList:
            raise NameError("S3 Bucket '{}' does not exist.".format(self.name))

        self._s3Bucket = s3.Bucket(self.name)
