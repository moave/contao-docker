# NodeJS+Bower+Grunt
FROM library/node

MAINTAINER Moave Medien <support@moave.de>

# Install Bower & Grunt
RUN npm install -g bower grunt-cli && \
    echo '{ "allow_root": true }' > /root/.bowerrc

# Define working directory.
WORKDIR /app

# Define default command.
CMD ["bash"]