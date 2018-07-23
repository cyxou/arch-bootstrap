# WSL-bootstrap

This project aims to bootstrap your WSL distribution (currently only Ubuntu supported) with opinionated development tools and configs.
Before you start using this repo, please install WSL following the [official documentation](https://docs.microsoft.com/en-us/windows/wsl/install-win10#for-anniversary-update-and-creators-update-install-using-lxrun).

__Please choose Ubuntu as it is the only Linux distribution which is fully supported by WSL-bootstrap__

Once WSL and Ubuntu installed, proceed next.

## Configure terminal

For a better development experience with WSL, install the [Hyper](https://hyper.is) terminal.
Once Hyper installed, open it's configuration file (Ctrl+Comma), find `shell` and `shellArgs` parameters and assign them the following values:

```
shell: 'wsl.exe'
shellArgs: ['~'],
```

Now you will be dropped into your WSL shell every time you launch Hyper.

### Terminal font

WSL-bootstrap uses Powerline symbols to make your console look awesome. In order to display those symbols correctly, on your Windows host install one of your favourite fonts patched with Powerline symbols from the awesone [nerd-fonts](https://github.com/ryanoasis/nerd-fonts/releases) repository. Just pickup the font you like, download the archive, extract, select all the Windows Compatible fonts, right click -> Install. SourceCodePro font is highly recomended.

Once Powerline font is installed, open the Hyper config file (Ctrl+Comma) and specify your font like this:

```
fontFamily: '"SauceCodePro NF", Menlo, "DejaVu Sans Mono", Consolas, "Lucida Console", monospace',
```

Restart Hyper and you should be dropped into your Linux shell with specified font.

### Terminal theme

To make Hyper Terminal even more awesome, install one of the [awesome themes](https://github.com/bnb/awesome-hyper#themes), for example hyper-atom-dark-transparent. Add this to your Hyper config (Ctrl+Comma):

```
plugins: ['hyper-atom-dark-transparent'],
```


## Install WSL-bootstrap

Clone this repo:

```sh
git clone https://git.epam.com/Aleksandr_Sukhovetchenko/wsl-bootstrap.git
```

Next make sure that the WSL-bootstrap is available from the /home/<your_linux_user> folder in your Linux distro.
To do this just symlink the WSL-bootstrap repo into the root of your home folder in Linux distro. Open your Bash terminal (Hyper) and run:

```sh
ln -s /mnt/c/Users/<YOUR_USERNAME>/path/to/cloned/wsl-bootstrap ~/wsl-bootstrap
```
Make sure that you can now navigate into wsl-bootstrap folder with `cd ~/wsl-bootstrap`.

## Bootstrapping your Linux distribution

Now when you have your Linux shell opened it's time to bootstrap it.
Bootstrapping is performed by Ansible. So the first step is to install Ansible.
You can do it manually following [official documentation](http://docs.ansible.com/ansible/latest/intro_installation.html#latest-releases-via-apt-ubuntu) or using the *install_ansible_ubuntu.sh* bash script:

```sh
sudo ~/wsl-bootstrap/bin/install_ansible_ubuntu.sh
```

### Docker for Windows and Docker Toolbox

If you have to use Docker Toolbox for running docker on Windows, then set `docker_toolbox: yes` in the ./group_vars/local file.
Otherwise, WSL will be configured for working with Docker for Windows asuming you have exposed docker daemon port in docker settings.

### Run Ansible playbook

To bootstrap your Ubuntu installation, run:

```sh
~/wsl-bootstrap/bin/wsl-bootstrap
```

Ansible will ask for your SUDO password. Type it in and go get a cup of coffee. When bootstraping completes, close the terminal and open it again. Enjoy!

_PS._ Last thing before you go. Your symlinked wsl-bootstrap project will be unavailable after Ansible does it's heavylifting. This is because after restarting bootstrapped WSL distro, Windows drives will be mapped to the root of the linux distro (/), not under the /mnt/ as by default (thanks to /etc/wsl.conf). Thus you'll have to manually remove the symlinked wsl-bootstrap folder and create the symlink it again:

```sh
rm ~/wsl-bootstrap
ln -s /c/Users/<YOUR_USERNAME>/path/to/cloned/wsl-bootstrap ~/wsl-bootstrap
```