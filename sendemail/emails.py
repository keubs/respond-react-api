from django.shortcuts import render
from django.core.mail import EmailMultiAlternatives
from django.template.loader import get_template
from django.template import Context
from customuser.models import CustomUser

# Create your views here.
class EmailMessage(EmailMultiAlternatives):

	def __init__(self, from_email, to_emails, user=None):
		self.html_body = """
		<a style="margin:0 auto; display: block; text-align: center" href="http://respondreact.com"><img style="width: 60px;" src="http://api.respondreact.com/static/static/images/logo-color.png" title="respond/react" /></a><br />
		<p style="text-align: center">Don&apos;t just <strong>react</strong>, <em>respond</em>.</p>
		<div style="border: solid 1px #666; padding: 25px 15px; max-width: 800px; margin: 0 auto;">
			{interior}
		</div>
		{cta}
		"""

		self.from_email = from_email
		self.to_emails = to_emails
		self.user = user

	def basic_message(self, subject, txt_body, html_body, from_email, to_emails):
		# subject, from_email, to = 'hello', 'noreply@respondreact.com', 'kevinac4@gmail.com'
		text_content = 'This is an important message.'
		html_content = '<p>This is an <strong>important</strong> message.</p>'
		self.send(txt_body, html_body)

	def new_user(self):
		self.subject = "Welcome to respond/react"
		self.txt_body = """
		http://respondreact.com\n\n
		Welcome to respond/react!\nNow is the time to get yourself - and others - involved in your community.
		"""

		html_interior = "<p>Welcome to respond/react!<br />Now is the time to get yourself - and others - involved in your community.</p>"
		cta = """
		<p><a style="padding: 20px 40px; display: inline-block; background: #30bad7; color: #FFF; text-decoration: none; margin: 20px 0;" href="http://respondreact.com/">Get Started Now</a></p>
		"""
		self.html_body = self.html_body.format(interior=html_interior, cta=cta)

		self.send()

	def new_action(self, topic, action):
		action_user = CustomUser.objects.get(pk=action.created_by.id)
		self.subject = "respond/react - You have an action to approve"
		self.txt_body = """
		http://respondreact.com\n\n
		{action_username} has posted a new action: {action_title} for your topic:\n\n
		{topic_title}\n\n
		It won’t appear on your topic page until you approve it. Click the link below to approve it.\n\n
		http://respondreact.com/user/{userid}
		""".format(action_username=action_user.username, action_title=action.title, topic_title=topic.title, userid=self.user.id)

		html_interior = """
		<p><a href="http://respondreact.com/user/{created_by}">{action_username}</a> has posted a new action: <strong>{action_title}</strong> for your topic:<br/>
		<a href="http://respondreact.com/topic/{topicid}">{topic_title}</a>.<br/></p>
		<p>It won’t appear on your topic page until you approve it. Click the link below to approve it.</p>
		""".format(created_by=action.created_by.id, action_username=action_user.username, action_title=action.title, topicid=topic.id, topic_title=topic.title)
		cta = """
		<p><a style="padding: 20px 40px; display: inline-block; background: #30bad7; color: #FFF; text-decoration: none; margin: 20px 0;" href="http://respondreact.com/user/{userid}">APPROVE ACTION</a></p>
		""".format(userid=self.user.id)

		self.html_body = self.html_body.format(interior=html_interior, cta=cta)

		self.send()

	def action_approved(self, topic, action):
		action_user = CustomUser.objects.get(pk=action.created_by.id)
		self.subject = "respond/react - Your action was approved and is now public"
		self.txt_body = """
		http://respondreact.com\n\n
		{topic_user} has approved your action {action_title} for the topic:\n\n
		{topic_title}\n\n
		""".format(topic_user=topic.created_by.username, action_username=action_user.username, action_title=action.title, topic_title=topic.title, userid=self.user.id)

		html_interior = """
		<p><a href="http://respondreact.com/user/{topic_userid}">{topic_user}</a> has approved your action: <strong>{action_title}</strong>.</p>
		<p>View it under the topic <a href="http://respondreact.com/topic/{topicid}">{topic_title}</a>.</p>
		""".format(topic_userid=topic.created_by.id, topic_user=topic.created_by.username, action_title=action.title, topicid=topic.id, topic_title=topic.title)
				
		self.html_body = self.html_body.format(interior=html_interior, cta='')

		self.send()

	def action_declined(self):
		pass


	def send(self):
		msg = EmailMultiAlternatives(self.subject, self.txt_body, self.from_email, self.to_emails)
		msg.attach_alternative(self.html_body, "text/html")
		msg.send()