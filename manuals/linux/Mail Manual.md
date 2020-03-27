# Mail Manual

```bash
yum install -y mailx
```

```bash
$ mail
Heirloom Mail version 12.5 7/5/10.  Type ? for help.
"/var/spool/mail/root": 2 messages 2 new
>N  1 root                  Thu Feb 15 15:13  15/735   "Output from your job        1"
 N  2 root                  Thu Feb 15 15:17  14/621   "Output from your job        2"
& ?
               mail commands
type <message list>             type messages
next                            goto and type next message
from <message list>             give head lines of messages
headers                         print out active message headers
delete <message list>           delete messages
undelete <message list>         undelete messages
save <message list> folder      append messages to folder and mark as saved
copy <message list> folder      append messages to folder without marking them
write <message list> file       append message texts to file, save attachments
preserve <message list>         keep incoming messages in mailbox even if saved
Reply <message list>            reply to message senders
reply <message list>            reply to message senders and all recipients
mail addresses                  mail to specific recipients
file folder                     change to another folder
quit                            quit and apply changes to folder
xit                             quit and discard changes made to folder
!                               shell escape
cd <directory>                  chdir to directory or home if none given
list                            list names of all available commands

A <message list> consists of integers, ranges of same, or other criteria
separated by spaces.  If omitted, mail uses the last message typed.
```



