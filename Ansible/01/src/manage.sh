#!/bin/bash

case $1 in
    up)
        echo "Enter password: "
        read -s ansible_vault_password

        echo ""
        echo "=================="
        echo "  Starting hosts  "
        echo "------------------"
        echo ""

        docker compose up -d
        
        echo ""
        echo "=================="
        echo "  Hosts started   "
        echo "------------------"
        echo ""

        echo ${ansible_vault_password} | ansible-playbook playbook/site.yml -i playbook/inventory/prod.yml --vault-password-file=/bin/cat
        
        echo ""
        echo "=================="
        echo "  Hosts prepared  "
        echo "------------------"
    ;;

    down)
        echo "=================="
        echo "  Stopping hosts  "
        echo "------------------"
        echo ""

        docker compose down
        
        echo ""
        echo "=================="
        echo "  Hosts stopped   "
        echo "------------------"
        echo ""
    ;;

    *)
        echo ""
        echo "=================="
        echo "     Skipped      "
        echo "------------------"
    ;;
esac




