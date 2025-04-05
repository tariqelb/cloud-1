
## Introducation 

This topic is inspired by the subject Inception. The goal is to deploy your site and the
necessary docker infrastructure on an instance provided by a cloud provider.
In this version, each process will have its container. You CANNOT deploy the same
images from Inception and be done with it ;) You can of course get the source of the
website (Your WordPress blog for instance), but you have to deploy it using a container
per process and automation.
Automation is essential here. The stages of deployment must be automated by a tool
of your choice (We suggest Ansible).
This complete web server must be able to run several services in parallels such as
Wordpress, PHPmyadmin and a database

## Mandatory part

The deployment of your application must be fully automated. We suggest you use Ansible
but you are free to use another tool if you wish. It is imperative to provide a functional
site equivalent to the one obtained with Inception just using your script.
You need to install a simple WordPress site on an instance. You must ensure that:

• Your site can restart automatically if the server is rebooted.

• In case of reboot all the data of the site are persisted (images, user accounts, articles,
...).

• It is possible to deploy your site on several servers in parallel.

• The script must be able to function in an automated way with for only assumption
an ubuntu 20.04 LTS like OS of the target instance running an SSH daemon and
with Python installed.

• Your applications will run in separate containers that can communicate with each
other (1 process = 1 container)

• Public access to your server must be limited and secure (for example, it is not
possible to connect directly to your database from the internet).

• The services will be the different components of a WordPress to install by yourself.
For example Phpmyadmin, MySQL, ...

• You must have a docker-compose.yml.

• You will need to ensure that your SQL database works with WordPress and PHP-
MyAdmin.

• Your server should be able, when possible, to use TLS.

• You will need to make sure that, depending on the URL requested, your server
redirects to the correct site.
