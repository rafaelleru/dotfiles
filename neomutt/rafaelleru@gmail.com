set imap_user = "rafaelleru95103@gmail.com"

# echo -n "$(read -s;echo -n "$REPLY")" | gpg --encrypt -r 0x1234567890ABCDEF > ~/.neomutt/account.gpg
# Previous command won't work in some shells. You can use the following:
# echo -n 'mypassword' | gpg --encrypt -r 0x1234567890ABCDEF > ~/.neomutt/account.gpg
# !!! But be warned your password will be saved to shell history.
set imap_pass = "`gpg --batch -q --decrypt ~/.neomutt/account.gpg`"

set folder = imaps://rafaelleru95103/
set spoolfile = "+INBOX"
unset record                # Gmail auto-stores in "+[Gmail].Sent Mail"
unset trash                 # Unset, deletion will remove labels
set postponed = "" 

mailboxes = =INBOX =Amazon =Compras =CrossFit =Github =Newsletter
