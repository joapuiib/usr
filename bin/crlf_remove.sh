sed -i $'s/\r//' $@
# find . -type f \( -name "*.erb" -o -iname "*.txt" \) | xargs file | grep CRLF | cut -f1 -d: | xargs sed -i $'s/\r//'
