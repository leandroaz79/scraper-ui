FROM gosom/google-maps-scraper:v1.18.1

RUN apt-get update && apt-get install -y --no-install-recommends nginx && rm -rf /var/lib/apt/lists/*

# Remove default nginx config and site
RUN rm -f /etc/nginx/sites-enabled/default

COPY nginx.conf /etc/nginx/nginx.conf
COPY index.html /app/web/static/index.html

CMD ["sh", "-c", "nginx && exec /app/app -web -addr :8081 -data-folder /gmapsdata"]
