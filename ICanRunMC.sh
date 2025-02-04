#!/bin/bash

# Check if running as root, exit if not
if [ "$(id -u)"! = "0" ]; then
   echo "This script must be run with sudo. Aborting."
   exit 1
fi

# Define the variables to be added
VARIABLES_TO_ADD="
export MESA_GL_VERSION_OVERRIDE=3.3COMPAT
export MESA_GLSL_VERSION_OVERRIDE=330
export MESA_NO_ERROR=1
export MESA_GLES_VERSION_OVERRIDE=3.1
"

# Backup /etc/environment (Manual step recommended, automating it here for completeness)
# Comment the next line if you've already backed up manually
cp /etc/environment /etc/environment.backup

# Append the variables to /etc/environment
echo "$VARIABLES_TO_ADD" | sudo tee -a /etc/environment

# Inform the user of the outcome
echo "Variables have been appended to /etc/environment."
echo "Please note: You may need to restart your system or run 'ource /etc/environment' in each shell to apply these changes."