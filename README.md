# Basic WordPress development setup.
* Can be used with a **.devcontainer**
* Contains the basics needed to setup a WordPress site using composer

## How To
### Gitpod,io
1. Click on `Gitpod` open button
1. Run `./wp-site-setup.sh`
1. Start server `wp server --port=8000 --debug --color --host=127.0.0.1'`
1. Access site at `http://localhost:8000`
1. Username and password in `./wp-site-setup.sh` script.

## Locally with **.devcontainer**
* See: https://github.com/johanmartindev/wp-devcontainer
1. Make a new folder that will hold your .devcontainer and this wordpress dev repo (2 separate folders)
  1. `mkdir my-dev-space`
1. Go into the directory and checkout the necessary repositories
  1. `cd my-dev-space`
  1. `git checkout git@github.com:johanmartindev/wp-devcontainer.git .devcontainer` - The name is key for this to work
  1. `git checkout git@github.com:johanmartindev/wordpress-development.git wordpress-dev` - Where the magic happens
1. Launch the devcontainer in VS Code
1. Go into the **wordpress-dev** folder
  1. `cd wordpress-dev`
1. Run `composer install`
1. Run `wp-site-setup.sh`
1. Launch the site
  1. `wp server --port=8000 --debug --color --host=127.0.0.1`
1. Create an alias
  1. `alias wp-site='wp server --port=8000 --debug --color --host=127.0.0.1'`

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
