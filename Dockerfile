FROM nvcr.io/nvidia/pytorch:20.12-py3
MAINTAINER yzl

RUN apt-get update
RUN apt-get install -y openssh-server curl screen
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - && apt install -y nodejs

RUN python -m pip install -i https://pypi.tuna.tsinghua.edu.cn/simple jupyterlab ipympl nodejs ptvsd
RUN jupyter labextension install @jupyterlab/debugger
RUN conda install xeus-python -c conda-forge

RUN sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/^#PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config

COPY run.sh /run.sh
RUN chmod 777 /run.sh

ENV NOTEBOOK_APP_TOKEN=Yuan19950730! NOTEBOOK_DIR=/data
RUN echo "root:Yuan19950730!" | chpasswd

# ssh
EXPOSE 22
# jupyter
EXPOSE 8888
# tensorboard
EXPOSE 6006
