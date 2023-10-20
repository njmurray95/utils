# SSH

> SSH or Secure Shell is a cryptographic network protocol for operating network services securely over an unsecured network. Typical applications include remote command-line, login, and remote command execution, but any network service can be secured with SSH.
>
> SSH provides a secure channel over an unsecured network by using a client–server architecture, connecting an SSH client application with an SSH server. [...]
>
> -- Wikipedia: https://en.wikipedia.org/wiki/SSH_(Secure_Shell)

* Source: https://www.ssh.com/ssh/

## Warnings

N/A

## Installation

SSH is a protocol and *per se* cannot be installed. For specific clients such as OpenSSH or Putty, see their respective entries.

## Files

* Most clients use `~/.ssh/*` for config.

Make sure that this dir has the proper permissions:

```
chmod 700 ~/.ssh
chmod 600 ~/.ssh/*
```

## ssh-keygen

```
$ ssh-keygen
```

This will generate:

* `~/.ssh/id_rsa`
* `~/.ssh/id_rsa.pub`

To add that key to a remote server:

```
ssh-copy-id -i /path/to/key.pub <username@hostname>
```

## Misc.


Print randomart representation of ssh key:
```
ssh-keygen -lv -f /path/to/key
```

(What is this?)
Use heredoc to read from stdin:
```
ssh-keygen -lvf /dev/stdin <<<$(ssh-keyscan $HOST)
```

