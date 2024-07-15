# Use a slim version of the Python base image
# To push a multi-platform build, use: docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7 -t <image-name> --push .
FROM --platform=linux/amd64 python:3.9.14-slim as python-base

WORKDIR /

# Combine apt-get commands and clean up after installations
# Installing snowflake CLI
RUN apt-get clean \
 && apt-get update \
 && apt-get -y upgrade \
 && apt-get --allow-releaseinfo-change update \
 && rm -rf /var/lib/apt/lists/* \
 && pip install --no-cache-dir pipx \
 && pipx ensurepath \
 && pipx install snowflake-cli-labs 


# Create a directory in the container
RUN mkdir -p /root/.config/snowflake/

# Copy config file to container
COPY config.toml /root/.config/snowflake/config.toml
RUN chmod 0600 /root/.config/snowflake/config.toml

CMD [ "/bin/bash" ]