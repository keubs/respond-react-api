from django.shortcuts import render
from django.http import HttpResponse
from pprint import pprint

from .models import *
# Create your views here.
def topic_details(request, pk):
	a = Topic.objects.get(pk=pk)
	width = a.image.width
	height = a.image.height
	date = a.created_on.isoformat()
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
		      <meta property="og:url" content="http://dev.respondreact.com/topic/{pk}">
		      <meta property="fb:app_id" name="fb_app_id" content="1513191525645232">
		      <meta content="website" property="og:type">

		      <meta name="twitter:card" content="summary" />
		      <meta name="twitter:site" content="@keubs" />
		      <meta name="twitter:title" content="{title}" />
		      <meta name="twitter:image" content="{image}" />
		      <meta name="twitter:url" content="http://dev.respondreact.com/topic/{pk}" />
		  </head>
		  <body>
		  	<h1>{title}</h1>
		  	<img src="{image}" />
		  </body>
		</html>
		""".format(title="Get Involved | " + a.title, description=a.description, image=a.image.url, height=height, width=a.image.width, pk=pk, date=date)
	)