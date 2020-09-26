#
# Author Guo Yu
#

FROM python:3.8-buster

# 设置 163 镜像
RUN sed -i 's#http://deb.debian.org#https://mirrors.163.com#g' /etc/apt/sources.list
RUN apt-get install -y apt-transport-https
RUN apt-get update

# 安装 JDK
RUN apt-get install -y openjdk-11-jdk-headless

# 安装 pyspark
RUN mkdir -p /root/.pip
ADD pip.conf /root/.pip
RUN pip install pyspark==3.0.1 -i https://pypi.tuna.tsinghua.edu.cn/simple

# 安装 Spark
RUN wget https://mirror.bit.edu.cn/apache/spark/spark-3.0.1/spark-3.0.1-bin-hadoop3.2.tgz
RUN tar -xzf /spark-3.0.1-bin-hadoop3.2.tgz
RUN rm -rf /spark-3.0.1-bin-hadoop3.2.tgz
RUN export SPARK_HOME=/spark-3.0.1-bin-hadoop3.2
RUN export PATH=$PATH:$SPARK_HOME/bin


# Set timezone
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo "Asia/Shanghai" > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata
RUN apt-get clean

#CMD ["/bin/bash", "-c", "cd $SPARK_HOME"]
