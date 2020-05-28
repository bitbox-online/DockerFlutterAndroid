FROM bitboxonline/docker-android-sdk:latest

RUN apt-get update

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
