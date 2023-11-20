# Basic WordPress development setup.
* Contains the basics needed to setup a WordPress site using composer

## How To
### Gitpod,io
1. Click on `Gitpod` open button
1. Run `./wp-site-setup.sh`
1. Start server `wp server --port=8000 --debug --color --host=127.0.0.1`
1. Access site at `http://localhost:8000`
1. Admin site: `http://localhost:8000/wp-admin`
1. Username and password in `./wp-site-setup.sh` script.

## Troubleshooting
### Database connectivity
* Issue with connecting to the database.
  * socket: '/var/run/mysqld/mysqld.sock' - This is the default socket for mysql
  * Added the socket to the wp-config.php file
  * in **example.env** - `WORDPRESS_DB_HOST=127.0.0.1:/var/run/mysqld/mysqld.sock`

## Resources
* wp-config.php
  * https://developer.wordpress.org/apis/wp-config-php/#configure-database-settings

### PHP tools and linters
* https://github.com/PHP-CS-Fixer/PHP-CS-Fixer
* https://phpstan.org/
* https://psalm.dev/docs/running_psalm/installation/
* https://github.com/rectorphp/rector
* https://robo.li/

* See `.gitpod.yml` file for list of vscode extensions.

## Gitpod Configuration
* Added custom `.gitpod.yml` file
* Added `gitpod.Dockerfile` file in `.gitpod` folder
* Added environment variables to Gitpod project.
