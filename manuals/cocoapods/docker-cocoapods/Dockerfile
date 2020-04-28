FROM ruby:2.6.6

ENV COCOAPODS_VERSION 1.9.1

RUN useradd -m -s /bin/sh -U cocoapods \
    && gem sources --add https://gems.ruby-china.com/ --remove https://rubygems.org/ \
    && gem sources -l \
    && gem install cocoapods -v $COCOAPODS_VERSION

COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod a+x /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT ["docker-entrypoint.sh"]

USER cocoapods

CMD ["pod"]