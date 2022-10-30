sudo apt install nginx

etc/nginx/nginx.conf

добавить после

    include /etc/nginx/conf.d/*.conf;
    include /etc/nginx/sites-enabled/*;
		
вот это:

server {
    listen 1313 default_server;
    root /var/www/html/metrics;
    index report.html;

    location /metrics {
        add_header Content-Type text/plain;
        default_type "text/html";
        alias /var/www/html/metrics;
    }
}

etc/prometheus/prometheus.yml

  - job_name: script
    # If prometheus-node-exporter is installed, grab stats about the local
    # machine by default.
    scrape_interval: 3s
    static_configs:
    - targets: ['localhost:1313']