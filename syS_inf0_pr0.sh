#!/bin/bash

# Define text color for banner
color=("\033[1;31m" "\033[1;32m" "\033[1;33m" "\033[1;34m" "\033[1;35m" "\033[1;36m" "\033[1;37m")
random_color=${color[$RANDOM % ${#color[@]}]}
reset='\033[0m'

# Print banner
echo -e "$random_color"
echo -e "_

                                       _        
   ()                    o            | |       
   /\          ,              _  _    | |   __  
  /  \ |   |  / \_       |   / |/ |   |/   /  \_
 /(__/  \_/|/  \/        |_/   |  |_/ |__/ \__/ 
          /|                          |\        
          \|       _____              |/                                             
                                                                   
_"

echo -e "${random_color} system_info script by: Dark_Shadow04 ${reset}\n"
echo -e "${random_color} https://github.com/DarkShadow04  ${reset}\n"
echo -e "${random_color} Copyright 2022 Dark_Shadow04 ${reset}\n"


# Get system information
system_info=$(uname -a)

# Print system information
echo "System: $(uname -s)"
echo "Node Name: $(uname -n)"
echo "Release: $(uname -r)"
echo "Version: $(uname -v)"
echo "Machine: $(uname -m)"
echo "Processor: $(uname -p)"

# Check for necessary dependencies
dependencies=("lsb-release" "lshw" "enscript")
missing_dependencies=()

for dependency in "${dependencies[@]}"; do
    if ! dpkg -s "$dependency" > /dev/null 2>&1; then
        missing_dependencies+=("$dependency")
    fi
done

# Install missing dependencies
if [ ${#missing_dependencies[@]} -ne 0 ]; then
    echo "Installing missing dependencies: ${missing_dependencies[*]}"
    sudo apt-get install "${missing_dependencies[@]}"
fi

# Get distribution information
distribution_info=$(lsb_release -a)

echo "Distribution Information:"
echo "$distribution_info"

# Get hardware information
hardware_info=$(lshw)

echo "Hardware Information:"
echo "$hardware_info"

# Get available disk space
echo "Disk Space:"
df -h

# List top 30 largest files and directories in current directory
echo "Top 30 Largest Files and Directories:"
du -sh * | sort -hr | head -n 30

# Ask user if they want to generate a PDF report
read -p "Do you want to generate a PDF report? [Y/n] " pdf_report
pdf_report=${pdf_report,,}  # Convert to lowercase
if [ "$pdf_report" == "y" ]; then
    # Generate PDF report
    report_filename="report_$(date +%Y%m%d_%H%M%S).pdf"
    enscript -p "$report_filename" /dev/stdin <<EOF
$system_info

$distribution_info

$hardware_info

$(df -h)

$(du -sh * | sort -hr | head -n 30)
EOF
    echo "PDF report generated: $report_filename"
fi

echo "Script executed successfully with blessing of Dark_Shadow04."

