#!/bin/bash

#Elevate privilages
sudo su

#Install Java for Amazon-Linux
yum install java-17-amazon-corretto -y

# Create a directory   
mkdir /app && cd /app

# Download Nexus
NEXUSURL=" https://download.sonatype.com/nexus/3/latest-unix.tar.gz"
wget $NEXUSURL -O nexus.tar.gz
EXTOUT=`tar xzvf nexus.tar.gz`
NEXUSDIR=`echo $EXTOUT | cut -d '/' -f1`

# Move file
mv nexus-3* nexus

# Add User
useradd nexus

# Change ownership privilages
chown -R nexus.nexus /app/nexus
chown -R nexus:nexus /app/sonatype-work 

# Run Nexus service
cat <<EOT>> /etc/systemd/system/nexus.service
[Unit]                                                                          
Description=nexus service                                                       
After=network.target                                                            
                                                                  
[Service]                                                                       
Type=forking                                                                    
LimitNOFILE=65536                                                               
ExecStart=/app/nexus//bin/nexus start                                  
ExecStop=/app/nexus//bin/nexus stop                                    
User=nexus                                                                      
Restart=on-abort                                                                
                                                                  
[Install]                                                                       
WantedBy=multi-user.target                                                      

EOT

echo 'run_as_user="nexus"' > /app/nexus//bin/nexus.rc
chkconfig nexus on
systemctl daemon-reload
systemctl start nexus
systemctl enable nexus
