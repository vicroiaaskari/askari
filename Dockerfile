FROM ghcr.io/mhsanaei/3x-ui:latest

# nginx + envsubst (gettext) to render the config with Railway's $PORT at runtime
RUN apk add --no-cache nginx gettext

COPY nginx.conf.template /etc/nginx/http.d/default.conf.template
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Panel will be reachable under this path (change if you want)
ENV XUI_INIT_WEB_BASE_PATH=/managepanel/

EXPOSE 3000

ENTRYPOINT ["/start.sh"]
