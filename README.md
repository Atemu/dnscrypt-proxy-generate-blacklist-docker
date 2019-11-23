#dnscrypt-proxy-generate-blacklist-docker

This is a Docker image that fetches the latest DNSCrypt master and runs
`utils/generate-domains-blacklists/generate-domains-blacklist.py` to compile
hosts files from a few maintainers into a file DNSCrypt can understand.

It'll create a the file at `/blacklist/blacklist.txt`, a volume mounted on `/blacklist/` is required!
