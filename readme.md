## EDM (Exercism-Docker Machine)

The goal of this project is to make it easy to setup a docker machine to run [exercism](https://exercism.org/) projects without installing everything on your local machine.

It might be a nice idea if you:

* do not want (or cannot) install a setup for running a specific language
* like to separate projects
* want to make things more challenging than they need to be
* really like docker

The way it works is, the docker setup will download and install the [exercism cli](https://exercism.org/docs/using/solving-exercises/working-locally). Additionally it will bind a local folder called `volume`. You can, then, install whatever language runtime to be able to run your projects while still working from a local folder.

## Setup

Install [docker](https://www.docker.com/get-started).

On host create the image and container
```
docker build . --tag exercism-img
docker container run -it --name exercism --volume $PWD/volume:/root exercism-img /bin/bash
```

And configure [your token](https://exercism.org/settings/api_cli) (this only needs to be done once)
```
exercism configure --token=<TOKEN>
```

Then use the machine as you wish. Feel free to install and tweak things as you want.

When you need to start the container again you can simply run.
```
docker container start exercism
docker exec -it exercism /bin/bash
```

----

### Scala

To be able to run scala we need to install JDK and SBT
```
apt install openjdk-11-jre -y
```

And then install [sbt](https://www.scala-sbt.org/download.html)
```
echo "deb https://repo.scala-sbt.org/scalasbt/debian all main" | tee /etc/apt/sources.list.d/sbt.list
echo "deb https://repo.scala-sbt.org/scalasbt/debian /" | tee /etc/apt/sources.list.d/sbt_old.list
apt install gnupg -y
curl -sL "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x2EE0EA64E40A89B84B2DF73499E82A75642AC823" | apt-key add
apt update
apt install sbt -y
```

### Kotlin

To be able to run kotlin we need to install JDK and gradle
```
apt install openjdk-11-jre -y
```

And then install [gradle](https://gradle.org/install)
```
apt install unzip zip -y
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk install gradle 7.3.3
```

For the exercises it's necessary to allow `gradlew` to execute
```
chmod +x gradlew
```

and then testing should work
```
./gradlew test
```