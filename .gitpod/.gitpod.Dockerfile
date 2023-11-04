FROM gitpod/workspace-full

RUN sudo install-packages mariadb-client php-xdebug

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
  && chmod +x wp-cli.phar \
  && sudo mv wp-cli.phar /usr/local/bin/wp && wp --info

# Install AWS CLI
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip" -o "awscliv2.zip" \
&& unzip awscliv2.zip \
&& sudo ./aws/install

RUN alias wp-site='wp server --port=8000 --debug --color --host=127.0.0.1'
