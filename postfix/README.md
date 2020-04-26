Postfix jail as mail server
===========================

** Create Jail

- Create Jail

```sh
pot create -p postfix1 -N public-bridge -b 12.1 -f salt
```

- Configure port export

```sh
pot export-ports -p postfix1 -e 25:25 -e 110:110 -e 143:143 -e 993:993 -e 995:995 -e 4190:4190 
```

- Configure router to forward ports

** Depoly postfix and cyrus mail server

- Accept key of minion

```sh
salt-key -a <minion key>
```

- Depoly postfix and cyrus mail server

```sh
salt 'postfix*' state.apply
```

** Create mail account/box

- update password of cyrus

```sh
passwd cyrus
```

- create account 

```sh
adduser 
```

- create mailbox


```sh
cyradm -u cyrus <jail ip>
```

```sh
cm user/<account>
```
