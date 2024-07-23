#!/bin/bash

echo "Starting restore NOW!"

# Run the setup script to create the database
/opt/mssql-tools/bin/sqlcmd -S 127.0.0.1,1433 -U SA -P $SA_PASSWORD -i /mssql/restore.sql

echo "All restore finished!"