FROM gitpod/workspace-full

USER gitpod

RUN sudo install-packages mariadb-client php-xdebug

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

# Setup ZSH
ENV SHELL=/usr/bin/zsh
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
