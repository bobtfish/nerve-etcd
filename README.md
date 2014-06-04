# Nerve Docker ambassador container - etcd edition

This container is a simple (1 service) registration container,
which is designed to health check 1 or more linked containers
and register them for synapse.

Example of how you would use this container, first you start the application:

    docker run -d you/testservice --expose 8080 --name testservice1

and then

    docker run -d -e NERVE_SERVICE=testservice --link etcd:etcd --link testservice1:testservice1 --name testservice-registration bobtfish/nerve-etcd

