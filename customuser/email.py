from customuser.models import CustomUser
from annoying.functions import get_object_or_None
def email_user(strategy, details, *args, **kwargs):
	user = get_object_or_None(CustomUser, email=details['email'])
	if user is not None:
		pass
	else:
		# send email
		import sendemail.emails as ev
		email = ev.EmailMessage("noreply@respondreact.com",[details['email']], user)
		email.new_user()

