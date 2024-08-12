<p align="left">
 <img width="600px" src="NagiosLogo.png" alt="qr"/>
</p>

- [Source tutorial](https://medium.com/@patilhimanshu139/monitoring-aws-ec2-instance-with-nagios-on-ubuntu-57c89b09016b "Medium")

## Steps:

* Install nagios from [install script](nagiosinstall.sh)

### default page of nagios
<p align="left">
 <img width="800px" src="nagios_def.png" alt="qr"/>
</p>


* Install Nrpe server on client machine 

```sh
    apt install nagios-nrpe-server nagios-plugins 
```


<p align="left">
 <img width="800px" src="nagios.png" alt="qr"/>
</p>

### Hosts

<p align="left">
 <img width="800px" src="nagios_hosts.png" alt="qr"/>
</p>

### Metrics

<p align="left">
 <img width="800px" src="nagios_metrics.png" alt="qr"/>
</p>