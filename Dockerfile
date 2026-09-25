FROM gosom/google-maps-scraper:v1.18.1

# Replace the original frontend with our custom one
COPY index.html /app/web/static/index.html
