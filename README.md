# About the Repo
I've finished the **Linux Admin  1 & 2** recently, but I realized that knowing only commands will not benefit.
So, I decided to practice and put my knowledge into real projects that will definitly strengthen my skills.
I make this parent repo that will, insha'allah, hold many projects later.

I implement the idea on my local machine (for now). If you'd like, you can test with a remote host or cloud.
So, I create `/backup` and `/data`. I back up the /data folder into the /backup with the `rsync` incremental tool.

## 1- Encrypted Linux Backup System
It's a backup system that performs automated **daily and weekly encrypted backups**

#### The Architecture
The project arch will be like that
<img width="891" height="263" alt="treeAll" src="https://github.com/user-attachments/assets/640a9e06-13b4-436b-a1fb-94bd5086a0d9" />

#### Features
- Daily automated encrypted backups
- Weekly rotated encrypted backups (4-week retention)
- Compression before encryption
- Secure permissions
- Restore testing
- Logging

#### Tools Used
- `rsync`
- `gpg`
- `crontab`

#### Setup Steps
1. Create the `/data` for testing purposes, and put some folders into it.
2. Create the `/backup` and organize it into daily, weekly, and log files.
3. Change the owner of both directories to be the **root**, security concerns
4. Change also the permissions to be `750 -> /data` and `700 -> /backup` to prevent any unauthZ access
5. Verify before continuing
6. Write your automated scripts for the **daily and weekly** backups
7. Make them executable
8. Automate the task with `crontab -e`

#### Lesson Learned
1. Backup not just copying files; it involves automation, security, validation, etc.
2. Dealing with the `rsync` tool, it's an awesome tool for incremental file transferring.
3. Automate the repeated tasks with scripts to ease the maintenance and reduce error handling.
4. Apply the permissions correctly, on the data and the backup.

#### Go Further
- Email Alerts (on failure)
- Integrity Verification
- Push to a remote server using `SSH`
<br>

## 2- Linux Services Monitoring
**The automation is the magic.**
Another Linux automation project that monitors the critical services, checks CPU and memory usage, and logs everything.

> I **hardcoded** the services, but this is not the best way; I used it for learning purposes only.
###### Best Ways for That:
- Use an external config file
- Discover services dynamically using `systemctl list-units --type=service`
- With the enterprises, they are using **policy-based** monitoring using `Ansible - Prometheus - Puppet`

### The Logic 
1. Checking if the service is running or not
2. If not, restart it.
3. If it's already running, check its cpu and memory usage.
4. If its usage is higher than the threshold specified, logs with a warning header. [Go Further]

### Tools Used
- `systemctl`
- `ps`
- `awk`

### Usage
- Clone the repo `git clone https://github.com/Abdallahhendy/Linux-Projects.git`
- Navigate to the folder `cd Linux-Projects`
- Make the script executable `chmod +x file`
- Run the script `sudo ./file.sh`

#### Make It Flexible
- You can add it to your `crontab -e`, customize it as you want
- You can also convert it to a systemd service

> TRACE YOUR BASH SCRIPT <br>
`bash +x ./chk_services.sh`   -> That will run line by line, and you can see if there's an issue

#### Go Further
- Email notification when high usage
- Perform a **graceful cooldown** when high usage or restarting the stateless services.
- Disk usage monitoring





