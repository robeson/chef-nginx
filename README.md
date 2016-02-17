# NWEA Tech Quiz

## Summary

Automate the configuration and installation of Nginx on a Linux system, ideally RedHat, CentOS, or Fedora.
* Nginx should listen on port 8888.
* The content served should be from the following repository: https://github.com/nwea-techops/tech_quiz

## Usage

These instructions assume the environment is Amazon Linux on AWS.

1. Create the environment, allowing HTTP connections on Port 8888 and SSH connections.
2. Connect to the new environment via SSH.
3. Install Git: `sudo yum install git`
4. Install Chef DK: `curl https://omnitruck.chef.io/install.sh | sudo bash -s -- -c current -P chefdk`
5. Clone this repository: `git clone https://github.com/robeson/chef-nginx.git`
6. Change to the repository directory: `cd chef-nginx`
7. Run the Chef cookbook: `sudo chef-client --local-mode --override-runlist tech_quiz`

