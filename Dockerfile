FROM ruby

ARG PROJECT_DIR=/app
WORKDIR ${PROJECT_DIR}

ADD . .
RUN bundle install

EXPOSE 5000
CMD ./start.sh
