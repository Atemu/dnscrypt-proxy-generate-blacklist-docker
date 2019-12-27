FROM alpine

RUN apk add --no-cache python git
RUN echo \
    "[ -d /blacklist/ ] || { echo \"Did you mount the volume?\" && exit 1 ; } ;\
    if [ -d /blacklist/dnscrypt-proxy/ ] ; then \
      git -C /blacklist/dnscrypt-proxy/ fetch || exit 1 ;\
      git -C /blacklist/dnscrypt-proxy/ reset --hard origin/master || exit 1 ;\
    else \
      git clone https://github.com/DNSCrypt/dnscrypt-proxy /blacklist/dnscrypt-proxy/ || exit 1 ;\
    fi ;\
    cd /blacklist/dnscrypt-proxy/utils/generate-domains-blacklists/ && \
    python generate-domains-blacklist.py > blacklist.txt && cp blacklist.txt /blacklist/" \
    > /update.sh

CMD ["sh", "/update.sh"]
