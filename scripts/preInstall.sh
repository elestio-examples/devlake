set env vars
set -o allexport; source .env; set +o allexport;

ENCRYPTION_SECRET=$(openssl rand -base64 2000 | tr -dc 'A-Z' | fold -w 128 | head -n 1)

cat << EOT >> ./.env

ENCRYPTION_SECRET=${ENCRYPTION_SECRET}
EOT

mkdir -p ./storage/grafana-storage