#### 1. A few commands to better test the backend
* `curl -X POST -d '{"title":"superego12","article_link":"http://disclosures.com","created_by":"1"}'  -H "Content-Type: application/json" -H "Authorization: JWT eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE0NDMyMjMxMjksInVzZXJuYW1lIjoiYWRtaW4iLCJlbWFpbCI6ImFkbWluQHRlc3QuY29tIiwidXNlcl9pZCI6MX0.yGiMO9wNLQxH2uzxj-VRMurjE4cFUNHuPPsQ-LQezqg" http://127.0.0.1:8000/api/topics/submit`

* `curl -X POST -d "username=admin&password=test" http://localhost:8000/api-token-auth/ | sed -e 's/^.*"token":"\([^"]*\)".*$/\1/'`