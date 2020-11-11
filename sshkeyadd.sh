ssh-keygen -t rsa -b 4096 -C "wynalazca47@gmial.com" << EOF

password
password
EOF
eval "$(ssh-agent -s)"
ssh-add id_rsa
xclip -selection clipboard < id_rsa.pub
