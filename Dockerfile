FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /opt/scm-backup
RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update -y && \
    apt-get dist-upgrade -y && \
    apt-get -y install sudo wget git-core zip && \
    apt-get autoremove -y
RUN wget https://github.com/christianspecht/scm-backup/releases/download/1.10.1/scm-backup-1.10.1.47f1444.zip -O /tmp/scm-backup.zip
RUN mkdir -p /opt/scm-backup && cd /opt/scm-backup && unzip /tmp/scm-backup.zip && rm /tmp/scm-backup.zip
ENTRYPOINT dotnet /opt/scm-backup/ScmBackup.dll
