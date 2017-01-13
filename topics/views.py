from django.shortcuts import render
from django.http import HttpResponse
from pprint import pprint
from django.conf import settings
from .models import *
# Create your views here.

def home(request):
	return HttpResponse(
		"""
		<!DOCTYPE html>
		<html>
		<head>
		      <meta http-equiv="content-type" content="text/html; charset=utf-8">
		      <title>respond/react | Don't just react, respond.</title>
		      <meta property="og:title" content="respond/react | Don't just react, respond.">
		      <meta property="og:description" content="respond/react is removing the excuse you can't help the people you read about in the news">
		      <meta property="og:image" content="{media_url}media/rr_1024.jpg">
		      <meta property="og:image:width" content="1200">
		      <meta property="og:image:height" content="1200">
		      <meta property="og:site_name" content="Respond/React">
		      <meta property="og:url" content="http://respondreact.com">
		      <meta property="fb:app_id" name="fb_app_id" content="1513191525645232">
		      <meta content="website" property="og:type">

		      <meta name="twitter:card" content="summary" />
		      <meta name="twitter:site" content="@keubs" />
		      <meta name="twitter:title" content="respond/react | Don't just react, respond." />
		      <meta name="twitter:image" content="{media_url}media/rr_1024.jpg" />
		      <meta name="twitter:url" content="http://respondreact.com/" />
		  </head>
		  <body>
		  	<h1>respond/react | Don't just react, respond.</h1>
		  	<img src="{media_url}media/rr_1024.jpg" />
		  </body>
		</html>
		""".format(media_url=settings.MEDIA_URL))


def topic_details(request, pk):
	topic = Topic.objects.get(pk=pk)
	width = topic.image.width
	height = topic.image.height
	date = topic.created_on.isoformat()
	count = topic.action_set.filter(approved=1).count()
	if count <= 1:
		title = "Get Involved | " + topic.title
	if count > 1:
		title = str(count) + " Ways to get Involved | " + topic.title
	return HttpResponse(
		"""
		<!DOCTYPE html>
		<html>
		<head>
		      <meta http-equiv="content-type" content="text/html; charset=utf-8">
		      <title>{title}</title>
		      <meta property="og:title" content="{title}">
		      <meta property="og:description" content="{description}">
		      <meta property="og:image" content="{image}">
		      <meta property="og:image:width" content="{width}">
		      <meta property="og:image:height" content="{height}">
		      <meta property="og:pubdate" content="{date}">
		      <meta property="og:site_name" content="Respond/React">
		      <meta property="og:url" content="http://respondreact.com/topic/{pk}">
		      <meta property="fb:app_id" name="fb_app_id" content="1513191525645232">
		      <meta content="website" property="og:type">

		      <meta name="twitter:card" content="summary" />
		      <meta name="twitter:site" content="@keubs" />
		      <meta name="twitter:title" content="{title}" />
		      <meta name="twitter:image" content="{image}" />
		      <meta name="twitter:url" content="http://respondreact.com/topic/{pk}" />
		  </head>
		  <body>
		  	<h1>{title}</h1>
		  	<img src="{image}" />
		  </body>
		</html>
		""".format(title=title, description=topic.description, image=topic.image.url, height=height, width=width, pk=pk, date=date)
	)
