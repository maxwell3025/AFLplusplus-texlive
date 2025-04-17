FROM aflplusplus/aflplusplus:v4.30c

RUN apt update

RUN apt install -y subversion libfontconfig1-dev libfontconfig1

COPY ./subversion_config /etc/subversion/config

RUN svn co svn://tug.org/texlive/tags/texlive-2025.2/Build/source/ /src

WORKDIR /src

RUN mkdir -p /opt/texlive

WORKDIR /temp
RUN wget https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
RUN tar -xvf *.gz
RUN $(find . | grep install-tl$) --no-interaction --texdir=/opt/texlive

WORKDIR /src
ENV TL_BUILD_ENV="CC='/usr/local/bin/afl-gcc-fast' CXX='/usr/local/bin/afl-g++-fast'"
ENV TL_MAKE_FLAGS=-j`nproc`
RUN ./Build --without-x --prefix=/opt/texlive || true

ENV PATH="${PATH}:/opt/texlive/bin/x86_64-pc-linux-gnu"


WORKDIR /src/Work
RUN make install

WORKDIR /root
COPY example.tex .
