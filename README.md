# build
docker build -t monitor .

# run
docker run -p 3000:3000 -p 8125:8125/udp -d monitor