#!/bin/bash

# Check if Docker is installed
if ! command -v docker &> /dev/null
then
    echo "Docker not found, installing Docker..."
    # Install Docker
    sudo apt install docker.io
fi

# Print custom text
echo "_       _           _           _        _ _           
| | __ _| |__  ___  (_)_ __  ___| |_ __ _| | | ___ _ __ 
| |/ _\` | '_ \/ __| | | '_ \/ __| __/ _\` | | |/ _ \ '__|
| | (_| | |_) \__ \ | | | | \__ \ || (_| | | |  __/ |   
|_|\__,_|_.__/|___/ |_|_| |_|___/\__\__,_|_|_|\___|_|   
                                                        
"

# Prompt user for installation option
echo "Please select an installation option:"
echo "1. DVWA"
echo "2. bWAPP"
echo "3. Yavuzlar"
echo "4. Install All"
read -p "Enter option number: " option

# Install selected package(s)
case $option in
    1)
        echo "Installing DVWA..."
        docker run --name dvwa -d -p 81:80 vulnerables/web-dvwa:latest
        echo "DVWA Installation Complete"
        echo "Access DVWA at http://localhost:81"
        ;;
    2)
        echo "Installing bWAPP..."
        docker run --name bwapp -d -p 82:80 raesene/bwapp:latest
        echo "bWAPP Installation Complete"
        echo "Access bWAPP at http://localhost:8"
        ;;
    3)
        echo "Installing Yavuzlar..."
        docker run --name vulnlab -d -p 83:80 yavuzlar/vulnlab:latest
        echo "Yavuzlar Installation Complete"
        echo "Access Yavuzlar at http://localhost:83"
        ;;
    4)
        echo "Installing all labs..."
        echo "Installing DVWA..."
        docker run --name dvwa -d -p 81:80 vulnerables/web-dvwa:latest
        echo "DVWA Installation Complete"
        echo "Access DVWA at http://localhost:81"
        echo "Installing bWAPP..."
        docker run --name bwapp -d -p 82:80 raesene/bwapp:latest
        echo "bWAPP Installation Complete"
        echo "Access bWAPP at http://localhost:82"
        echo "Installing Yavuzlar..."
        docker run --name vulnlab -d -p 83:80 yavuzlar/vulnlab:latest
        echo "Yavuzlar Installation Complete"
        echo "Access Yavuzlar at http://localhost:83"
        ;;
    *)
        echo "Invalid option selected."
        ;;
esac
