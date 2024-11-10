#! /bin/bash

# Check if "package.json" file exists to confirm this is a Node.js project.
if [ ! -f "package.json" ]
then
    echo "This is not a nextjs app"
    exit 1  # Exit if "package.json" doesn't exist.
fi

# Check if "next" is mentioned in "package.json" to confirm it's a Next.js project.
check_if_nextjs=$(grep -c "next" package.json)

# If "next" is not found, this is not a Next.js project.
if [ $check_if_nextjs -eq 0 ]
then
    echo "This is not a nextjs app"
    exit 1  # Exit if it's not a Next.js project.
fi

# Get the folder name from the first argument.
folder=$1

# Set the default file extension to "tsx".
file_extension="tsx"

# If a second argument is provided, use it as the file extension.
if [ -z $2 ]
then
    file_extension="tsx"
else
    file_extension=$2
fi

# Inform the user of the setup process for the specified route.
echo "Setting up the $folder route in your nextjs app"

# Check if the folder name was provided.
if [ -z "$folder" ]
then
    echo "Please provide the folder name"
    exit 1  # Exit if the folder name is missing.
fi

# Check if the route folder already exists in the "app" directory.
if [ -d "app/$folder" ]
then
    echo "Route already exists"
    exit 1  # Exit if the route already exists.
fi

# Create the folder for the route in the "app" directory.
echo "Setting up the route in app/$folder"
mkdir app/$folder

# Create a page component file in the new route folder.
# The file extension and component name are based on the provided arguments.
echo "import React from 'react'

const page = () => {
  return (
    <div>$folder</div>
  )
}

export default page" > app/$folder/page.$file_extension
