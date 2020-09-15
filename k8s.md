PostgreSQL chart:

To connect to your database from outside the cluster execute the following commands:

    kubectl port-forward --namespace campus-dev svc/hotdesk-server-postgresql 5432:5432 &
    PGPASSWORD="$POSTGRES_PASSWORD" psql --host 127.0.0.1 -U ((redacted)) -d hotdesk -p 5432
    