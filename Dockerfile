FROM ruby:2.3-alpine

ENV FTP_HOST FTP_USERNAME FTP_PASSWORD FTP_CMD FTP_PROXY
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
RUN apk update && apk add --no-cache --update $RUN_PACKAGES $BUILD_PACKAGES \
  && gem install bundler \
  && bundle config --local github.https true \
  && bundle install --jobs 20 --retry 5 \
  && rm -rf /root/.bundle && rm -rf /root/.gem \
  && rm -rf /usr/local/bundle/cache \
  && apk del $BUILD_PACKAGES \
&& chown -R docker:docker /usr/local/bundle

# run microscanner
ARG AQUA_MICROSCANNER_TOKEN
RUN wget -O /microscanner https://get.aquasec.com/microscanner && \
  chmod +x /microscanner && \
  /microscanner ${AQUA_MICROSCANNER_TOKEN} --continue-on-failure && \
rm -rf /microscanner

COPY --chown=docker:docker . .
USER docker

RUN mkdir -p /home/docker/.lftp \
    && ruby compile.rb

CMD echo "set ftp:proxy ${FTP_PROXY}" > /home/docker/.lftp/rc \
    && lftp -u ${FTP_USERNAME},"${FTP_PASSWORD}" -e "${FTP_CMD}" ${FTP_HOST} 2>&1
