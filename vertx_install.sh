git clone https://github.com/vert-x/vert.x.git ./vertx
git clone https://github.com/vert-x/mod-lang-groovy.git ./vertx-mod-groovy

cd vertx/
cd vertx-core
gradle install
cd ../vertx-platform
gradle install

cd ../../
cd mod-lang-groovy
gradle install
