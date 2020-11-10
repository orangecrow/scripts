USER=orangecrow
curl -u "$USER" https://api.github.com/user/repos -d "{\"name\":\"$1\"}"
echo "# $1" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin git@github.com:$USER/$1.git
git push -u origin main
