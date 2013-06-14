# -*- coding: utf-8 -*-
"""
Created on Thu May 30 09:21:05 2013

@author: dpiscia
"""


import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText



def send_email(mailhost,port,username,pwd,toaddrs,form, subject):
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

    text = "Dear DES participant \n You have registered for the DES Barcelona 2013 meeting \n Thanks and Best regards \n  \n \n \n"
    html = form.render(readonly=True)
            
    part1 = MIMEText(text, 'plain')
    part2 = MIMEText(html, 'html')
    msg.attach(part1)
    msg.attach(part2)
    smtp.sendmail(username,toaddrs, msg.as_string())
 