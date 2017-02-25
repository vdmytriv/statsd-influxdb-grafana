{
  influxdb: {
    host: '127.0.0.1', // InfluxDB host (default 127.0.0.1)
    port: 8086, // InfluxDB port (default 8086)
    version: 1.2,
    database: 'metrics',  // InfluxDB db instance (required)
    username: 'root', // InfluxDB db username (required)
    password: 'root', // InfluxDB db password (required)
    retentionPolicy: 'default',
    flush: {
      enable: true // enable regular flush strategy (default true)
    },
    proxy: {
      enable: false, // enable the proxy strategy (default false)
      suffix: 'raw', // metric name suffix (default 'raw')
      flushInterval: 1000
    },
    includeStatsdMetrics: true,
    includeInfluxdbMetrics: true

  },
  port: 8125, // statsD port
  backends: ['./backends/console', 'statsd-influxdb-backend'],
  debug: false,
  legacyNamespace: false
}

