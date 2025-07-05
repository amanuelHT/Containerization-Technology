## Containerization Technology
    
    This project demonstrates containerizing a Go app (Beetroot API) with Docker and Docker Compose, deployed behind reverse proxies (Nginx, Apache, Traefik). Developed for the IKT114G25V course at UIA.
---

## Features

- Multi-stage Docker build (Alpine) for minimal images
- Docker Compose for builds, env config, and secret mounts
- CI/CD pipeline with **GitLab + Kaniko**
- Reverse proxies with **Traefik**, **Nginx**, **Apache**, verifying secure routing & access control

---

## 🛠 Installation & Usage

1. **Clone the repository:**

    ```bash
    git clone https://github.com/amanuelHT/Containerization-Technology.git
    cd Containerization-Technology
    ```

2. **Build & run with Docker Compose:**

    ```bash
    docker compose up -d
    ```

3. Access the Beetroot API via:

- `http://localhost/api/v1/file/` (served through reverse proxy)
- direc `8080` is blocked.

---

## Structure

- `beetroot/` - Contains Dockerfile, .env, docker-compose.yml for the main Beetroot app.
- `nginx/`, `apache/`, `traefik/` - Each contains Compose files and configs for running the Beetroot app behind different reverse proxies.

---

## CI/CD

-- Builds with Kaniko in GitLab CI
- Pushes to GitLab Container Registry under `registry.internal.uia.no`.

---


## 📜 License

This project is part of university coursework. For learning and demonstration purposes only.

