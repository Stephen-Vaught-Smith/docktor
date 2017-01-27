# use hypriot's alpine scratch image
FROM hypriot/rpi-alpine-scratch:latest

# Alpine doesn't have tor in the repository but it does have git
RUN apk update && apk add git
# So we will build tor from source
RUN git clone https://git.torproject.org/tor.git
RUN cd tor && sh autogen.sh && ./configure && make && make install
#bring in the config file
RUN rm -rf /etc/tor*
ADD ./doctorrc /etc/torrc

#expose default port for tor
EXPOSE 443

