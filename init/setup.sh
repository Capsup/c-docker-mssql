# Wait for SQL Server to be started
sleep 30s

# Run the setup script to create the database
/opt/mssql-tools/bin/sqlcmd -S 127.0.0.1,1433 -U SA -P $SA_PASSWORD -i restore.sql