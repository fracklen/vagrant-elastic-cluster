vagrant-elasticsearch-cluster
=============================

Heavily inspired by [https://github.com/ypereirareis/vagrant-elasticsearch-cluster](https://github.com/ypereirareis/vagrant-elasticsearch-cluster) - With great thanks! I needed a 2.x version.

Create an ElasticSearch cluster with a single bash command :

```
vagrant up
```

**Programs, plugins, libs and versions information**

| Program, plugin, lib              | Version     | How to use it                             |
| --------------------------------- | ----------- | ----------------------------------------- |
| ElasticSearch                     | 2.2.0       | [http://www.elasticsearch.org/guide/](http://www.elasticsearch.org/guide/) |
| Java (openjdk-7-jre)              | 1.7.0_25    |                                           |
| ElasticHQ                         | 2.0.3       | [https://github.com/royrusso/elasticsearch-HQ](https://github.com/royrusso/elasticsearch-HQ) |

ElasticHQ plugin is installed on all nodes. Once provisioned, go to [http://192.168.99.11:9200/_plugin/hq/](http://192.168.99.11:9200/_plugin/hq/)

**Cluster default configuration**

| Configuration              |  Value(s)                                            |
| -------------------------- | ---------------------------------------------------- |
| Cluster name               | vagrant-es-cluster                           |
| Nodes names                | es-vm-1, es-vm-2, es-vm-3, es-vm-4, es-vm-5 |
| VM names                   | es-vm-1, es-vm-2, es-vm-3, es-vm-4, es-vm-5|
| Default cluster network IP | 192.168.99.{11-15} |


1.Installation and requirements
--

**Must have on your local machine**

* VirtualBox (last version)
* Vagrant (>=1.5)
* cUrl (or another REST client to talk to ES)

**Clone this repository**

git clone git@github.com:fracklen/vagrant-elasticsearch-cluster.git

**WARNING**

You'll need enough RAM to run VMs in your cluster.
Each new VM launched within your cluster will have 1GB of RAM allocated.
You can change this configuration in the Vagrantfile once cloned.

2.How to run a new ElasticSearch cluster
--

**Important**

The maximum number VMs running in the cluster is 5.
Indeed, it is possible to run much more than 5, but it's not really needed for a test environment cluster,
and the RAM needed would be much more important.
If you still want to use more than 5 VMs,
you will have to add/edit your own configuration files in the [conf](conf) directory.

**Run the cluster**

Simply go in the cloned directory (vagrant-elasticsearch-cluster by default).
Execute this command :

```
vagrant up
```

By default, this command will boot 5 VMs, with `vagrant-es-cluster` name, `1GB` of RAM for each node and this network ip address `192.168.99.{11-15}`.

3.Vagrant
--

You can use every vagrant command to manage your cluster and VMs.
This project is simply made to launch a working ES cluster with a single command, using vagrant/virtualbox virtual machines.

Use it to test every configuration/queries you want (split brain, unicast, recovery, indexing, sharding)

4.Important
--

Do forks, PR, and MRs !!!!

5. License: MIT
--

Copyright (c) 2016 Martin Søgaard Neiiendam


Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
