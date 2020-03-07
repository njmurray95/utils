Running java code (no package):

```
$ touch Example.java
$ javac Example.java
$ ls
Example.class Example.java
$ java Example
"Hello World"
```

Show invocation of java programs:
```
$ jps -lvm
```

Show process of running JVM's:
```
$ jcmd
```

Show JVM system information about process:
```
$ jinfo <pid>
```
