FROM fedora:27

# upgrade the base system
RUN dnf -y upgrade

# install dependencies
RUN dnf install -y vim openssl subversion binutils bzip2 gcc gcc-c++ gawk gettext git flex ncurses-devel ncurses-compat-libs zlib-devel zlib-static make patch unzip perl-ExtUtils-MakeMaker perl-Thread-Queue \
 glibc glibc-devel glibc-static quilt sed sdcc intltool sharutils bison wget openssl-devel python2 
RUN dnf clean all

RUN useradd -ms /bin/bash lede
USER lede
# change here for other version of lede
ENV VERSION v17.01.4

RUN git clone git://git.lede-project.org/source.git /home/lede/build

WORKDIR /home/lede/build/

# comment for bleeding edge build
RUN git checkout ${VERSION}

RUN ./scripts/feeds update -a
RUN ./scripts/feeds install -a

CMD cp /srv/.config . && make -j
