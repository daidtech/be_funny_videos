#!/usr/bin/env bash

EB_APP_USER=$(/opt/elasticbeanstalk/bin/get-config platformconfig -k AppUser)
SIDEKIQ_PID=$(/usr/bin/pgrep -u "$EB_APP_USER" -f sidekiq)
 
if [ -n "$SIDEKIQ_PID" ]; then
  echo "TERM/quieting sidekiq"
  kill -TERM "$SIDEKIQ_PID"
fi