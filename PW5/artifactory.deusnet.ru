## add ssl entries when https has been set in config
ssl_protocols TLSv1.3;
ssl_certificate      /opt/jfrog/artifactory/var/etc/security/ssl/deusnet.ru.crt;
ssl_certificate_key  /opt/jfrog/artifactory/var/etc/security/ssl/deusnet.ru.key;
ssl_session_cache shared:SSL:1m;
## ssl_prefer_server_ciphers   on;
## server configuration

server {
    listen 443 ssl;
    listen 80 ;


    server_name artifactory.deusnet.ru;

    if ($http_x_forwarded_proto = '') {
        set $http_x_forwarded_proto  $scheme;
    }
    ## Application specific logs
    ## access_log /var/log/nginx/artifactory.deusnet.ru-access.log timing;
    ## error_log /var/log/nginx/artifactory.deusnet.ru-error.log;
    rewrite ^/$ /ui/ redirect;
    rewrite ^/ui$ /ui/ redirect;
    chunked_transfer_encoding on;
    client_max_body_size 0;
    location / {
        proxy_read_timeout  2400s;
        proxy_pass_header   Server;
        proxy_cookie_path   ~*^/.* /;
        proxy_pass          http://31.31.199.89:8082;
        proxy_next_upstream error timeout non_idempotent;
        proxy_next_upstream_tries    1;
        proxy_set_header    X-JFrog-Override-Base-Url $http_x_forwarded_proto://$host:$server_port;
        proxy_set_header    X-Forwarded-Port  $server_port;
        proxy_set_header    X-Forwarded-Proto $http_x_forwarded_proto;
        proxy_set_header    Host              $http_host;
        proxy_set_header    X-Forwarded-For   $proxy_add_x_forwarded_for;
 
        location ~ ^/artifactory/ {
            proxy_pass    http://31.31.199.89:8081;
        }
    }
}