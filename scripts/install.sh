#!/bin/sh


curl https://raw.githubusercontent.com/freecracy/l/master/b.sh > b
chmod +x b
mv b /usr/local/bin/b

cat <<-'EOF'

   b help

EOF
