[user]
signingkey = ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIC2fCcvC2F+m/sbPdA1Derlb+m6uXOZONZliMDHeC8Cb

[commit]
gpgsign = true

[gpg]
format = ssh

[gpg "ssh"]
program = /Applications/1Password.app/Contents/MacOS/op-ssh-sign
allowedSignersFile = ~/.git/allowed_signers