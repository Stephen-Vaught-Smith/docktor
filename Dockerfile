# use hypriot's alpine scratch image
FROM hypriot/rpi-alpine-scratch:latest


RUN apk update && apk add git
RUN git clone https://git.torproject.org/tor.git
RUN cd tor && sh autogen.sh && ./configure.ac && make && make install
#bring in the config file
RUN rm -rf /etc/tor*
ADD ./doctorrc /etc/torrc

#expose default port for tor
EXPOSE 443

