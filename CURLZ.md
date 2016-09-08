#### 1. A few commands to better test the backend
* POST a topic to the backend `curl --verbose -X POST -H "Content-Type:multipart/form-data" -F "title=This is a test topic" -F "article_link=http://testtopic-1.com" -F "created_by=1" -F 'tags=["tag1","tag2"]' -F "description=this is the first topic" -F "image_url=http://a.espncdn.com/photo/2015/1207/deandre_mem_169.jpg" -H "Authorization: JWT <JWT token>" http://respondreact.com:8100/api/topics/submit`

* POST credentials to get JWT string `curl -X POST -d "username=admin&password=test" http://respondreact.com:8100/api/token-auth/ | sed -e 's/^.*"token":"\([^"]*\)".*$/\1/'`

* submit a rating to the backend `curl -H 'Authorization: JWT <JWT token>' http://respondreact.com:8100/api/topics/20/rate/-1`

* POST an action to the backend ` curl --verbose -X POST  -H "Content-Type:multipart/form-data" -F "title=Test Action" -F "article_link=http://testaction.com" -F "created_by=1" -F 'tags=["actiontag1","actiontag2"]' -F "image_url=https://i.kinja-img.com/gawker-media/image/upload/s--tZO1iuQo--/c_fill,fl_progressive,g_north,h_358,q_80,w_636/ucwf76makrj3mdbbugro.jpg" -F "description=This is a test action" -H "Authorization: JWT <jwt token>"  http://respondreact.com:8100/api/topics/1/actions/submit`

* POST a new user to the backend `curl -X POST -d 'username=test&password=test&email=test@test.com' respondreact.com:8100/api/user/register/`

* PUT an existing topic `curl -H "Authorization: JWT eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE0NzI3NTA5NTUsInVzZXJuYW1lIjoiYWRtaW4iLCJ1c2VyX2lkIjoxLCJlbWFpbCI6ImFkbWluQHRlc3QuY29tIn0.vJ87jmFsblcjnm7gQLpdNKuWxG3MDeTfa1DlOakKsdI" -H "Content-Type: application/json" -X PUT -d '{ "article_link": "http://www.cnn.com/2016/07/13/us/police-shootings-investigations/?booya=grandma", "image_url": "http://i2.cdn.turner.com/cnnnext/dam/assets/160708180432-philando-castile-shooting-facebook-live-large-tease.jpg", "scope": "national", "title": "Philando Castile shooting: What happened when filming stopped?", "rating_dislikes": 0, "created_on": "2016-07-14T00:03:29.730678Z" }' http://respondreact.com:8100/api/topics/2/update`