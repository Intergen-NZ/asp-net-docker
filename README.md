# asp-net-docker
An example project which demonstrates hosting asp.net in a <a href="https://www.docker.com/" target="_blank">Docker</a> container.


### Get Docker for windows
1. <a href="https://docs.docker.com/windows/">Download Docker toolbox</a>.
2. Once downloaded you can get up and running with docker straight away by typing ```Docker Quickstart Terminal``` in the startmenu. e.g. to run a redis instance just type:
```
$ docker run -it redis /bin/bash
root@ae853a6dc052:/data# redis-server &
[ENTER]
root@ae853a6dc052:/data# redis-cli
127.0.0.1:6379> sadd nz kyle
(integer) 1
127.0.0.1:6379> sadd nz jono
(integer) 1
127.0.0.1:6379> sadd nz richard
(integer) 1
127.0.0.1:6379> sadd uk richard
(integer) 1
127.0.0.1:6379> sinter nz uk
1) "richard"
```

### Run the asp.net example
1. By default Virtualbox only shares certain folders on your machine so you'll need to add a shared folder for your dev files. I found <a href="http://blog.pavelsklenar.com/5-useful-docker-tip-and-tricks-on-windows/">this page</a> useful for setting this up. (NOTE: Use the Virtual Box terminal instead of  the Docker Quickstart Terminal else the mounting won't work)
2. Download the source somewhere in this mounted folder.
```
git checkout git@github.com:Intergen-NZ/asp-net-docker.git
```
3. Run the Microsoft Docker image:
```
$ docker run -it -p 5000:5000 -P -v [your mounted directory]:/src/docker-sample microsoft/aspnet:1.0.0-rc1-update1-coreclr
$ cd /src/docker-sample/Docker.Sample
// restore nuget packages
$ dnu restore
// build and run Kestrel server
$ dnx web &
```
4. Open Chrome on windows and type in the address:
``` http://192.168.99.100:5000/api/values ```



