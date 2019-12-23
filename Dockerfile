FROM php:7.2.17-alpine

LABEL Maintainer M.S.H <sholichul.huda@kly.id>

RUN apk add --no-cache openssh-client\
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && composer global require hirak/prestissimo --no-suggest --no-progress \
    && curl -LO https://deployer.org/deployer.phar \
    && mv deployer.phar /usr/local/bin/dep \
    && chmod +x /usr/local/bin/dep \
    && composer clear-cache
