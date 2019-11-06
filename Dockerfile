FROM ruby:2.6.2-alpine

ENV FTP_HOST FTP_USERNAME FTP_PASSWORD FTP_CMD FTP_PROXY
ENV INSTALL_PATH /app
ENV BUNDLER_VERSION "2.0.1"

RUN addgroup -g 1000 -S docker && \
  adduser -u 1000 -S -G docker docker

WORKDIR ${INSTALL_PATH}

# bundle install
COPY Gemfile Gemfile.lock ./
ARG RUN_PACKAGES="ca-certificates lftp nodejs tzdata openjdk7-jre"
ARG BUILD_PACKAGES="ruby-dev build-base libffi-dev"
RUN apk update && apk add --no-cache --update $RUN_PACKAGES $BUILD_PACKAGES \
  && gem install bundler -v ${BUNDLER_VERSION} \
  && bundle config --local github.https true \
  && bundle install --jobs 20 --retry 5 \
  && rm -rf /root/.bundle && rm -rf /root/.gem \
  && rm -rf /usr/local/bundle/cache \
  && apk del $BUILD_PACKAGES \
  && chown -R docker:docker /usr/local/bundle \
&& chown -R docker:docker ${INSTALL_PATH}

# run microscanner
ARG AQUA_MICROSCANNER_TOKEN
RUN wget -O /microscanner https://get.aquasec.com/microscanner && \
  chmod +x /microscanner && \
  /microscanner ${AQUA_MICROSCANNER_TOKEN} --continue-on-failure && \
rm -rf /microscanner

COPY --chown=docker:docker . .
USER docker

# Compile from Ruby templates for NYU (i.e. ZYU aka default) institution
RUN mkdir -p /home/docker/.lftp \
    && echo "set log:enabled true\n \
set log:file ''\n\
set net:timeout 10\n\
set net:max-retries 2\n\
set net:reconnect-interval-base 5\n" >> /home/docker/.lftp/rc \
    && ruby compile.rb

# Copy prebuilt ILLiad HTML templates for TNS (i.e. ZMU) institution
RUN mkdir -p ./ZMU \
    && cp -R institutions/ZMU/images ZMU/ \
    && cp -R institutions/ZMU/javascripts ZMU/ \
    && cp -R institutions/ZMU/stylesheets ZMU/ \
    && cp institutions/ZMU/views/*.html ZMU/

# CMD echo "set ftp:proxy ${FTP_PROXY}\n" >> /home/docker/.lftp/rc \
    # && lftp -u ${FTP_USERNAME},"${FTP_PASSWORD}" -e "${FTP_CMD}" ${FTP_HOST} 2>&1
CMD lftp -u ${FTP_USERNAME},"${FTP_PASSWORD}" -e "${FTP_CMD}" ${FTP_HOST} 2>&1
