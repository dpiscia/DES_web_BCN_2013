# -*- coding: utf-8 -*-
"""
Created on Thu May 30 09:21:05 2013

@author: dpiscia
"""


import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText

def send_email(mailhost,port,username,pwd,toaddrs,content, subject):
#port = 587
#mailhost = "smtp.gmail.com"
    smtp = smtplib.SMTP(mailhost, port)
#msg = "prova"
    smtp.ehlo()
    smtp.starttls()
    smtp.ehlo()
    smtp.login(username,pwd)
    msg = MIMEMultipart()
    msg['Subject'] = subject
    part1 = MIMEText(content, 'plain')
    msg.attach(part1)
    smtp.sendmail(username,toaddrs, msg.as_string())
 