Docker container for InfluxDB development
================

This project provides a dockerized environment for InfluxDB development. It uses Vagrant to make easier its management.

Requirements
------------

* Docker
* Vagrant

Setup
-----
* Clone this project.
```
git clone https://github.com/areina/influxdb-dev-box.git
```
* Clone your InfluxDB fork (This example is using official InfluxDB repo).
```
FORK_PATH=gocodez/src/github.com/influxdb
git clone https://github.com/influxdb/influxdb.git $FORK_PATH/influxdb
```

There is a predefined path ($FORK_PATH), if you use it everything will be easier because
there is a symlink available in gocodez/influxdb pointing to that path.

* Build the dev box
```
vagrant up --provider=docker
```

Workflow
--------
You can access to the box with:

```
vagrant ssh
```

Recommended workflow is develop and edit code in your host machine and test within the container.
For example, inside the container, if you follow previous conventions, you can access to InfluxDB code and execute tests doing this:

```
host $ vagrant ssh
container $ cd gocodez/influxdb
container $ ./configure
container $ ./make test
```
