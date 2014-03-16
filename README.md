Various Dockerfiles
===================

These dockerfiles tipically created to serve syslog-ng OSE destinations.

How to use precise-rabbitmq-server
----------------------------------
Assumes that the micek/precise_base image is exist (the Dockerfile is build from this image)
$CID = Rabbitmq's container ID.

1. Step: Build docker container, eg.: `sudo docker.io build -t rabbitmq-server precise-rabbitmq-server/`
2. Step: Run docker container, eg.: `sudo docker.io run -i -t -p 127.0.0.1:5672:5672 rabbitmq-server /bin/bash`
3. Step: Get the started container's ID: `sudo docker.io ps | grep rabbitmq-server| cut -d" " -f1`
4. Step: Get the started container's ipaddress: `sudo docker.io inspect $CID | grep IPAddress`

After that syslog-ng can connect to rabbitmq-server with the following configuration:

destination d_amqp {
    amqp(
        vhost("/")
        host("ip-address from step 4")
        port(5672)
        exchange("syslog")
        exchange_type("header")
        routing_key("")
        body("")
        persistent(yes)
        username("guest")
        password("guest")
        value-pairs(
            scope("selected-macros" "nv-pairs" "sdata")
        )
    );
};
