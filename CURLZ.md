#### 1. A few commands to better test the backend
* POST a topic to the backend `curl --verbose -X POST -H "Content-Type:multipart/form-data" -F "title=This is a test topic" -F "article_link=http://testtopic-1.com" -F "created_by=1" -F 'tags=["tag1","tag2"]' -F "description=this is the first topic" -F "image_url=http://a.espncdn.com/photo/2015/1207/deandre_mem_169.jpg" -H "Authorization: JWT <JWT token>" http://squ.ad:8100/api/topics/submit`

* POST credentials to get JWT string `curl -X POST -d "username=admin&password=test" http://squ.ad:8100/api/token-auth/ | sed -e 's/^.*"token":"\([^"]*\)".*$/\1/'`

* submit a rating to the backend `curl -H 'Authorization: JWT <JWT token>' http://squ.ad:8100/api/topics/20/rate/-1`

* POST an action to the backend ` curl --verbose -X POST  -H "Content-Type:multipart/form-data" -F "title=Test Action" -F "article_link=http://testaction.com" -F "created_by=1" -F 'tags=["actiontag1","actiontag2"]' -F "image_url=https://i.kinja-img.com/gawker-media/image/upload/s--tZO1iuQo--/c_fill,fl_progressive,g_north,h_358,q_80,w_636/ucwf76makrj3mdbbugro.jpg" -F "description=This is a test action" -H "Authorization: JWT <jwt token>"  http://squ.ad:8100/api/topics/1/actions/submit`

* POST a new user to the backend `curl -X POST -d 'username=test&password=test&email=test@test.com' squ.ad:8100/api/user/register/`