## Manual and instructions

#### Requirements

This script needs to be executed on your Veeam Backup server.

Because it is using Microsoft Powershell, your user permissions must allow the execution of the script. Additionally your Powershell Execution Policy has be set accordingly.

The user needs permissions to enable the Veeam Powershell plugin as well. Otherwise enable it before running the script.

#### Constraints

The Veeam Databases have to be installed on the Veeam Backup server.

Remote Databases are not supported at the moment.

#### Instructions

This tool helps you to get a quick backup of you Veeam Databases and your Veeam Configuration.

You can choose the instances by simply clicking the different Databases according to your environment.

If one of the backups fails, you will receive a error message for the Database, but the script will keep running.

The Database informations like the instance name will be read from the Windows Registry during runtime, so there is no need to worry if you changed the default names or paths.

The Configuration backup settings are read from your environment as well and a temporary Veeam repository is created for your selected folder to have all the backups in the same folder path. Afterwards the repository gets deleted. 