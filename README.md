## Manjaro development provisioning

Note: The playbook is tested and optimized for Fedora Workstation 32.

### What the playbook does:

- Ensures the following are installed: 
    - git
    - vim
    - htop
    - flatpak
    - exa

- Installs and adds sensible defaults to the following gnome extensions:
   - dash-to-dock
   - appindicator (for tray icons)
   - dynamic-panel-transparency
They can also be managed or updated from : https://extensions.gnome.org/local/ using the chrme extension: https://chrome.google.com/webstore/detail/gnome-shell-integration/gphhapmejobijbbhgpjhcjognlahblep?hl=en

- Sets max size for systemd logs to 500 MB
- Instals and configures **fish shell**. It includes **fzf** and **fzf fish plugin** to enable history search and the **pure** theme. Also adds kubectl autocompletions
- Installs **Brave** browser
- Installs the following development tools:
    - Postman (https://www.getpostman.com)
    - Visual Studio Code (https://code.visualstudio.com/)
    - NodeJs (https://nodejs.org/en/)
    - Jetbrains toolbox is found in home folder
- Ensures a folder named **Projects** exists in the user's home directory
- Clones **devilbox** (LEMP/MEAN development environment) in the Projects folder. (https://github.com/cytopia/devilbox)
- Configures colors for git. It also adds name and email in .gitconfig if the corresponding variables are set in vars.yml
- Adds the following OS configuration :
     - Sets the hostname if the corresponding variable is set in vars.yml
     - Enables Automatic Login
- Installs **docker and docker-compose**. Configures docker to use 10.10.0.0/16 subnet with a smaller network size than the default. This was done in order to avoid issue when connecting to the AWS network via VPN
- Installs Kubernetes and kubectx and kubens
- Adds the following keyboard shortcuts:
     - **Super+E** starts the file manager
     - **Super+T** from Nautilus opens terminal from the current location
     - **CTRL+Shift+Esc** opens the Sytem Monitor
     - **CTRL+Alt+T** opens the terminal
     - **Super+D** hides all windows
     - **Super+Pause** shows system information

- Inhibts/overrides the following default shorcuts:
     - **Alt+F7** - used as 'Find Usages'
     - **Alt+F8** - used as 'Evaluate(in debugger context)'

- Installs Ubuntu font family and updates default regular fonts
- Installs Jetbrains Mono font family and updates default monospace font

- Sets fs.inotify.max_user_watches in sysctl to fs.inotify.max_user_watches to prevent issues with some IDEs

Note: 
- Some dependencies needed to run the ansible commands might be installed as well, such as python3-psutil needed for the dconf module or unzip
- Running the playbook **will override** other custom keybindings

### Getting started
---

#### **1. Copy the vars.yml file**

```bash
$ cp vars.yml.dist vars.yml
```
The vars.yml file contains some variables that can override the default variable in the Ansible roles

#### **2. Edit the vars.yml file**

By default all variables are commented out. To enable them, just uncomment and change the variables that you need.

---

#### **3. Run the provision.sh file**

What it does: 
1. Installs Ansible using dnf
2. Runs the Ansible playbook

```bash
$ ./provision.sh
```

Note: The script will ask for the sudo password twice: once for installing Ansible, and one more time for running the playbook.

