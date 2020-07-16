docker exec -it "${1:-shard1}" psql -U postgres ${2:-}
