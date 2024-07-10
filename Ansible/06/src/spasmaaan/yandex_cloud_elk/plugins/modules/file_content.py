#!/usr/bin/python

# Copyright: (c) 2018, Terry Jones <terry.jones@example.org>
# GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/licenses/gpl-3.0.txt)
from __future__ import (absolute_import, division, print_function)
__metaclass__ = type
import os.path

DOCUMENTATION = r'''
---
module: file_content

short_description: This is my test module

# If this is part of a collection, you need to use semantic versioning,
# i.e. the version is of the form "2.5.0" and not "2.4".
version_added: "1.0.0"

description: This is my longer description explaining my test module.

options:
    path:
        description: Path to target file location.
        required: true
        type: str
    content:
        description: Content for setted into a file.
        required: false
        type: str
# Specify this value according to your collection
# in format of namespace.collection.doc_fragment_name
extends_documentation_fragment:
    - spasmaaan.yandex_cloud_elk.file_content_doc

author:
    - Evgeniy Litvinov (@spasmaaan)
'''

EXAMPLES = r'''
# Pass in a path
- name: Path to target file
  spasmaaan.yandex_cloud_elk.file_content:
    path: text.txt

# pass in a path and have content
- name: Test with a message and changed output
  spasmaaan.yandex_cloud_elk.file_content:
    path: text.txt
    content: Text for a file.

# fail the module
- name: Test failure of the module
  spasmaaan.yandex_cloud_elk.file_content:
    content: any text
'''

RETURN = r'''
# These are examples of possible return values, and in general should use other names for return values.
changed:
    description: Whether the specified content text was added to the target file.
    type: bool
    returned: always
    sample: True
'''

from ansible.module_utils.basic import AnsibleModule


def run_module():
    module_args = dict(
        path=dict(type='str', required=True),
        content=dict(type='str', required=False, default='')
    )

    result = dict(
        changed=False
    )

    module = AnsibleModule(
        argument_spec=module_args,
        supports_check_mode=True
    )

    if module.check_mode:
        module.exit_json(**result)

    target_path = module.params['path']
    target_content = module.params['content']
      
    if not os.path.isfile(target_path):
        open(target_path, 'w').close()
        result['changed'] = True

    current_target_content = ""
    try:
        with open(target_path, 'r') as target_reader:
            current_target_content = target_reader.read()
    except:
        module.fail_json(msg='Error reading content from target file', **result)
    
    if current_target_content != target_content:
        try:
            with open(target_path, 'w') as target_file:
                target_file.write(target_content)
            result['changed'] = True
        except:
            module.fail_json(msg='Error writing content into target file', **result)

    module.exit_json(**result)


def main():
    run_module()


if __name__ == '__main__':
    main()
