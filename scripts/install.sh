#!/bin/sh


curl https://raw.githubusercontent.com/freecracy/i/master/i.sh > i
chmod +x i
mv i /usr/local/bin/i

cat <<-'EOF'

   i help

EOF
