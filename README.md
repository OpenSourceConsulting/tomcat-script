tomcat-script
=============
This is tomcat template file project for Open Source Consulting, Inc.
This project allows you to handle your tomcat configuration in script file, not server.xml and give detail options such as GC, Heap, etc

You can use this for Tomcat 6/7 and JBoss EWS.

server.xml in this project is changed for input parameter like ${http.port}, ${ssl.port}, ${shutdown.port} and ${ajp.port}. These parameters assigned from env.sh variables.

If you want to give more options to server.xml, you would define -D option and configure ${} in server.xml 