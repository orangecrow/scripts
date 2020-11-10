ssh-keygen -t ed25519 -C "wynalazca47@gmial.com"
cd .ssh
ssh-keygen -t rsa -b 4096 -C "wynalazca47@gmial.com" << EOF
git-key
password
password
EOF
eval "$(ssh-agent -s)"
ssh-add git-key
xclip -selection clipboard < git-key.pub
