# zabbix - Check cryptography containers. 

There are 2 scripts in the directory "/etc/zabbix/scripts/".
One script detects the presence of cryptocontainers on the node. (Needed for auto-discovery)
The second returns the date and number of days until the expiration of the container.

------------
Returns Json with the names of the containers.( { "{#CRYPTOCON}":"ALLQUEUES" } - Stub )
```bash
zabbix:~$ zabbix_get -s 192.168.211.11 -p 10050 -k 'crypto.discovery'
{ "data":[ { "{#CRYPTOCON}":"first_cont_name" }, { "{#CRYPTOCON}":"second_cont_name" }, { "{#CRYPTOCON}":"ALLQUEUES" } ]}
```

------------
Returns the expiration date in unix format.
```bash
zabbix:~$ zabbix_get -s 192.168.111.11 -p 10050 -k 'crypto.date[first_cont_name]'
1585083600
```
------------
Returns the number of days to expiration.
```bash
zabbix:~$ zabbix_get -s 192.168.211.11 -p 10050 -k 'crypto.date[first_cont_name,exp]'
75
```
### crypto.conf

The crypto.conf file contains commands for invoking scripts with a zabbix agent.

### zbx_export_templates.xml

zbx_export_templates.xml - template for zabbix

