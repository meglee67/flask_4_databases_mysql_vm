# flask_4_databases_mysql_vm
* HHA 504 HW 4B
* Due 10/1
* OG Instructions below

## MySQL Setup on Azure/GCP VM
### Azure Virtual Machine Setup

### Google Cloud Platform Virtual Machine Setup
* Login on the [Cloud Console](https://console.cloud.google.com/) and click on the button new project. Name it something relevant to the task at hand.
![image](https://github.com/meglee67/mysql_cloudmanaged_databases/assets/123908362/f9dcf680-5ad7-4ceb-9b2a-834f7c871f6f)
* Then when on the page to create a new project, make sure to designate the location of the new project as AHI - GCP.
![image](https://github.com/meglee67/mysql_cloudmanaged_databases/assets/123908362/cad03e37-6540-4a02-b80e-27ef4b204a35)
* Once you have created a new project, make sure you are clicked into the right project. Go to the dashboard and check.
* Then click on the navigation menu in the top left and find the tab that is called "Compute Engine" and then on the pop-out menu, hit "Vm Instances"

![image](https://github.com/meglee67/flask_4_databases_mysql_vm/assets/123908362/a07af2ca-f152-47c8-8f21-56c3cd105798)
* 

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
