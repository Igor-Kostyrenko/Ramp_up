#!/bin/bash

# # function for processing the name of the data center
clean_dc_name() {
  local dc_name=$1

  # remove the prefixes 'prod_aws_', 'prep_aws_', 'stage_aws_', 'dev_aws_'
  dc_name_cleaned=$(echo "$dc_name" | sed -E 's/^(prod_aws_|prep_aws_|stage_aws_|dev_aws_)//')

  # remove suffixes '.prep' та '.stage', if they are
  dc_name_cleaned=$(echo "$dc_name_cleaned" | sed -E 's/\.prep|\.stage//g')

  echo "$dc_name_cleaned"
}

# A function to receive input from the user and process the name of the data center
process_input() {
  echo "Enter the name of the data center:"
  read dc_name

  # Clearing the name of the data center
  cleaned_name=$(clean_dc_name "$dc_name")
  echo "Original: $dc_name -> Cleared name: swg-proxy_${cleaned_name}.sigproxy.aws.umbrella.com"
}

# Loop to enter multiple names
while true; do
  process_input
  
  # Request a repeat or exit
  echo "Want to edit a different name? (y/n)"
  read answer
  if [[ "$answer" != "y" ]]; then
    echo "finishing of work."
    break
  fi
done