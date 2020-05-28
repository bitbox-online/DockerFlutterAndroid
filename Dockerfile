FROM bitboxonline/docker-android-sdk:latest

RUN apt-get update

# Fix locales
RUN apt-get -y install locales
RUN touch /usr/share/locale/locale.alias
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    locale-gen
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Installing missing prerequisites for Flutter
RUN apt-get -y install curl

# Installing Flutter
RUN git clone https://github.com/flutter/flutter.git -b stable --depth 1
ENV PATH="/flutter/bin:${PATH}"
RUN flutter precache

# Install Dart
RUN apt-get update
RUN apt-get -y install apt-transport-https
RUN sh -c 'wget -qO- https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -'
RUN sh -c 'wget -qO- https://storage.googleapis.com/download.dartlang.org/linux/debian/dart_stable.list > /etc/apt/sources.list.d/dart_stable.list'
RUN apt-get update
RUN apt-get -y install dart
