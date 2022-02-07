FROM "ubuntu:21.10"

RUN apt-get update && apt-get install curl -y &&\
    mkdir mysetup && cd mysetup &&\
    curl -L https://github.com/exercism/cli/releases/download/v3.0.13/exercism-3.0.13-linux-x86_64.tar.gz -o exercism.tar.gz &&\
    tar -xf exercism.tar.gz &&\
    cp exercism /bin
