FROM quay.io/ae_nestor/ruby

MAINTAINER Nestor G. Pestelos, Jr. "nestor@aelogica.com"

RUN mkdir -p /data/launcher
ADD ./ /data/launcher
RUN cd /data/launcher && bundle install
RUN cd /data/launcher && rake db:migrate

EXPOSE 3000
CMD cd /data/launcher && bundle exec rails server
