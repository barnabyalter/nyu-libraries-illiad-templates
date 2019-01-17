FROM ruby:2.3.7-alpine

ENV HOST USERNAME PASSWORD 
ENV INSTALL_PATH /app
ENV BUNDLER_VERSION "2.0.1"

RUN addgroup -g 1000 -S docker && \
  adduser -u 1000 -S -G docker docker

WORKDIR ${INSTALL_PATH}
RUN chown docker:docker .

# bundle install
COPY Gemfile Gemfile.lock ./
ARG RUN_PACKAGES="ca-certificates lftp nodejs tzdata openjdk7-jre"
ARG BUILD_PACKAGES="ruby-dev build-base libffi-dev"
RUN apk add --no-cache --update $RUN_PACKAGES $BUILD_PACKAGES \
  && gem install bundler \
  && bundle config --local github.https true \
  && bundle install --jobs 20 --retry 5 \
  && rm -rf /root/.bundle && rm -rf /root/.gem \
  && rm -rf /usr/local/bundle/cache \
  && apk del $BUILD_PACKAGES \
&& chown -R docker:docker /usr/local/bundle

COPY --chown=docker:docker . .
RUN ruby compile.rb

CMD lftp -u ${USERNAME},"${PASSWORD}" -e "put ./error.asp; mput ./dist/views/*.html; mirror -R ./sass/lib/images; cd ./javascripts; put ./dist/javascripts/illiad.js; cd ../stylesheets; put ./dist/stylesheets/illiad.css; exit" ${HOST}