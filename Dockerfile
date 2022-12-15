FROM ubuntu:latest

# Update Ubuntu
RUN apt-get update \
 && apt-get upgrade -y

# Set Locale and TimeZone
RUN echo 'tzdata tzdata/Areas select Europe' | debconf-set-selections \
 && echo 'tzdata tzdata/Zones/Europe select London' | debconf-set-selections \
 && DEBIAN_FRONTEND=noninteractive apt-get install tzdata -y

# Install pre-reqs and tools
RUN apt-get install gnupg -y \
 && apt-get install software-properties-common -y \
 && apt-get install curl -y \
 && apt-get install wget -y \
 && apt-get install apt-transport-https -y \
 && apt-get install ca-certificates -y \
 && apt-get install jq -y \
 && apt-get install nano -y \
 && apt-get install vim -y \
 && apt-get install tree -y \
 && apt-get install iputils-ping -y \
 && apt-get install traceroute -y \
 && apt-get install dnsutils -y

# Install PowerShell
RUN wget -q https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb \
 && dpkg -i packages-microsoft-prod.deb \
 && add-apt-repository universe \
 && apt-get update -y \
 && apt-get install -y powershell

# Install PowerShell Modules
RUN pwsh -Command Install-Module -Name Az -Scope AllUsers -Repository PSGallery -Force
