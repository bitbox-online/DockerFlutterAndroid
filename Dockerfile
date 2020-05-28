FROM bitboxonline/docker-android-sdk:latest

ARG FLUTTER_VERSION="1.17.1"

RUN apt-get update

# Installing missing prerequisites for Flutter
RUN apt-get -y install curl

# Installing Flutter
RUN git clone https://github.com/flutter/flutter.git -b stable --depth 1
ENV PATH="/flutter/bin:${PATH}"
RUN flutter precache
