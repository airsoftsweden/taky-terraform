# taky-terraform
Terraform Repo for the public TAKY Setup

## Howto

- Install terraform and Clone this repo
- Generate SSH Key to connect to the Server
- DigitalOcean Account
  - Create a Digital Ocean token with **WRITE** access
    - Link: https://docs.digitalocean.com/reference/api/create-personal-access-token/
    - Add Digital Ocean PA Token to secrets.tfvars
  - Add SSH Key to Digital ocean account
    - Add the SSH-Key fingerprint to secrets.tfvars
- Namecheap
  - Buy a domain name to use with the servers
    - Generate API key
    - insert API Key and Domain name into secrets.tfvars

### Secrets File

Create a file called secrets.tfvars
```
############### Static Secrets ###############
ssh_key            = "c:\\<Point_Me_to_your_private_SSH_Key>\\id_rsa"
ssh_fingerprint    = "DigitalOcean_SSH-Key_Fingerprint"

namecheap_username = "user"
namecheap_api_user = "user"
namecheap_api_key  = "NameCheap_API_Key"
do_token           = "DigitalOcean_Token"

############### Server Configuration ###############
domain             = "example.com"              # Namecheap controlled Domain name
servers            = ["red", "blue", "yellow"]  # Name and amount of servers
cert_pass          = "atakatak"                 
map_endpoint       = "/map"
email              = "mumble-admin@example.com"
mumble_password    = "Passw0rd123"
```

Then run from the directory
```
terraform init
terraform apply -var-file='secrets.tfvars'
```
To start additional services login and run from the server
```
ssh root@blue.example.com
cd /opt/taky-ansible/ansible
ansible-playbook -i ansible_hosts taky-services.yml
```