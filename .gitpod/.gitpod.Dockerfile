FROM gitpod/workspace-full

USER gitpod

RUN sudo install-packages mariadb-client php-xdebug

# Install Ngrok
RUN curl -s https://ngrok-agent.s3.amazonaws.com/ngrok.asc | \
  && sudo tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null && \
  && echo "deb https://ngrok-agent.s3.amazonaws.com buster main" | \
  && sudo tee /etc/apt/sources.list.d/ngrok.list && \
  && sudo apt update && sudo apt install ngrok

# Install 1Password CLI
RUN ARCH="amd64" \
  && wget "https://cache.agilebits.com/dist/1P/op2/pkg/v2.22.0/op_linux_${ARCH}_v2.22.0.zip" -O op.zip \
  && unzip -d op op.zip \
  && sudo mv op/op /usr/local/bin \
  && rm -r op.zip op \
  && sudo groupadd -f onepassword-cli \
  && sudo chgrp onepassword-cli /usr/local/bin/op \
  && sudo chmod g+s /usr/local/bin/op

# Setup NVM - Latest lts version
RUN bash -c 'source $HOME/.nvm/nvm.sh && nvm install --lts --default \
    && nvm use --lts'

RUN echo "source $HOME/.nvm/nvm.sh && nvm use default &>/dev/null" >> ~/.bashrc.d/51-nvm-fix

# Install Composer
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
  && chmod +x wp-cli.phar \
  && sudo mv wp-cli.phar /usr/local/bin/wp && wp --info

# Install PHIVE
RUN wget -O phive.phar "https://phar.io/releases/phive.phar" \
	&& wget -O phive.phar.asc "https://phar.io/releases/phive.phar.asc" \
	&& gpg --keyserver hkps://keys.openpgp.org --recv-keys 0x6AF725270AB81E04D79442549D8A98B29B2D5D79 \
	&& gpg --verify phive.phar.asc phive.phar \
	&& rm phive.phar.asc \
	&& chmod +x phive.phar \
	&& sudo mv phive.phar /usr/local/bin/phive && phive version

# Setup ZSH
ENV SHELL=/usr/bin/zsh
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
