## Build
```bash
docker build -t monitor .
```

## Run
```bash
docker run -p 3000:3000 -p 8125/udp:8125/udp -d monitor
```

## Test
```bash
echo "foo:17|g" | nc -u -w1 127.0.0.1 8125
echo "foo:19|g" | nc -u -w0 127.0.0.1 8125
```

## Troubleshooting: iptables issue fix if docker not properly cleaned up (optional)
```bash
iptables -t filter -N DOCKER
```
