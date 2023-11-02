#!/usr/bin/env bash
set -Eeuo pipefail
cp example.env .env
set -a; source .env; set +a
export WP_ALLOW_MULTISITE=false
export WP_MULTISITE=""
composer update
composer install
wp --info --allow-root
wp db reset --yes

wp core install --url=${DOMAIN_CURRENT_SITE} --title="${SITE_TITLE}" --admin_user=admin --admin_password=randomtest --admin_email=info@johanmartin.dev --debug

# wp plugin activate woocommerce
wp core update-db
