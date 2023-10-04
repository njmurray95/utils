# Email

Configuring email on some servers.

---

## Linux

`postfix` will install all necessary binaries (including the all-important `sendmail`):

```
dnf install postfix mailx
```

The way to send an email might look like this:
```
echo "Hello World!" | mailx -s "Hello" <emailaddress>
```

#### Troubleshooting

Whenever updating `postfix` config it is necessary to restart:
```
$ postfix reload
```

The status of mail in the queue can be checked with:
```
$ mailq
$ # or:
$ postqueue -p
```

---

```
postdrop: warning: unable to look up public/pickup: No such file or directory
```

Run this:
```
mkfifo /var/spool/postfix/public/pickup
```

---

```
send-mail: fatal: parameter inet_interfaces: no local interface found for ::1
```
`postfix` is trying to use ipv6. It should be reconfigured to only run ipv4:
```
vi /etc/postfix/main.cf
# change:
# inet_protocols = all
# to:
# inet_protocols = ipv4
```

or:
```
RUN sed -i 's/inet_protocols = all/inet_protocols = ipv4/g' /etc/postfix/main.cf
```

---

Checking the status of the mail queue (`postqueue -p`) shows this error:
```
[root@d4d0ee4d77e8 /]# mailq
-Queue ID-  --Size-- ----Arrival Time---- -Sender/Recipient-------
03BC76D3D4B    3776 Mon Oct  2 19:26:55  MAILER-DAEMON
                                                  (alias database unavailable)
                                         root@d4d0ee4d77e8.localdomain
```

The alias database has not been configured. Do this:

```
$ postalias /etc/aliases/
$ # or:
$ newaliases
```
