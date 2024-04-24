[user]
signingkey = ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHoO/i9i/WWcPIzEroeXYfShhT0pciLZS/eeBi+jANZN

[commit]
gpgsign = true

[gpg]
format = ssh

[gpg "ssh"]
program = /Applications/1Password.app/Contents/MacOS/op-ssh-sign
allowedSignersFile = ~/.git/allowed_signers