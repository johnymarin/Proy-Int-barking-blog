FROM ubuntu:18.04

#Perequisites
RUN apt update && apt install -y curl git unzip xz-utils zip libglu1-mesa openjdk-8-jdk wget



# Update the package list and install chrome
RUN apt-get update -y
RUN curl -LO https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN apt-get install -y ./google-chrome-stable_current_amd64.deb
RUN rm google-chrome-stable_current_amd64.deb

RUN apt-get install -y libgconf-2-4 gdb libstdc++6 fonts-droid-fallback lib32stdc++6 python3
RUN apt-get clean


#Set up new User

RUN useradd -ms /bin/bash developer
USER developer
WORKDIR /home/developer


RUN mkdir -p Android/sdk
ENV ANDROID_SDK_ROOT /home/developer/Android/sdk
RUN mkdir -p .android && touch .android/repositories.cfg

# Set up Android SDK
RUN wget -O sdk-tools.zip https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip
RUN unzip sdk-tools.zip && rm sdk-tools.zip
RUN mv tools Android/sdk/tools
RUN cd Android/sdk/tools/bin && yes | ./sdkmanager --licenses
RUN cd Android/sdk/tools/bin && ./sdkmanager "build-tools;29.0.2" "patcher;v4" "platform-tools" "platforms;android-29" "sources;android-29"
RUN cd Android/sdk/tools/bin && ./sdkmanager --install "cmdline-tools;latest"
ENV PATH "$PATH:/home/developer/Android/sdk/platform-tools"


# Download Flutter SDK
RUN git clone https://github.com/flutter/flutter.git
ENV PATH "$PATH:/home/developer/flutter/bin"


RUN flutter config --enable-web
RUN flutter doctor --android-licenses

# Run basic check to download Dark SDK
RUN flutter doctor



# Copy files to container and build
RUN mkdir app/
COPY . /app/
WORKDIR /app/
RUN flutter build web

# Record the exposed port
EXPOSE 5000

# make server startup script executable and start the web server
RUN ["chmod", "+x", "/app/server/server.sh"]

ENTRYPOINT [ "/app/server/server.sh"]
