# Trivy


> Trivy is a comprehensive and versatile security scanner. Trivy has scanners that look for security issues, and targets where it can find those issues.
>
> -- https://github.com/aquasecurity/trivy

## Installation

https://aquasecurity.github.io/trivy/v0.45/getting-started/installation/

## Use

Generate a config file to manipulate (note: trivy requires the command and target be specified here):
```
trivy <command> <target> --generate-default-config
```

Run trivy on a docker image and only report severe vulnerabilities;
```
trivy image <docker-image> --severity UNKNOWN,HIGH,CRITICAL
```

