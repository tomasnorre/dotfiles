#!/bin/sh

PHP_VERSIONS='8.1 8.2 8.3'
PHP_EXTS='cli common curl gmp intl mbstring mysql opcache readline soap sqlite3 xml zip pgsql'
TOTAL="";

for ext in $PHP_EXTS; do 
    for php in $PHP_VERSIONS; do 
        echo -n "php${php}-${ext} "
    done
done

