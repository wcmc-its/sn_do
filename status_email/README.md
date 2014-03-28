# status_email
This uses sn_do to gather data from an ServiceNow instance, generate some statistics, create a list of tickets to be actioned on, and send an email.

## whats here

* `status_email.rb` - This calls `sn_do` and does all the heavy lifting to gather the data and build the email
* `send_alert_mail.rb` - This uses `net/smtp` to send an email crafted by `status_email.rb` 
* sn_do_config.expl.yml - This is the YAML config file for `status_email`which defines which SN instance to contact and who should be recieving the email

## install

Requires Ruby 2.0.0

### gems used
``` ruby
require 'sn_do'
require 'net/smtp'
```

## usage

### brief example 
for using status_email and connecting to ServiceNow and generating a report you will need to define the contents of `sn_do_config.yml`
``` yaml
instance_name: demo017
username: admin
password: admin
assign_group_id: d625dccec0a8016700a222a0f7900d06
assign_group_name: Software

#Notification configuration
#Please set the values for the notification functionality
smtpserver: smtp.med.cornell.edu #this is an smtp server in your enviroment where emails can be sent
recipients: recipients@med.cornell.edu  #the indended recipients seperated by a comma
fromaddress: sn_do@med.cornell.edu #This is the from address you would like your message to come from

```
`sn_do_config.expl.yml` is the same as above, you should use this as a template for your own `sn_do_config.yml`

## todo list
* add filter out functionality for a bussiness_service (waiting on [sn_do issue](https://github.com/thomasmmc/sn_do/issues/1) to move forward)