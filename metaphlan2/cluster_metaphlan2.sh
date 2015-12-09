#!/usr/bin/bash

memusage=10; #in gigabyte
#$ -S /usr/bin/bash
#$ -N metaphlan2
#$ -e /vol/projects/sjanssen/dockerruns/ERR/
#$ -o /vol/projects/sjanssen/dockerruns/OUT/
#$ -pe multislot 4
#$ -l mem_free=10g
#$ -cwd

cd /vol/projects/sjanssen/docker_profiling_tools
docker build -f metaphlan2/Dockerfile_metaphlan2  -t metaphlan2 .
docker run --memory=${memusage}g --memory-swap=-1 \
-v "/vol/projects/sjanssen/CAMI/:/exchange/input" \
-v "/vol/projects/sjanssen/dockerruns/metaphlan2:/exchange/output:rw" \
-t metaphlan2
