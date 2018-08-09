FROM ubuntu:16.04

RUN \
 apt-get update && \
 DEBIAN_FRONTEND=noninteractive apt-get install --yes tzdata && \
 apt-get install --yes build-essential cmake && \
 apt-get install --yes git python && \
 apt-get install --yes lsb-release && \
 apt-get install --yes software-properties-common && \
 apt-get install --yes wget
# apt-get install --yes git python llvm clang libc++-dev && \
#RUN cd smack && git checkout --track remotes/origin/bouman
RUN apt-get install --yes mono-complete
RUN git clone https://github.com/niekbouman/smack.git && cd smack && git checkout 4329a142130ae432762e
RUN \
 cd smack && \
 cd bin && \
 cat build.sh | sed -e 's/sudo//g' > mybuild.sh && \
 chmod +x mybuild.sh && \
 ./mybuild.sh

RUN apt-get install --yes ruby ruby-bundler 
RUN gem install bam-bam-boogieman
RUN git clone https://github.com/niekbouman/verifying-constant-time.git && cd verifying-constant-time && git checkout c91e5b1e8338b883b746
#--track remotes/origin/cplusplus
