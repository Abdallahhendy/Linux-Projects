# About the Repo
I've finished the **Linux Admin  1 & 2** recently, but I realized that knowing only commands will not benefit.
So, I decided to practice put my knowledge into real projects that will definitly strengthen my skills.
I make this parent repo that will, insha'allah, holds many projects later.

I implement the idea on my local machine (for now). If you'd like you can test with a remote host or cloud.
So, I create `/backup` and `/data`. I backup the /data folder into the /backup with the `rsync` incremental tool.

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

##### Setup Steps
1. Create the `/data` for testing purpose, and put some folders into it.
2. Create the `/backup` and organize it into dailly, weekly, and logs.
3. Change the owner of both directories to be the **root**, security concerns
4. Change also the permissions to be `750 -> /data` and `700 -> /backup` to prevent any unauthZ access
5. Verify before continouing
6. Write your automated scripts for the **daily and weekly** backups
7. Make them executable
8. Automate the task with `crontab -e`

#### Lesson Learned
1. Backup not just copying files, it involves automation, security, validation, etc.
2. Dealing with the `rsync` tool, it's an awsome tool for incremental files transfering.
3. Automate the repeated tasks with scripts to ease the maintainece and reduce error handling.
4. Apply the permissions correctly, on the data and the backup.

#### Go Further
- Email Alerts (on failure)
- Integrity Verification
- Push to a remote server using `SSH`
--- 








