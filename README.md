# build
docker build -t monitor .

# run
docker run -p 3000:3000 -p 8125/udp:8125/udp -d monitor

# test
echo "foo:17|g" | nc -u -w1 127.0.0.1 8125
echo "foo:19|g" | nc -u -w0 127.0.0.1 8125

# iptables issue fix if stuck (optional)
iptables -t filter -N DOCKER