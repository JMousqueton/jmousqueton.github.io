cd ../Configuration-Hugo/jmousqueton.github.io
git add . 
git commit -m "configuration update $(date)"
git push
cd -
hugo -enableGitInfo --minify -v
cd public/
git add .
git commit -m "rebuilding site $(date)"
git push
cd -
