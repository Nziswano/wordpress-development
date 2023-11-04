#!/usr/bin/env bash
set -Eeuo pipefail
cp example.env .env
set -a; source .env; set +a
composer update
composer install

wp db reset --yes

wp core install --url=${DOMAIN_CURRENT_SITE} --title="${SITE_TITLE}" --admin_user=admin --admin_password=randomtest --admin_email=info@johanmartin.dev --debug

wp core update-db

# Setup plugin
ln -s /workspace/docfox-plugin /workspace/wordpress-development/wordpress/wp-con
tent/plugins
