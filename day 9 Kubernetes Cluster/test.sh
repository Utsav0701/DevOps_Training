#!/bin/bash
 
# Define the URL or API endpoint to be accessed
URL="https://myapp.local/frontend"
 
# Loop 1000 times
for ((i=1; i<=1000; i++))
do
    # Execute the curl command
    echo "Executing curl request $i"
    curl https://myapp.local/frontend 
done
 
echo "Completed 1000 curl requests."
