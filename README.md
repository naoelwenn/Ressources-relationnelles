# Ressources-relationnelles
Projet fil rouge bachelor CDA 

## CI/CD

Badges:

![CI](https://github.com/${GITHUB_REPOSITORY}/actions/workflows/ci.yml/badge.svg)
![CD](https://github.com/${GITHUB_REPOSITORY}/actions/workflows/cd.yml/badge.svg)

Déploiement d'images Docker vers Docker Hub:

- Créez deux secrets GitHub dans les paramètres du dépôt:
  - `DOCKERHUB_USERNAME`
  - `DOCKERHUB_TOKEN` (Personal Access Token Docker Hub)
- Les workflows taguent et poussent:
  - API: `${DOCKERHUB_USERNAME}/ressourcesr-api:latest` et `:${GITHUB_SHA}`
  - Client: `${DOCKERHUB_USERNAME}/ressourcesr-client:latest` et `:${GITHUB_SHA}`


