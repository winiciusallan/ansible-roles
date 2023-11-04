# Ansible Roles

Repository to keep and track some roles i made for practice Ansible.

## What is Roles
Roles are a set of playbooks organized in a well defined directory structure. They let you manage vars, tasks, handlers and other Ansible artifacts.
Is easy to reuse and share the playbooks with others if necessary.

## Directory structure
Run
``` ansible-galaxy init path/to/role/foo --offline ``` to create role using [Ansible Galaxy](https://docs.ansible.com/ansible/latest/cli/ansible-galaxy.html)

``` text
foo
├── defaults
│   └── main.yml
├── files
├── handlers
│   └── main.yml
├── meta
│   └── main.yml
├── tasks
│   └── main.yml
├── templates
├── tests
│   ├── inventory
│   └── test.yml
└── vars
    └── main.yml
```
- defaults/main.yml - Defaults variables for the role. It has lowest priority than other and can be easily override.
- files - Contain files which can be deployed or transfer to host(s) by role.
- handlers/main.yml - Tasks which only run when notified. They can be used by this role or outside by any other.
- meta/main.yml - Used to define some informations about this role (author, version, dependencies, license, ...). 
- tasks/main.yml - The main list of tasks that role will perform.
- templates - Templates which can be deployed by role.
- vars/main.yml - Others variables for role, has higher priority than defaults.

You can use roles with this options in a play:
``` yaml
---
- hosts: webservers
  roles:
    - common
    - webservers
```

---
### Roles of this repository
There will be some roles which make some servers configuration (as [Terraria Server](./terraria)) or setup a computer that just came out of the oven, installing the desired packages and configuring
the main enviroment (based on my own usage).
\
\
The main goal of this repository is to put on practice what i've been learning about Ansible and some others Linux tools.

---
### Referencies
[Ansible Docs](https://docs.ansible.com/) <br>
[Ansible Roles Explained with Examples](https://www.devopsschool.com/tutorial/ansible/ansible-roles-explained-with-examples.html#:~:text=To%20create%20a%20Ansible%20roles,each%20directories%20and%20files%20manually.&text=where%2C%20ansible%2Dglaxy%20is%20the,the%20roles%20using%20the%20templates.)

