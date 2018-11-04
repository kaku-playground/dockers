#
# Author Guo Yu
#
FROM debian:stretch

ADD sources.list /etc/apt/

RUN apt-get update && apt-get install -y tzdata gnupg2

# 设置时区
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo "Asia/Shanghai" > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata

# 设置下载源
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ stretch-pgdg main" > /etc/apt/sources.list.d/pgdg.list
ADD ACCC4CF8.asc /opt/
RUN cat /opt/ACCC4CF8.asc | apt-key add -
RUN rm -rf /opt/ACCC4CF8.asc
RUN apt-get update && apt-get install -y postgresql-11

