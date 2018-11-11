git config user.name "$USER_NAME"
git config user.email "$USER_EMAIL"

find . -maxdepth 1 ! -name '_site' ! -name '.git' ! -name '.gitignore' -exec rm -rf {} \;
mv _site/* .
rm -R _site/

git checkout gh-pages
git pull origin gh-pages

git add -fA
git commit --allow-empty -m "$(git log master -1 --pretty=%B)"
git push origin gh-pages

echo "deployed successfully"
