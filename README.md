# Basic WordPress development setup.

-   Contains the basics needed to setup a WordPress site using composer

## How To

1. Start server `wp server --port=8000 --debug --color --host=127.0.0.1`
1. Ngrok: `ngrok http 8000 --domain ${NGROK_DOMAIN} --authtoken ${NGROK_AUTH_TOKEN} --config ngrok.yml`

#### Access Site

1. Access site at `http://localhost:8000`
1. Admin site: `http://localhost:8000/wp-admin`
1. Username and password in `./wp-site-setup.sh` script.

## Troubleshooting

### Database connectivity

-   Issue with connecting to the database.
    -   socket: '/var/run/mysqld/mysqld.sock' - This is the default socket for mysql
    -   Added the socket to the wp-config.php file
    -   in **example.env** - `WORDPRESS_DB_HOST=127.0.0.1:/var/run/mysqld/mysqld.sock`
