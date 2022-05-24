su - vindpro
ssh-keygen -f ~/.ssh/vindpro_demo -t rsa -C "demo remote vms" 
cat ~/.ssh/vindpro_demo.pub >> ~/.ssh/authorized_keys


# az keyvault secret set --vault-name "<your-unique-keyvault-name>" --name "ExamplePassword" --value "<>"
# #chmod 600 ~/.ssh/authorized_keys
# cat ~/.ssh/vindpro_demo
# ssh-keygen -f "/home/vindpro/.ssh/known_hosts" -R "<ip>"
# ssh -i ~/.ssh/vindpro_demo charbak@<ip> -oStrictHostKeyChecking=no 'exit'

# cat ~/.ssh/id_rsa.pub | ssh <user>@<hostname> 'umask 0077; mkdir -p .ssh; cat >> .ssh/authorized_keys && echo "Key copied"'

# cat ~/.ssh/id_rsa.pub | ssh <user>@<hostname> 'cat >> .ssh/authorized_keys && echo "Key copied"'