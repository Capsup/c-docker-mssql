FROM mcr.microsoft.com/mssql/server:latest

# Set metadata that we use the port of 1433 internally
EXPOSE 1433

# Project file location
ARG PROJECT_DIR=./mssql/

# Environment
ENV MSSQL_SA_PASSWORD=P@ssword123
ENV SA_PASSWORD=${MSSQL_SA_PASSWORD}
ENV ACCEPT_EULA=Y

USER root
# Create project directory and fix ownership
RUN mkdir -p $PROJECT_DIR
RUN mkdir -p $PROJECT_DIR/init/
RUN chown mssql $PROJECT_DIR
RUN chown mssql $PROJECT_DIR/init/

USER mssql
# Copy in scripts
COPY ./init/entrypoint.sh $PROJECT_DIR/entrypoint.sh
COPY ./init/setup.sh $PROJECT_DIR/setup.sh
COPY ./init/restore.sql $PROJECT_DIR/restore.sql

USER root
# Grant permissions for scripts to be executable
RUN chmod +x $PROJECT_DIR/entrypoint.sh
RUN chmod +x $PROJECT_DIR/setup.sh

USER mssql

CMD [ "/opt/mssql/bin/sqlservr" ]
ENTRYPOINT [ "/mssql/entrypoint.sh" ]