#!/bin/bash

# Number of requests to make
num_requests=1000

# Delay between requests (in seconds)
delay=0.1

# URL to test
url="http://myapp.local/frontend"

# Duration to sustain high load (in seconds)
high_load_duration=300

# Function to send HTTP requests
send_requests() {
  end_time=$((SECONDS + high_load_duration))
  while [ $SECONDS -lt $end_time ]
  do
    for ((i=1; i<=num_requests; i++))
    do
      curl -s -o /dev/null $url &
      sleep $delay
    done
    wait
  done
}

# Start sending requests
send_requests
