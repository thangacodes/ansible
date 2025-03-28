```bash
In Ansible, roles are a way to organize playbooks and reuse code by breaking them into smaller, reusable components.

Command to create an ansible roles:

ansible-galaxy init {{ justtest }} --offline

Explanation:

ansible-galaxy: The command-line tool used to interact with Ansible Galaxy
init: Initializes a new Ansible role
justtest: The name of the role to be created (this can be any name you choose)
--offline: This flag prevents the command from connecting to the internet to download any dependencies. 
It will generate the basic skeleton of the role without attempting to reach out to Ansible Galaxy

Role Skeletion:

justtest/
├── defaults/
│   └── main.yml
├── files/
├── handlers/
│   └── main.yml
├── meta/
│   └── main.yml
├── tasks/
│   └── main.yml
├── templates/
├── vars/
│   └── main.yml
└── README.md

Explanation of the role Skeleton:

Each folder and file is part of the basic structure for an Ansible role:
defaults/main.yml: Default variables for the role.
files/: Directory for files to be copied to the target hosts.
handlers/main.yml: Defines any handlers for the role.
meta/main.yml: Metadata, including dependencies.
tasks/main.yml: Main tasks for the role.
templates/: Directory for Jinja2 templates.
vars/main.yml: Variables specific to the role.
README.md: A README file explaining what the role does.