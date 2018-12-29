git config user.name "$USER_NAME"
git config user.email "$USER_EMAIL"

git checkout -b gh-pages origin/gh-pages

find . -maxdepth 1 ! -name '_site' ! -name '.git' ! -name '.gitignore' ! -name 'CNAME' ! -name '.' ! -name '.circleci' -exec rm -rf {} \;
mv _site/* .
rm -R _site/

cat .circleci/config.yml

git add -fA
git commit --allow-empty -m "$(git log master -1 --pretty=%B)"
git push origin gh-pages

echo "deployed successfully"
