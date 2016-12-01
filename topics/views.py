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
		<!doctype html>
		<html class="no-js">
		  <head>
		      <base href="/">
		      <meta charset="utf-8">
		      <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		      <title>{title}</title>
		      <meta property="og:title" content="{title}">
		      <meta property="og:image" content="{image}">
		      <meta property="og:image:width" content="{width}">
		      <meta property="og:image:height" content="{height}">
		      <meta property="og:pubdate" content="{date}">
		      <meta property="og:site_name" content="Respond/React">
		      <meta property="og:url" content="http://dev.respondreact.com/topic/{pk}">
		      <meta property="fb:app_id" name="fb_app_id" content="1513191525645232">
		      <meta content="website" property="og:type">

		  </head>
		  <body>
		  	<h1>{title}</h1>
		  	<img src="{image}" />
		  </body>
		</html>
		""".format(title="Get Involved | " + a.title, image=a.image.url, height=height, width=a.image.width, pk=pk, date=date)
	)