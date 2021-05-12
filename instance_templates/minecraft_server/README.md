# Minecraft Server

## Features
 - ✅ implemented
 - ⬜ not implemented/ideas

| Status | Feature |
|--|--|
| ✅ | Start the Minecraft server on boot. |
| ✅ | Reattach to the server console. |
| ✅ | Checks cyclically whether someone is on the server and shuts the instance down if necessary. |
| ✅ | Daily backup shutdown to protect you against unwanted costs. |
| ✅ | Cloudflare DNS update. |
| ✅ | Discord WebHook notification on boot and shutdown. |
| ⬜ | Some sort of Minecraft proxy server setup to bypass the slow DNS solution. |

## AWS EC2 Setup
 - Instance type: *t3.medium*
 - Platform: *Ubuntu*
 - AMI: `ami-0e4c7d981c4817239` (Just for reference)
 - Security Group:
	-   Type: **SSH**, Port: **22** Source: **Anywhere**
	-   Type: **Custom TCP Rule**, Port: **25565**, Source: **Anywhere**
	-   Type: **Custom UDP Rule**, Port: **25565**, Source: **Anywhere**

## Getting started

 1. Install packages: **`apt-get update && apt-get install -y git screen jq openjdk-11-jdk-headless`**
 2. Git clone this repository: **`git clone https://github.com/rvbg/aws-on-demand`**
 3. Move instance template files into the user directory: **`mv aws-on-demand/instance_templates/minecraft_server/* /home/ubuntu`**
 4. Remove the remaining folder: **`rm -r aws-on-demand`**
 5. Go into your home directory: **`cd /home/ubuntu`**
 6. Drop your minecraft server into the minecraft folder exactly like *`minecraft/server.jar`*
 7. Make all bash scripts executable: **`chmod +x cloudflare-ddns-update.sh && chmod +x sequence.sh && chmod +x autostop.sh && chmod +x discord-webhook.sh`**
 8. Edit *`sequence.sh`* and put in your minecraft server launch parameters. I recommend 3072MB RAM for a t3.medium.
 9. Edit *`cloudflare-ddns-update.sh`* and put in your Cloudflare credentials. If you use a different DNS service, supply your own update script.
 10. Edit *`discord-webhook.sh`* and put in your Discord Webhook URL. If you do not want to use this feature, remove the calling line in *sequence.sh*.
 11. Run the DDNS script manually to check if your credentials are working: **`./cloudflare-ddns-update.sh`**
 12. Apply the cronjobs: **`sudo crontab /home/ubuntu/crontab -u ubuntu`**
 13. Restart the instance to start the sequence: **`sudo shutdown -r now`**

## Other
#### Connect to the  console
`screen -x`

#### Client DNS-Problems
If your client is very slow getting the updated DNS entry, use `ipconfig /flushdns` on Windows.
You can even enter this command as an automated MultiMC start-up command.