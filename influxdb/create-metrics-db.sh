sleep 10 && curl -G 'http://localhost:8086/query' --data-urlencode "q=CREATE DATABASE metrics" && curl -G 'http://localhost:8086/query' --data-urlencode 'q=CREATE RETENTION POLICY "default" ON "metrics" DURATION INF REPLICATION 1 DEFAULT'