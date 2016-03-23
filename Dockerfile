FROM microsoft/aspnet:1.0.0-rc1-update1-coreclr

VOLUME ["/home/development/Spikes/DockerSample/", "/src/docker-sample"]

WORKDIR /src/docker-sample/Docker.Sample/

RUN dnu restore

#CMD ["dnx", "web"]

EXPOSE 5000	