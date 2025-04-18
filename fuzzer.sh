#!/bin/bash

export AFL_FINAL_SYNC=1

export COMMON_OPTS="-t 5000 -i input -o output -- /opt/texlive/bin/x86_64-pc-linux-gnu/pdflatex @@"

afl-fuzz -M main-aflplusplus-texlive ${COMMON_OPTS} &
afl-fuzz -S variant01 ${COMMON_OPTS} &
afl-fuzz -S variant02 ${COMMON_OPTS} &
afl-fuzz -S variant03 ${COMMON_OPTS} &
afl-fuzz -S variant04 ${COMMON_OPTS} &
afl-fuzz -S variant05 ${COMMON_OPTS} &
afl-fuzz -S variant06 ${COMMON_OPTS} &
afl-fuzz -S variant07 ${COMMON_OPTS} &
afl-fuzz -S variant08 ${COMMON_OPTS} &
afl-fuzz -S variant09 ${COMMON_OPTS} &
afl-fuzz -S variant10 ${COMMON_OPTS} &
afl-fuzz -S variant11 ${COMMON_OPTS} &
afl-fuzz -S variant12 ${COMMON_OPTS} &
afl-fuzz -S variant13 ${COMMON_OPTS} &
afl-fuzz -S variant14 ${COMMON_OPTS} &
afl-fuzz -S variant15 ${COMMON_OPTS}

bash