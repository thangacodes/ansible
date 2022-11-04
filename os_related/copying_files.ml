---
- hosts: localhost
  become: yes
  tasks:
  - name: "copying a file"
    ansible.builtin.copy:
      src: /home/ec2-user/file-copying.sh
      dest: /tmp/
      owner: ec2-user
      group: ec2-user
      mode: 0644
    register: Copying_files
  - debug: msg="{{ Copying_files }}"
