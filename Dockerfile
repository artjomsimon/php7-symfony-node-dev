FROM debian:jessie
MAINTAINER artjom.simon@gmail.com

USER root
RUN apt-get --yes --force-yes update \
    && apt-get install --yes --force-yes apt-transport-https lsb-release ca-certificates curl \
	&& echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list \
    && curl -o /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg \
    && apt-get update -qq -y \
    && apt-get --yes --force-yes install build-essential \
	php7.1-cli \
	php7.1-apcu \
	php7.1-pgsql \
	php7.1-apcu-bc \
	php7.1-curl \
	php7.1-json \
	php7.1-mcrypt \
	php7.1-opcache \
	php7.1-readline \
	php7.1-mbstring \
	php7.1-mysql \
	php7.1-xml \
	php7.1-zip \
	libpng12-0 \
	libpng12-dev \
	libpng \
	libpng-dev \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install Node.js
RUN curl -sL https://deb.nodesource.com/setup_7.x | bash - && \
  apt-get install -y nodejs git &&\
  npm install -g bower &&\
  npm install -g grunt &&\
  npm install -g gulp
