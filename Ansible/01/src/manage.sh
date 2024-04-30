#!/bin/bash

case $1 in
    up)
        echo "Enter password: "
        read ansible_vault_password

        echo "=================="
        echo "  Starting hosts  "
        echo "------------------"

        docker compose up -d
        
        echo "=================="
        echo "  Hosts started   "
        echo "------------------"

        echo ${ansible_vault_password} | ansible-playbook site.yml -i inventory/prod.yml --vault-password-file=/bin/cat
        
        
        echo "=================="
        echo "  Hosts prepared  "
        echo "------------------"
    ;;

    down)
        echo "=================="
        echo "  Stopping hosts  "
        echo "------------------"

        docker compose down
        
        echo "=================="
        echo "  Hosts stopped   "
        echo "------------------"
    ;;

    *)
        echo "=================="
        echo "     Skipped      "
        echo "------------------"
    ;;
esac




