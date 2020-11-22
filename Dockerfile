FROM balenalib/rpi-debian:build AS builder

RUN apt update && apt install -y git cmake libavahi-compat-libdnssd-dev libplist-dev libssl-dev g++ wget zip


RUN apt install -y unzip
RUN apt install -y libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev
WORKDIR /work

# Get the raspberry pi firmware library
RUN wget https://github.com/raspberrypi/firmware/archive/master.zip

#COPY firmware-master.zip /work/master.zip
RUN unzip master.zip 'firmware-master/opt/*' -d .

#RUN mv ./firmware-master/opt/vc/ /opt
RUN mv ./firmware-master/opt/vc/include/ /opt/vc
RUN mv ./firmware-master/opt/vc/src/ /opt/vc



# Get RPiPlay source code
RUN git clone https://github.com/FD-/RPiPlay.git
WORKDIR /work/RPiPlay

# Copy the libdns_sd library
RUN mkdir build
RUN cp /usr/lib/arm-linux-gnueabihf/libdns_sd.so.1 ./build/

# Alter the cmake file to use the libdns_sd library locally
RUN printf "\nadd_library(dns_sd SHARED IMPORTED GLOBAL)\nset_target_properties(dns_sd PROPERTIES IMPORTED_LOCATION \"./libdns_sd.so.1\")\n" >>./lib/CMakeLists.txt

RUN cd build && cmake .. && make

FROM balenalib/rpi-debian:buster 

COPY --from=builder /work/RPiPlay/build /rpiplay/

RUN apt update && apt install -y libavahi-compat-libdnssd-dev libplist-dev libssl-dev && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /rpiplay

COPY ./docker_entry.sh .

RUN chmod +x docker_entry.sh

ENTRYPOINT ["bash","-c","./docker_entry.sh"]
