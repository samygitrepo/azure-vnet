grp="App-Gateway-Demo"
location="uksouth"
vnetName="vnet_appgateway_demo"
subnetName="vnet_appgateway_demo_subnet1"
vmName="VM_IMAGE"
vmName2="VM_VIDEO"

# CREATE RESOURCE GROUP
az group create --name $grp --location $location

# CREATE VIRTUAL NETWORK
az network vnet create --address-prefixes 10.4.0.0/23 --name $vnetName --resource-group $grp

# CREATING SUBNET
az network vnet subnet create -g $grp --vnet-name $vnetName -n $subnetName --address-prefixes 10.4.0.0/24

# CREATING VMs
az vm create --resource-group $grp --name $vmName --image ubuntults --vnet-name $vnetName --subnet $subnetName --admin-username admin11 --admin-password Admin@Password1
az vm create --resource-group $grp --name $vmName2 --image ubuntults --vnet-name $vnetName --subnet $subnetName --admin-username admin11 --admin-password Admin@Password1


# SETTING UP WEB SERVERS
#sudo apt-get update -y
#sudo apt-get upgrade -y
#sudo apt-get install apache2 -y

#echo "Hello From VM 1" > /var/www/html/index.html
# run "sudo chmod -R 777 /var/www/html" if you get error while running above cmd -bash: /var/www/html/index.html: Permission denied
# and then run -- echo "See all of your IMAGES here!" > /var/www/html/index.html

#echo "See all of your IMAGES here!" > /var/www/html/index.html
#echo "See all of your VIDEOS here!" > /var/www/html/index.html

#mkdir /var/www/html/images
#mv /var/www/html/index.html /var/www/html/images/index.html

#mkdir /var/www/html/videos
#mv /var/www/html/index.html /var/www/html/videos/index.html