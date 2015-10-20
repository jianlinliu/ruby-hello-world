FROM openshift/ruby-20-centos7

RUN gem install sinatra sinatra-activerecord mysql2 --no-ri --no-rdoc

ADD . /tmp/
USER root
RUN chown -R ruby:ruby /tmp/*

USER ruby
WORKDIR /tmp/

ENV RACK_ENV production
ENV RAILS_ENV production
ENV HTTP_PROXY file.rdu.redhat.com:3128

EXPOSE 8080
CMD ["ruby", "app.rb"]
