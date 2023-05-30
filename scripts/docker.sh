#!/bin/sh

DOCKER_COMPOSE_FILE="docker-compose.yaml"

option="${1}"
case ${option} in
  "build")
    docker-compose build
    ;;
  "console")
    docker-compose run --rm api-serve /bin/bash
    ;;
  "down")
    # Remove the container volumes
    docker-compose down -v
    ;;
  "logs")
    docker-compose logs -f
    ;;
  "run")
    docker-compose up
    ;;
  "setup")
    docker-compose build && docker-compose run --rm api-serve scripts/docker/setup_db.sh
    ;;
  "setup-db")
    printf "Migrating and seeding the db...\n"
    docker-compose run --rm api-serve scripts/docker/setup_db.sh
    ;;
  *)
    echo "Usage: ${0} [build|console|down|logs|run|setup]"
    exit 1
    ;;
esac

