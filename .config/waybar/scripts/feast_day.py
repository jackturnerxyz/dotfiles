#!/usr/bin/env python3
import sys
import datetime
from icalendar import Calendar

ICS_FILE = "/home/jack/.config/waybar/feasts.ics"

with open(ICS_FILE, 'r') as f:
    cal = Calendar.from_ical(f.read())

today = datetime.date.today()
feast_today = None

for component in cal.walk('VEVENT'):
    dtstart = component.get('DTSTART').dt
    if isinstance(dtstart, datetime.datetime):
        dtstart = dtstart.date()
    if dtstart == today:
        feast_today = component.get('SUMMARY')
        break

if feast_today:
    print(f'{{"text": "{feast_today}", "tooltip": "{feast_today}"}}')
else:
    print('{"text": "No feast", "tooltip": "No feast today"}')

