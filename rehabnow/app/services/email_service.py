from django.template.loader import render_to_string
from django.core.mail import send_mail, EmailMessage
from django.conf import settings


class EmailService:
    def __init__(self, template, context, subject, recipients):
        self.template = template
        self.context = context
        self.subject = subject
        self.recipients = [
            settings.DEFAULT_FROM_EMAIL,
        ]

    def send_email(self):
        message = render_to_string("email/%s" % self.template, self.context)
        email = EmailMessage(
            self.subject,
            message,
            settings.DEFAULT_FROM_EMAIL,
            self.recipients,
            [settings.DEFAULT_FROM_EMAIL],
        )
        email.content_subtype = "html"
        email.send()