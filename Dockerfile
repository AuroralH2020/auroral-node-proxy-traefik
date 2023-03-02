ARG ARCH
ARG BASE_IMAGE=traefik:latest 

# BUILD PHASE
FROM $BASE_IMAGE 
# copy traefik conf files
COPY traefik.yml /etc/traefik/traefik.yml
COPY proxy-config.yml /etc/traefik/proxy-config.yml
# LABEL
LABEL maintaner="jorge.almela@bavenir.eu"
LABEL org.opencontainers.image.source=https://github.com/AuroralH2020/auroral-node-proxy-traefik

# START
EXPOSE 8080
STOPSIGNAL SIGQUIT
USER $UID
ENTRYPOINT ["/entrypoint.sh"]
CMD ["traefik"]