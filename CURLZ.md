#### 1. A few commands to better test the backend
* POST a topic to the backend `curl --verbose -X POST -H "Content-Type:multipart/form-data" -F "title=This is a test topic" -F "article_link=http://testtopic-1.com" -F "created_by=1" -F 'tags=["tag1","tag2"]' -F "image=@/Users/Kevin/Pictures/z8.jpg;type=image/jpg" -F "description=this is the first topic" -H "Authorization: JWT <jwt token>" http://127.0.0.1:8100/api/topics/submit`

* POST credentials to get JWT string `curl -X POST -d "username=admin&password=test" http://localhost:8000/api/token-auth/ | sed -e 's/^.*"token":"\([^"]*\)".*$/\1/'`

* submit a rating to the backend `curl -H 'Authorization: JWT <JWT token>' http://localhost:8000/api/topics/20/rate/-1`

* POST an action to the backend ` curl --verbose -X POST  -H "Content-Type:multipart/form-data" -F "title=Test Action" -F "article_link=http://testaction.com" -F "created_by=1" -F 'tags=["actiontag1","actiontag2"]' -F "image=@/Users/Kevin/Pictures/pho.jpg;type=image/jpg" -F "description=This is a test action" -H "Authorization: JWT <jwt token>"  http://127.0.0.1:8100/api/topics/1/actions/submit`