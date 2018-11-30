rsync -r src/ docs/
rsync build/contracts/* docs/
git add .
git commit -m "Compile assets for Github Page"
git push -u origin master