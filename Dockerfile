# ------------------------------------------------------------------------------
# https://www.kali.org/docs/containers/official-kalilinux-docker-images/
# https://hub.docker.com/r/kalilinux/kali-last-release
# https://hub.docker.com/r/kalilinux/kali-rolling
# ------------------------------------------------------------------------------
# Pull base image
FROM kalilinux/kali-rolling
MAINTAINER Brett Kuskie <fullaxx@gmail.com>

# ------------------------------------------------------------------------------
# Set environment variables
ENV LANG C
ENV DEBIAN_FRONTEND noninteractive

# ------------------------------------------------------------------------------
# Create a docker image suitable for development
# WHY ARE ALL THE APT KEYS NOT READABLE??
# WHY DO I HAVE TO ALLOW INSECURE REPOSITORIES??
RUN apt-get update -oAcquire::AllowInsecureRepositories=true && \
    apt-get install -y --allow-unauthenticated \
      bash-completion \
      beav \
      build-essential \
      cgdb \
      cmake \
      dhex \
      file \
      hexedit \
      hexer \
      ht \
      le \
      less \
      libcurl4-gnutls-dev \
      libevent-dev \
      libgcrypt-dev \
      libgnutls28-dev \
      libhiredis-dev \
      libmicrohttpd-dev \
      libpcap-dev \
      libsqlite3-dev \
      libssl-dev \
      libxml2-dev \
      libzmq3-dev \
      lsof \
      meson \
      nano \
      ncurses-hexedit \
      p7zip-rar \
      radare2 \
      shed \
      sshfs \
      tree \
      tweak \
      unzip \
      vim-tiny \
      xxd \
      xxhash \
      zip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /var/tmp/* /tmp/*

# ------------------------------------------------------------------------------
# Define default command
CMD ["/bin/bash"]
