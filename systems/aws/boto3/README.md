```
>>> pip install boto3
```

# Filters

Suppose some resources are tagged as follows:

{ 'color' : 'red'}

You can filter for everything with the 'color' tag as follows:

```
filters = [{'Name':'tag-key', 'Values':['color']}]
for instance in ec2.instances.filter(Filters=filters):
  print(instance.id)
```

You can filter for everything tagged 'red' as follows:
```
filters = [{'Name':'tag-value', 'Values':['red']}]
for instance in ec2.instances.filter(Filters=filters):
  print(instance.id)
```

You can also limit these again:

```
>>> for instance in resource.instances.filter(Filters=filters).limit(1) :
    print(instance.id)
```

# Cost Reports:

EC2 Dashboard -> Reports
