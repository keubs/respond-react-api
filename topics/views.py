from django.shortcuts import render
from django.http import HttpResponse
from pprint import pprint

from .models import *
# Create your views here.
def topic_details(request, pk):
	a = Topic.objects.get(pk=pk)
	return HttpResponse(
		"""
		<!doctype html>
		<html class="no-js">
		  <head>
		      <base href="/">
		      <meta charset="utf-8">
		      <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		      <title>{title}</title>
		      <meta content="{title}" property="og:title" />
		      <meta content="{image}" property="og:image" />
		  </head>
		  <body>
		  	<h1>{title}</h1>
		  	<img src="{image}" />
		  </body>
		</html>
		""".format(title="Get Involved | " + a.title, image=a.image.url)
	)