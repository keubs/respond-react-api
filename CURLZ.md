#### 1. A few commands to better test the backend
* POST a topic to the backend `curl --verbose -X POST  -H "Content-Type:multipart/form-data" -F "title=superego12" -F "article_link=http://disclosures.com" -F "created_by=1" -F 'tags=["booya","grandma"]' -F "image=@/Users/Kevin/Pictures/z8.jpg;type=image/jpg" -F "description=hey kevo" -H "Authorization: JWT <jwt token>"  http://127.0.0.1:8000/api/topics/submit`

* POST credentials to get JWT string `curl -X POST -d "username=admin&password=test" http://localhost:8000/api-token-auth/ | sed -e 's/^.*"token":"\([^"]*\)".*$/\1/'`

* submit a rating to the backend `curl -H 'Authorization: JWT <JWT token>' http://localhost:8000/api/topics/20/rate/-1`

* POST an action to the backend `curl -X POST -d '{"title":"action55","article_link":"http://disclosures.co","description":"close your eyes and count"}'  -H "Content-Type: application/json" -H "Authorization: JWT <jwt token>" http://127.0.0.1:8000/api/topics/1/actions/submit`