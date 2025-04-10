#!/bin/bash
echo "Script to invoke json file"
# Path to the JSON file
json_file="esh.json"
echo "Fetching the values.."
echo ""

# Use jq to extract values from the JSON file and store them in variables
DateofBirth=$(jq -r '.DOB' "$json_file")
PlaceofBirth=$(jq -r '.placeofBirth' "$json_file")
State=$(jq -r '.state' "$json_file")
Country=$(jq -r '.country' "$json_file")
Pincode=$(jq -r '.pincode' "$json_file")
Whoami=$(jq -r '.whoami' "$json_file")

# Output the extracted values
echo "My name is:" $Whoami
echo "My Date of Birth:" $DateofBirth
echo "My Native town is:" $PlaceofBirth
echo "My current State is:" $State
echo "My Country is:" $Country
echo "My native Post Pincode:" $Pincode
