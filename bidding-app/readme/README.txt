Welcome to Car Pooling
Introduction to Car Pooling: 
This app requires two people to be logged in. One as a owner and one as a poolin person.
Once logged in as a owner select the source and destination. The app calculates the shortest path and displays it.
In addition it also connects to the WebRTC server and enables messaging.
when logged in as a poolin person and select the source and destination and clicked submit then the app looks for all the owners traversing the same path and diplays the buttons of all the owners.
Now pooled in person can select any owner and chat with him for his convenient place to poolin.

Once this app is hosted on the server, to run the prototype we can assume the owner to be logged in one browser(Chrome) and poolin person to logged in another browser(IE 11 or Mozilla). If same browser is used it leads to ambiguity because of the spring security happening during login session. 

Below are the credentials for owner :
CarOwner1/123456
CarOwner2/123456

Below are the credentials for pool in person : 
PoolIn1/123456
PoolIn2/123456

Software required:
Tomcat8
Node js
Mysql
IE 11,Mozilla, Chrome

Steps:
1. DB_dump.zip - Import the schema scripts in Mysql. Make sure the DB car_pooling schema is present
2. carpooling.war  - drop it into {tomcat folder}/webapps
3. unzip easyrtc folder 
4. Open Node js cmd prompt - traverse to the {easyrtc folder}/serverexample
5. Provide the cmd : node server.js, it should be succesful
6. Start tomcat server
7. Now open chrome and type URL : http://localhost:8080/carpooling
8. Now provide owner credentials as : CarOwner1/123456
9. Click on car owner image.
10. Shortest path was calculated for the route
11. Now open IE and login as Poolin User credentials are : PoolIn1\123456
12. Click on poolin image
13. Select source and dest and click Submit
14. You must see the already available car owners on that route
15. Now you can start chatting with the owner 
16. As you see the owner and poolin person can chat and decide the place to join.
17. This is our Car Pooling App

Thank YOU 
