# get the external IP address of the VM
IP=$(curl http://metadata.google.internal/computeMetadata/v1/instance/network-interfaces/0/access-configs/0/external-ip -H Metadata-Flavor:Google 2> /dev/null)

# create the URL that the Bandage docker service is running at
BANDAGE_URL="http://${IP}:8443"

# generate a new JupyterLab App Launcher config file from the template
cp /home/jupyter/.local/share/jupyter/jupyter_app_launcher/jp_app_launcher.yaml.template /home/jupyter/.local/share/jupyter/jupyter_app_launcher/jp_app_launcher.yaml

# add the Bandage URL to the config file
# NOTE: this is done in place, rather than while copying the template, so that we can replace multiple placeholders in the future
sed -i "s|{{bandage}}|${BANDAGE_URL}|g" /home/jupyter/.local/share/jupyter/jupyter_app_launcher/jp_app_launcher.yaml
