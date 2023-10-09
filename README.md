# flask_4_databases_mysql_vm
* HHA 504 HW 4B
* Due 10/1
* OG Instructions below

## MySQL Setup on Azure/GCP VM
### Azure Virtual Machine Setup
* Login on the [Azure Portal](https://azure.microsoft.com/en-us/get-started/azure-portal) and search in the bar for Virtual Machines. Click on it and then click create in the top left to create a virtual machine. 
* Choose an existing resource group or create a new one
![image](https://github.com/meglee67/flask_4_databases_mysql_vm/assets/123908362/e2f79f06-cdf7-49d2-97e1-71ccbdbcfbc9)

* Give your VM a name
* For security type, set it to **Standard**
* For the size, choose **Standard_B1ms - 1 vCPU, 2 GiB memory ($15.11/month)**
* For Administrator account, instead of using the autogenerated SSH public key, choose the **Password** option to create your own user and password for this VM.
* For inbound port rules, choose to allow selected ports and check off **SSH, HTTP, and HTTPS**
* On the next tab for Networking, scroll down and click to enable the option of **Delete NIC when VM is deleted**
* On the next tab for Management,s croll down and click to enable **Auto-shutdown**. This is so you don't need to remember to come back and shut off your VM, costing you money. With this, change the timezone to EST and set it to whatever time you'd like.
* Then click on the review and create button in the bottom left.

### Google Cloud Platform Virtual Machine Setup
* Login on the [Cloud Console](https://console.cloud.google.com/) and click on the button new project. Name it something relevant to the task at hand.
![image](https://github.com/meglee67/mysql_cloudmanaged_databases/assets/123908362/f9dcf680-5ad7-4ceb-9b2a-834f7c871f6f)
* Then when on the page to create a new project, make sure to designate the location of the new project as AHI - GCP.
![image](https://github.com/meglee67/mysql_cloudmanaged_databases/assets/123908362/cad03e37-6540-4a02-b80e-27ef4b204a35)
* Once you have created a new project, make sure you are clicked into the right project. Go to the dashboard and check.
* Then click on the navigation menu in the top left and find the tab that is called "Compute Engine" and then on the pop-out menu, hit "Vm Instances"

![image](https://github.com/meglee67/flask_4_databases_mysql_vm/assets/123908362/a07af2ca-f152-47c8-8f21-56c3cd105798)
* Then click on create instance

![image](https://github.com/meglee67/flask_4_databases_mysql_vm/assets/123908362/94ebdff4-2203-4cb0-9112-55d43d0483dc)
* Give your instance a name and make sure the region and zone selected are **us-central1 (Iowa)** and **us-central1-a**
* For machine configuration, choose **E2**, and for machine type choose the preset **e2-small (2 vCPU, 1 core, 2GB memory**.
* The VM provisioning model should be standard, but if an error message displays that only the Spot model can be used, its okay to switch to that. It just means that the spot VM will only run for a certain amount of time before stopping, where in a standard VM it will continue to run unless you stop it. Spot VMs may be terminated at any time.
* Under Identity and API access, use the **Compute Engine default service account**
* For the firewall, click the options to **Allow HTTP and HTTPS traffic**
* Then hit create and wait for your VM instance to be created.

## Installing MySQL on the Azure VM
* First you will need to connect to your virtual machine via a terminal. To do this, we will use the [google cloud shell terminal](https://shell.cloud.google.com/?show=ide%2Cterminal&authuser=1&fromcloudshell=true&pli=1)
* Within the terminal, enter the command ``` ssh MELE@20.55.27.32 ```
  * This is how you connect to the VM. It's ssh, a space, then the username you set when creating the VM in Azure, a @ and then the public IP address found in Azure
![image](https://github.com/meglee67/flask_4_databases_mysql_vm/assets/123908362/e34538ca-d8c0-473f-8f00-6e1c124abcd8)

* Once you enter in the command, you will get a warning message. Do not fear, this message is just saying that your PC doesn't recognize the PC you're trying to connect to. Type in yes to continue connecting.
![image](https://github.com/meglee67/flask_4_databases_mysql_vm/assets/123908362/d6a7f151-1342-4c7a-b857-a85024f6d05e)

* Once you have typed in yes, you then need to re-enter the ssh command, and then enter the password you set when creating the Azure VM. For security, the password will not appear as you are typing it, so if an error occurs, retry this step, as you may have entered the password incorrectly.
* Now you are in the diffeent PC bc you can see the name turned into the name of your machine you made in Azure (here it is MELE@meganMYSQL)
![image](https://github.com/meglee67/flask_4_databases_mysql_vm/assets/123908362/7abe0ae5-bf91-4f9f-8e32-ebc59767b29a)

* Now before installing MySQL, you have to update your OS. To do this run the command ``` sudo apt-get update ```
* Then to install MySQL, run ``` sudo apt install mysql-client mysql-server ```
* You will then get a message asking you if you want to use the disk space to install this program. To confirm type in y. *This is why its important to pay attention to how much storage you set up when creating the VM in Azure*.
* To check that MySQl has been installed, run the command ``` mysql``. If access has been denied, that means its been properly installed.
* Then run the command ``` sudo mysql ``` Now you are in mysql.
![image](https://github.com/meglee67/flask_4_databases_mysql_vm/assets/123908362/c399ffed-6554-4630-9ec5-cd424b1e498f)

* Now you want to create a new user. To do this, run ``` create user 'megan'@'%' identified by 'megan2023'; ```
 * The name megan can be swapped out for anything you like and the identified by is basically the password for the user megan you created. The % means you can login from anywhere.
![image](https://github.com/meglee67/flask_4_databases_mysql_vm/assets/123908362/e5d639b6-dbaa-4667-a0ed-14487456941e)

* Now you want to associate this user you just created with a certain set of permissions. Right now there is no default permissions so the new user you created has access to nothing. As you can see in this photo, by running ``` select user from mysql.user; ```, you can see the users in the system installed on this VM.
![image](https://github.com/meglee67/flask_4_databases_mysql_vm/assets/123908362/8285f945-21f2-45fb-8d34-5a9d806a4639)

* To check that the user you just created has no permissions, you can run the command ``` select * from mysql.user \G ```. This will give you a nicely formatted list, showing you that the user has no permissions. Technically you can use the command ```select * from mysql.user ``` but then it shows everything in a mess of text, because your terminal isn't big enough to display all the columns. To ensure readability, use the command with \G.
![image](https://github.com/meglee67/flask_4_databases_mysql_vm/assets/123908362/55f6bfc0-90df-4f19-ae76-d96a91643e86)

* To grant the user access to everything, use the command ``` grant all privileges on *.* to 'megan'@'%' with grant option; ```
 * This will grant the user access to everything, even if other users don't want us to see it, and the with grant option means we as the user can give other people permissions now
![image](https://github.com/meglee67/flask_4_databases_mysql_vm/assets/123908362/bbe46cd5-e73f-43bb-96a7-0c38ca98c6ed)

* Then to check if you've been granted access, run ``` show grants for megan; ```
![image](https://github.com/meglee67/flask_4_databases_mysql_vm/assets/123908362/fb6e2918-8c56-4171-b749-f5c4442f0584)

* Now go back to your Azure VM dashboard, you need to add an inbound port rule. This will allow other people or other pieces of software to be able to directly connect to the MySQL instance that you installed on the virtual machine.
![image](https://github.com/meglee67/flask_4_databases_mysql_vm/assets/123908362/9cf6fb46-4f0e-4dac-85b5-4d6c9d0f0142)

* On the page for adding an inbound security rule the source port ranges will be a *. The service is MySQL, which will autopopulate the destination port ranges and protocol. Click the button to allow action, and name this AllowAnyMySQLInbound. The priority number  just changes what is priortiized in the rule order
![image](https://github.com/meglee67/flask_4_databases_mysql_vm/assets/123908362/1f97b51d-472d-4b2a-bdb9-a2c6a0450fb7)

* Now you should be able to see the new rule added. If you want to change the priority number to this new rule loads in first you can also do that. You can see in the second photo below, I change the priority of this new rule to 299 so it would load in first.
![image](https://github.com/meglee67/flask_4_databases_mysql_vm/assets/123908362/7ef8af85-8268-41c5-8d6c-95cac285bee9)
![image](https://github.com/meglee67/flask_4_databases_mysql_vm/assets/123908362/183f0b81-4762-41a8-bd79-ad3c83533031)

* Now you can almost connect this MySQL instance installed on your VM to MySQL Workbench, but before we move to MySQL Workbench, you need to change the bind address which is the external IP address associated with the VM.
* We need to change the permissions to 0.0.0.0 which will enable MySQL to be able to detect what IP address is assigned to the VM, and allow it to enable inbound connections, then restart the server enviornment before trying to connect.
* First you will need to leave the mysql enviornment and go back to being in the virtual machine use the command ctrl D or type \quit
![image](https://github.com/meglee67/flask_4_databases_mysql_vm/assets/123908362/51fa7036-ecbe-4e53-92cd-00e5fac2e021)

* Now use the command ``` sudo nano /etc/mysql/mysql.conf.d/mysqld.cnf ```
![image](https://github.com/meglee67/flask_4_databases_mysql_vm/assets/123908362/ae09c596-f1f2-4189-a830-4c664169ba17)

* Now change the bind address to 0.0.0.0  If you can't find it, within nano doing ```ctrl+W``` will bring up a search bar if you need to find something
 * If when you try to connect via MySQl Workbench, it doesn't let you, come back here and also change the mysqlx-bind-address to 0.0.0.0 but in my case only changing the bind address worked fine.
![image](https://github.com/meglee67/flask_4_databases_mysql_vm/assets/123908362/8a0a0e7a-33db-47a2-8e91-fe1e27e14582)

* Now do ```ctrl+O``` to save and hit enter and to exit by doing ```ctrl+x```
* Now you need to do the MySQL restart ```/etc/init.d/mysql restart ```
 * It will ask for a password, this is the password for your OS that you set up in Azure
![image](https://github.com/meglee67/flask_4_databases_mysql_vm/assets/123908362/9094a2f2-df9b-474f-82ec-17fca6596072)

### Doing the same within GCP
* If you want to do this with your GCP VM, the process is similar, but instead of using the google cloud shell terminal, you can login via a web browser. Find this option on the VM instances page and click the drop-down button next to SSH, and then click Open in new browser window.
![image](https://github.com/meglee67/flask_4_databases_mysql_vm/assets/123908362/acc6ef37-63ef-42b0-b400-7ce2f8d6174a)

* Then you end up doing the same steps you did in the cloud shell but you do it in gcp where the window opened.
![image](https://github.com/meglee67/flask_4_databases_mysql_vm/assets/123908362/49f548ed-838f-42b0-af28-9580d9bd44d1)

### Connecting to MySQL Workbench: Azure
* Within your MySQL Workbench, click on the tiny plus sign.
![image](https://github.com/meglee67/mysql_cloudmanaged_databases/assets/123908362/15866b9a-d6b9-4d75-934e-705d04f55d76)

* Enter the IP of the VM (find the IP on Azure dashboard)
* The username is the mySQL username you created within the terminal on google cloud shell (here it's megan)
![image](https://github.com/meglee67/flask_4_databases_mysql_vm/assets/123908362/a70ed609-3cc7-484e-b856-00895cfaf342)

* It will ask for a password, this is the password for your OS that you set up in Azure
![image](https://github.com/meglee67/flask_4_databases_mysql_vm/assets/123908362/a4e44024-57b7-4aa5-b620-78c3e435a116)

* Now you have successfully connected to MySQL Workbench
  
## Integrate with Flask

<br>

## **Week 4 Homework Assignment: MySQL on VMs with Azure and GCP**

### **Objective**:
Manually setting up and running a database on a cloud VM. You'll get hands-on experience setting up a MySQL instance on a VM, (optional but recommended: integrating it with a Flask app). 

### **Instructions**:

#### **1. MySQL Setup on Azure/GCP VM**:
- Spin up a VM on Azure (and/or GCP). I suggest you do both for practice. 
- Install MySQL on this VM. Ensure it's correctly configured and secured.
- Create a simple database with at least two tables. Populate the tables with sample data.
  - Document the schema you've chosen and why.
  - I suggest trying to have two tables where there is a foreign key relationship between them.

#### **2. Integrate with Flask**:
- Modify the past Flask application (from previous assignments), or create a new one, to connect to this new MySQL instance.
- Use SQLAlchemy to facilitate the connection between the Flask application and MySQL.
- Then display the data from the MySQL database on the Flask application.
- Take screen shots showing your working application. 

#### **3. [OPTIONAL] Deploying the Flask Application to Azure/GCP**:
- Deploy the Flask application to Azure (and/or GCP).
- Ensure the application is working correctly.
- Take screenshots showing your working application.

#### **4. Documenting Code Errors**:
- Should you encounter errors or challenges that prevent you from completing any section, it's essential to document them.
  - Take screenshots or create screencasts/recordings showcasing the issue.
  - Describe the steps you took leading to the error and any troubleshooting or modifications you attempted.
  - Clearly specify what you believe might be the root cause, even if you're unsure. It helps in understanding your thought process.
  - Remember, encountering and resolving errors is an integral part of the learning process. Your diligence in documenting them is crucial.

### **Submission**:
- Create a new GitHub repository named `flask_4_databases_mysql_vm` in your GitHub account.
- Feel free to re-use parts of your code from prior assignments where necessary 
- Prepare your GitHub repository:
  - Your Python scripts and Jupyter notebooks detailing your MySQL setup
  - Screenshots or videos showcasing the working application, and any documented errors.
  - A detailed README.md file, outlining:
    - The VM and MySQL setup process.
    - The rationale behind your database schema.
    - Steps and challenges from the database migration process.
    - Documented code errors and your troubleshooting attempts.
    - Any other relevant documentation or instructions.
- Share the link to your repository as your assignment submission.
- Ensure your repository is public so that it's accessible for review.

**Tip**: Security is paramount! Make sure your MySQL instance is properly secured, and never expose sensitive credentials or data. You should be using a .env file that stores your credentials *and is not committed to GitHub*.
