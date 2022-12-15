FROM ubuntu:latest

# Update Ubuntu
RUN apt-get update
RUN apt-get upgrade -y

# Set Locale and TimeZone
RUN echo 'tzdata tzdata/Areas select Europe' | debconf-set-selections
RUN echo 'tzdata tzdata/Zones/Europe select London' | debconf-set-selections
RUN DEBIAN_FRONTEND=noninteractive apt-get install tzdata -y

# Install pre-reqs
RUN apt-get install apt-utils -y
RUN apt-get install gnupg -y
RUN apt-get install software-properties-common -y
RUN apt-get install curl -y
RUN apt-get install wget -y
RUN apt-get install apt-transport-https -y
RUN apt-get install ca-certificates -y

# Install PowerShell
RUN wget -q https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb
RUN add-apt-repository universe
RUN apt-get update -y
RUN apt-get install -y powershell

# Install PowerShell Modules
RUN pwsh -Command Install-Module -Name Az -Scope AllUsers -Repository PSGallery -Force

# Install tools
RUN apt-get install jq -y
RUN apt-get install nano -y
RUN apt-get install vim -y
RUN apt-get install tree -y
RUN apt-get install iputils-ping -y
RUN apt-get install traceroute -y
RUN apt-get install dnsutils -y
