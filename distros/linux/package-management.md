# Package Management

Every linux distro has its own bespoke methods for downloading, upgrading, and managing packages. Here are some tricks for working around them.

### Find the dependencies of a package

Ubuntu/Debian:
```
apt-cache show <package>
```

---

RHEL/Fedora

Find the package of a given binary:

```
$ which <command>
/path/to/bin
$ rpm -qf /path/to/bin
package-name.version.arch
```

Find the dependencies:
```
dnf deplist <package-name>
```

---

