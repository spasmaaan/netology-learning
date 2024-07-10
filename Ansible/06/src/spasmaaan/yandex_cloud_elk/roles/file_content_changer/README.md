Role Name
=========

Vector role

Role Variables
--------------

path - Путь до файла.
content - Контент файла, который будет записан в него. 

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
        - role: file_content_changer
          vars: 
            path: "~/test.txt"
            content: "My first content!"

License
-------

MIT

Author Information
------------------

Spasman
