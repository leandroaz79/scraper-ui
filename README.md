# Google Maps Scraper — Web UI

Interface web para o [google-maps-scraper](https://github.com/gosom/google-maps-scraper). Inclui mapa interativo para seleção de localização, formulário de scraping e visualização de resultados.

![Interface](https://img.shields.io/badge/status-active-brightgreen) ![Docker](https://img.shields.io/badge/docker-ready-blue)

## Funcionalidades

- **Mapa interativo** — clique para selecionar a localização ou busque por cidade/endereço
- **Formulário de scraping** — palavra-chave, profundidade, tempo máximo, extração de emails
- **Lista de jobs** — acompanhe o status em tempo real
- **Visualização de resultados** — tabela com filtro e download CSV

## Deploy com Dokploy

1. Faça push deste repositório para o GitHub
2. No Dokploy, crie um novo service **Docker Compose**
3. Conecte ao repositório GitHub
4. O Dokploy vai buildar o Dockerfile automaticamente
5. Configure o domínio e faça deploy

### docker-compose.yml

```yaml
services:
  google-maps-scraper:
    build: .
    container_name: gmaps-scraper
    restart: unless-stopped
    ports:
      - "8080:8080"
    volumes:
      - gmaps_data:/gmapsdata
      - gmaps_cache:/opt

volumes:
  gmaps_data:
  gmaps_cache:
```

## Deploy manual (VPS)

```bash
git clone https://github.com/SEUUsuario/scraper-ui.git
cd scraper-ui
docker compose up -d
```

Acesse `http://SEU_IP:8080`

## Arquitetura

```
Nginx (porta 8080)
├── /         → index.html (frontend)
├── /api/*    → Go app (porta 8081)
├── /jobs     → Go app
├── /scrape   → Go app
├── /view     → Go app
└── /download → Go app
```

O Nginx serve o frontend e faz proxy reverso para a API do scraper.

## Tecnologias

- [gosom/google-maps-scraper](https://github.com/gosom/google-maps-scraper) — scraper engine
- [Leaflet.js](https://leafletjs.com/) — mapa interativo
- [OpenStreetMap](https://www.openstreetmap.org/) — tiles do mapa
- [Nginx](https://nginx.org/) — proxy reverso
- Docker — containerização

## Licença

MIT
