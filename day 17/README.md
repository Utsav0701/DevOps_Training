### **Day 17**

### **Project 01**

### **Deploy a Database Server with Backup Automation**

### **Problem Statement**

**Objective**: Automate the deployment, configuration, and backup of a
MySQL database server on an Ubuntu instance using Ansible.

**Requirements**:

1.  **AWS Ubuntu Instance**: You have an Ubuntu server instance running on AWS.

2.  **Database Server Deployment**: Deploy and configure PostgreSQL on the Ubuntu instance.

3.  **Database Initialization**: Create a database and a user with specific permissions.

4.  **Backup Automation**: Set up a cron job for regular database backups and ensure that backups are stored in a specified directory.

5.  **Configuration Management**: Use Ansible to handle the deployment and configuration, including managing sensitive data like database passwords.

### **Deliverables**

1.  **Ansible Inventory File**

    + **Filename**:inventory.ini
    ```ini
    [web]
    green ansible_host=3.***.*.** ansible_user=ubuntu ansible_ssh_private_key_file=/home/einfochips/.ssh/ansible-worker.pem
    ```
    
    + Ping the ip
    ![](.//media/image1.png)


2.  **Ansible Playbook**

    +   **Filename**: deploy\_database.yml


    ```yml
    ---
    - hosts: db_server
    become: yes
    vars:
        mysql_root_password: "utsav1234"
        mysql_database: "webapp_db"
        mysql_user: "webapp_user"
        mysql_password: "utsav1234"
    tasks:
        - name: update cache as apt-get update
        apt:
            update_cache: yes

        - name: install mysql and its dependencies
        apt:
            name: ['mysql-server', 'mysql-client', 'python3-mysqldb', 'libmysqlclient-dev']
            state: present

        - name: enable the service
        service:
            name: mysql
            state: started
            enabled: yes

        - name: Create MySQL database
        mysql_db:
            name: "{{ mysql_database }}"
            state: present

        - name: Create MySQL user
        mysql_user:
            name: "{{ mysql_user }}"
            password: "{{ mysql_password }}"
            priv: "{{ mysql_database }}.*:ALL"
            state: present

    - hosts: app_server
    become: yes
    vars:
        app_repo_url: "/home/einfochips/Desktop/einfochips/DevOps_Training/day 17/Task2/files/index.html"
        app_directory: "/var/www/html/"
        db_host: "{{ hostvars['db_server']['ansible_host'] }}"
        db_name: "webapp_db"
        db_user: "webapp_user"
        db_password: "secure_user_password"
    tasks:
        - name: Update apt cache
        apt:
            update_cache: yes

        - name: Install Apache2
        apt:
            name: apache2
            state: present

        - name: Install PHP and extensions
        apt:
            name:
            - php
            - php-mysql
            - libapache2-mod-php
            state: present

        - name: Ensure Apache is started and enabled
        service:
            name: apache2
            state: started
            enabled: yes

        - name: Copy Web Application
        ansible.builtin.copy:
            src: "{{ app_repo_url }}"
            dest: "{{ app_directory }}"

        - name: Deploy Apache configuration file
        template:
            src: "/home/einfochips/Desktop/einfochips/DevOps_Training/day 17/Task2/templates/apache_server.conf.j2"
            dest: "/etc/apache2/apache_server.conf"
            owner: root
            group: root
            mode: 0644
        notify:
            - Restart Apache

        - name: Ensure appropriate permissions for application directory
        file:
            path: "{{ app_directory }}"
            owner: www-data
            group: www-data
            state: directory
            recurse: yes
    handlers:
        - name: Restart Apache
        service:
            name: apache2
            state: restarted
    ```

3.  **Jinja2 Template**

    -   **Filename**: templates/sql\_hba.conf.j2

    ```j2
        {% for setting, value mysql_custom_settings.items() %}
        {{ setting }} = {{ value }}
        {% endfor %}
    ```

4.  **Backup Script**

    -   **Filename**: scripts/backup.sh.

    ```sh
    #!/bin/bash

    # Database credentials
    USER="utsav"
    PASSWORD="utsav1234"
    HOST="localhost"
    DB_NAME="my_database"

    # Backup directory
    BACKUP_PATH='/var/backups/mysql/'
    DATE=$(date +%F)

    # Set default file permissions
    umask 177

    # Create backup directory if it does not exist
    mkdir -p "$BACKUP_PATH"

    # Dump database into SQL file
    mysqldump --user="$USER" --password="$PASSWORD" --host="$HOST" "$DB_NAME" > "$BACKUP_PATH/$DB_NAME-$DATE.sql"

    # Remove backups older than 7 days
    find "$BACKUP_PATH" -type f -name "*.sql" -mtime +7 -exec rm {} \;    
    ```

Output :

![](.//media/image3.png)

File Created:

### ![](.//media/image4.png)

### 

### 

### 

### **.**

### **Project 02**

**Objective**: Automate the setup of a multi-tier web application stack
with separate database and application servers using Ansible.

### **Problem Statement**

**Objective**: Automate the deployment and configuration of a multi-tier
web application stack consisting of:

1.  **Database Server**: Set up a PostgreSQL database server on one Ubuntu instance.

2.  **Application Server**: Set up a web server (e.g., Apache or Nginx) on another Ubuntu instance to host a web application.

3.  **Application Deployment**: Ensure the web application is deployed on the application server and is configured to connect to the PostgreSQL database on the database server.

4.  **Configuration Management**: Use Ansible to automate the configuration of both servers, including the initialization of the database and the deployment of the web application.

### **Deliverables**

1.  **Ansible Inventory File**

    -   **Filename**: inventory.ini

    ```ini
    [db_server]
    green ansible_host=3.**.**.* ansible_user=ubuntu ansible_ssh_private_key_file=/home/einfochips/.ssh/ansible-worker.pem

    [app_server]
    green ansible_host=3.**.**.* ansible_user=ubuntu ansible_ssh_private_key_file=/home/einfochips/.ssh/ansible-worker.pem
    ```
    
2.  **Ansible Playbook**

    -   **Filename**: deploy\_multitier\_stack.yml
    ```yml
    ---
    - hosts: db_server
    become: yes
    vars:
        mysql_root_password: "utsav1234"
        mysql_database: "webapp_db"
        mysql_user: "webapp_user"
        mysql_password: "utsav1234"
    tasks:
        - name: update cache as apt-get update
        apt:
            update_cache: yes

        - name: install mysql and its dependencies
        apt:
            name: ['mysql-server', 'mysql-client', 'python3-mysqldb', 'libmysqlclient-dev']
            state: present

        - name: enable the service
        service:
            name: mysql
            state: started
            enabled: yes

        - name: Create MySQL database
        mysql_db:
            name: "{{ mysql_database }}"
            state: present

        - name: Create MySQL user
        mysql_user:
            name: "{{ mysql_user }}"
            password: "{{ mysql_password }}"
            priv: "{{ mysql_database }}.*:ALL"
            state: present

    - hosts: app_server
    become: yes
    vars:
        app_repo_url: "/home/einfochips/Desktop/einfochips/DevOps_Training/day 17/Task2/files/index.html"
        app_directory: "/var/www/html/"
        db_host: "{{ hostvars['db_server']['ansible_host'] }}"
        db_name: "webapp_db"
        db_user: "webapp_user"
        db_password: "secure_user_password"
    tasks:
        - name: Update apt cache
        apt:
            update_cache: yes

        - name: Install Apache2
        apt:
            name: apache2
            state: present

        - name: Install PHP and extensions
        apt:
            name:
            - php
            - php-mysql
            - libapache2-mod-php
            state: present

        - name: Ensure Apache is started and enabled
        service:
            name: apache2
            state: started
            enabled: yes

        - name: Copy Web Application
        ansible.builtin.copy:
            src: "{{ app_repo_url }}"
            dest: "{{ app_directory }}"

        - name: Deploy Apache configuration file
        template:
            src: "/home/einfochips/Desktop/einfochips/DevOps_Training/day 17/Task2/templates/apache_server.conf.j2"
            dest: "/etc/apache2/apache_server.conf"
            owner: root
            group: root
            mode: 0644
        notify:
            - Restart Apache

        - name: Ensure appropriate permissions for application directory
        file:
            path: "{{ app_directory }}"
            owner: www-data
            group: www-data
            state: directory
            recurse: yes
    handlers:
        - name: Restart Apache
        service:
            name: apache2
            state: restarted
    ```

3.  **Jinja2 Template**

    -   **Filename**: templates/app\_config.php.j2

4.  **Application Files**

    -   **Filename**: files/index.html 

       ```html
        <!DOCTYPE html>
        <html>
        <head>
            <title>My Web Application</title>
        </head>
        <body>
            <center>
                <h1>Project 2 Web App</h1>
                <p>Day 17 Task 2</p>
            </center>
        </body>
        </html>
       ```
Output:

![](.//media/image5.png)

![](.//media/image6.png)

![](.//media/image7.png)
