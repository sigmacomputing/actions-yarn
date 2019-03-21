FROM node:10.13

LABEL version="1.1.0"
LABEL repository="https://github.com/nuxt/actions-yarn"
LABEL homepage="https://github.com/nuxt/actions-yarn"
LABEL maintainer="Xin Du (Clark) <clark.duxin@gmail.com>"

LABEL com.github.actions.name="GitHub Action for Yarn"
LABEL com.github.actions.description="Wraps the yarn CLI to enable common yarn commands."
LABEL com.github.actions.icon="package"
LABEL com.github.actions.color="red"
COPY LICENSE README.md /

# Taken from https://github.com/cypress-io/cypress-docker-images/blob/15c5bf875454a289e20587b192c4e4322787956c/base/10/Dockerfile#L3
# BEGIN
RUN apt-get --no-install-recommends update && \
  apt-get install -y --no-install-recommends \
    libgtk2.0-0 \
    libnotify-dev \
    libgconf-2-4 \
    libnss3 \
    libxss1 \
    libasound2 \
    xvfb \
    jq \
 && rm -rf /var/lib/apt/lists/*

# versions of local tools
RUN node -v
# NPM version should already be pretty new (> 6.4.0)
RUN npm -v
# END


COPY "entrypoint.sh" "/entrypoint.sh"
ENTRYPOINT ["/entrypoint.sh"]
CMD ["help"]
