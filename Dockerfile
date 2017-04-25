FROM centos:6.9
COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
RUN yum -y groupinstall "Development Tools" &&\
 yum -y install cmake glibc-devel.i686 libgcc.i686 &&\
 yum clean all
RUN mkdir /osal && cd $_ &&\
 curl -L "https://downloads.sourceforge.net/project/osal/osal-4.2.1a-release.tar.gz?r=https://sourceforge.net/projects/osal/&ts=1493090945&use_mirror=iweb" | tar xz --strip-components=1
WORKDIR /root/build
RUN sed -i "s/# OSAL_M32 = -m32/OSAL_M32 = -m32/g" /osal/build/osal-config.mak &&\
 cmake -DOSAL_SYSTEM_OSTYPE=posix -DOSAL_SYSTEM_BSPTYPE=pc-linux -DENABLE_UNIT_TESTS=TRUE -DOSAL_INCLUDEDIR=/osal/src/bsp/pc-linux/config /osal &&\
 make &&\
 cd /osal &&\
 source ./setvars.sh &&\
 cd build &&\
 make config && make -C examples
