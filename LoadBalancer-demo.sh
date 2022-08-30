grp="LB-Demo"
location="uksouth"
vnetName="vnet_lb_demo"
subnetName="vnet_lb_demo_subnet1"
vmName="LB_DEMO_VM1"
vmName2="LB_DEMO_VM2"
nsg="NSG_LB_Demo"
avset="AVSET_LB_Demo"

# CREATE RESOURCE GROUP
az group create --name $grp --location $location

# CREATE VIRTUAL NETWORK
az network vnet create --address-prefixes 10.3.0.0/23 --name $vnetName --resource-group $grp

# CREATING SUBNET
az network vnet subnet create -g $grp --vnet-name $vnetName -n $subnetName --address-prefixes 10.3.0.0/24

# CREATING SECURITY GROUP
az network nsg create -g $grp -n $nsg

# CREATING AVAILABILITY SET
az vm availability-set create -n $avset -g $grp --platform-fault-domain-count 2 --platform-update-domain-count 2

# CREATING VM1
az vm create --resource-group $grp --name $vmName --image ubuntults --vnet-name $vnetName --subnet $subnetName --nsg $nsg --availability-set $avset --admin-username admin11 --admin-password Admin@Password1

# CREATING VM2
az vm create --resource-group $grp --name $vmName2 --image ubuntults --vnet-name $vnetName --subnet $subnetName --nsg $nsg --availability-set $avset --admin-username admin11 --admin-password Admin@Password1

# INSTALLING APACHE
#apt-get update -y
#apt-get upgrade -y
#apt-get install apache2 -y
#echo "Hello From VM 1" > /var/www/html/index.html
# run "sudo chmod -R 777 /var/www/html" if you get error while running above cmd -bash: /var/www/html/index.html: Permission denied
# and then run -- echo "Hello From VM 1" > /var/www/html/index.html

#apt-get update -y
#apt-get upgrade -y
#apt-get install apache2 -y
#echo "Hello From VM 2" > /var/www/html/index.html