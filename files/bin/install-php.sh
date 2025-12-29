#!/bin/sh

#PHP_VERSIONS='8.4'
PHP_VERSIONS='8.5'
PHP_EXTS='mongodb cli common curl gmp intl mbstring mysql opcache readline soap sqlite3 xml zip pgsql xdebug'
#PHP_EXTS='cli common curl intl soap xml zip'
TOTAL="";

for ext in $PHP_EXTS; do 
    for php in $PHP_VERSIONS; do 
        echo -n "php${php}-${ext} "
    done
done

