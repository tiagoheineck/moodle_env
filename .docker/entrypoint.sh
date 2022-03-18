#!/bin/sh

set -e

if ! [ -f "/var/www/html/moodle/index.php" ]; then
    echo "[ ****** ] Clonando o moodle na versão ${MOODLE_VERSION}"    
    git clone -b "MOODLE_${MOODLE_VERSION}_STABLE" git://git.moodle.org/moodle.git /var/www/html/moodle
fi

chown www-data:www-data /var/www/html/moodledata
chown www-data:www-data /var/www/html/moodle

chmod 777 -R /var/www/html


exec "$@"
