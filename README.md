# taky-terraform
Terraform Repo for the public TAKY Setup

## Howto

### Secrets File

Create a file called secrets.tfvars
```
ssh_key            = "c:\\<Point_Me_to_your_private_SSH_Key>\\id_rsa"
ssh_fingerprint    = "DigitalOcean_SSH-Key_Fingerprint"

namecheap_username = "user"
namecheap_api_user = "user"
namecheap_api_key  = "NameCheap_API_Key"
do_token           = "DigitalOcean_Token"
```

Then run 
```
terraform apply -var-file='secrets.tfvars'
```