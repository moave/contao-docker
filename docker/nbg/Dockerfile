# NodeJS+Bower+Grunt
FROM library/node

MAINTAINER Moave Medien <support@moave.de>

# Install Bower & Grunt
RUN npm install -g bower grunt && \
    echo '{ "allow_root": true }' > /root/.bowerrc

# Define working directory.
WORKDIR /app

# Change to the app user.
USER node

# Define default command.
CMD ["bash"]
