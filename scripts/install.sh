#!/bin/sh


curl https://raw.githubusercontent.com/freecracy/l/master/i.sh > i
chmod +x i
mv i /usr/local/bin/i

cat <<-'EOF'

   i help

EOF
