FROM ruby:2.5.1

# Installs the dependencies
RUN apt-get update && apt-get install -qq -y --no-install-recommends \
    build-essential libpq-dev imagemagick curl libmariadb-dev

# Install Node JS v12
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - \
    && apt-get install -y nodejs

# # Install Yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update && apt-get install -y yarn
      
# Defining the path
ENV INSTALL_PATH /work-time

# Creates the directory
RUN mkdir -p $INSTALL_PATH

# Defining the path as the main directory
WORKDIR $INSTALL_PATH

# Copy the Gemfile into the container
COPY Gemfile ./

# Defining the path for the Gems
ENV BUNDLE_PATH /box

# Copy the code into the container
COPY . .