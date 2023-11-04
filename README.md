# Basic WordPress development setup.
* Can be used with a **.devcontainer**
* Contains the basics needed to setup a WordPress site using composer

## How To
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
