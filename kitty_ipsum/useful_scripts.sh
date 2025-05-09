grep -E --color 'cat[a-z]*|meow[a-z]*'
grep -n 'cat[a-z]*' kitty_ipsum_1.txt | sed -r 's/([0-9]+).*/\1/' >> kitty_info.txt
grep -o 'cat[a-z]*' kitty_ipsum_1.txt | wc -l >> kitty_info.txt
diff --color kitty_ipsum_1.txt doggy_ipsum_1.txt
./translate.sh kitty_ipsum_1.txt > doggy_ipsum_1.txt