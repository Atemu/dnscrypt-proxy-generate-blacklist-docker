FROM alpine

RUN apk add --no-cache python git
RUN echo \
    "cd /blacklist/ || { echo \"Did you mount the volume?\" && exit 1 ; } ;\
    git clone https://github.com/DNSCrypt/dnscrypt-proxy || { cd dnscrypt-proxy && git pull || exit 1 ; } ;\
    cd dnscrypt-proxy/utils/generate-domains-blacklists/ ;\
    python generate-domains-blacklist.py > /blacklist/blacklist.txt" \
    > /update.sh

CMD ["sh", "/update.sh"]
