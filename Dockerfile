FROM mcr.microsoft.com/mssql/server:latest

# Project files
ARG PROJECT_DIR=.

#USER root
#RUN mkdir -p $PROJECT_DIR
#RUN chown mssql $PROJECT_DIR

#USER mssql
#WORKDIR $PROJECT_DIR

USER root
# Create project directory
RUN mkdir -p $PROJECT_DIR
RUN chown mssql $PROJECT_DIR

USER mssql
# Copy in scripts
COPY ./init/ $PROJECT_DIR

USER root
# Grant permissions for scripts to be executable
RUN chmod +x $PROJECT_DIR/entrypoint.sh
RUN chmod +x $PROJECT_DIR/setup.sh

USER mssql

CMD ["/bin/bash", "entrypoint.sh"]