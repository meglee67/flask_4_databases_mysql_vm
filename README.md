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
