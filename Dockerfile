FROM easycom/base
MAINTAINER Frédéric T <xmedias@easycom.digital>

# =========================================
# Update apt-cache and install pound
# =========================================

RUN DEBIAN_FRONTEND=noninteractive apt-get update \
	&& apt-get -y --no-install-recommends install pound \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 

## ================================
## LAUNCH PART
## ================================

ADD poundd /usr/local/bin/
RUN chmod +x /usr/local/bin/poundd

Expose 8080 443
VOLUME ["/pound-config"]

CMD ["poundd"]