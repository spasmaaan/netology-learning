#!/bin/bash

case $1 in
    up)
        echo -n "Enter password: "
        read ansible_vault_password

        echo -n "=================="
        echo -n "  Starting hosts  "
        echo -n "__________________"

        docker compose up -d
        
        echo -n "=================="
        echo -n "  Hosts started   "
        echo -n "__________________"

        echo ${ansible_vault_password} | ansible-playbook site.yml -i inventory/prod.yml --vault-password-file=/bin/cat
        
        
        echo -n "=================="
        echo -n "  Hosts prepared  "
        echo -n "__________________"
    ;;

    down)
        echo -n "=================="
        echo -n "  Stopping hosts  "
        echo -n "__________________"

        docker compose down
        
        echo -n "=================="
        echo -n "  Hosts stopped   "
        echo -n "__________________"
    ;;

    *)
        echo -n ""
    ;;
esac




