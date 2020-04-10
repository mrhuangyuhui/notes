FROM ruby:2.7.1

ENV COCOAPODS_VERSION 1.9.1

RUN useradd cocoapods \
    && gem sources --add https://gems.ruby-china.com/ --remove https://rubygems.org/ \
    && gem sources -l \
    && gem install cocoapods -v $COCOAPODS_VERSION

COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]

USER cocoapods
RUN pod setup

CMD [ "pod" ]