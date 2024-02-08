#!/usr/bin/env bash
set -Eeuo pipefail

# is wordpress installed?
if wp core is-installed; then
	echo "WordPress is already installed."
else
	cp example.env .env
	set -a
	source .env
	set +a
	composer install
	wp db reset --yes
	wp core install --url=${DOMAIN_CURRENT_SITE} --title="${SITE_TITLE}" --admin_user=admin --admin_password=randomtest --admin_email=info@johanmartin.dev --debug
	wp core update-db
# Setup plugin
PLUGIN_DIR=/workspace/wordpress-development/wordpress/wp-content/plugins/docfox-contact-user
PLUGIN_FILE=/workspace/wordpress-development/wordpress/wp-content/plugins/docfox-contact-user/contact-user-plugin.php
if [ ! -f "$PLUGIN_FILE" ]; then
ln -s /workspace/docfox-contact-user /workspace/wordpress-development/wordpress/wp-content/plugins/docfox-contact-user
fi

# start server
wp server --port=8000 --debug --color --host=127.0.0.1
