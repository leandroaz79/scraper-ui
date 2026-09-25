FROM gosom/google-maps-scraper:v1.18.1

RUN apk add --no-cache nginx

COPY nginx.conf /etc/nginx/nginx.conf
COPY index.html /app/web/static/index.html

CMD ["sh", "-c", "nginx && exec /app/app -web -addr :8081 -data-folder /gmapsdata"]
