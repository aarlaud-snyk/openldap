#!/bin/bash -e
docker run --name ldap-service -p 389:389 --hostname ldap-service --detach osixia/openldap:1.1.8
docker run --name phpldapadmin-service -p 443:443 --hostname phpldapadmin-service --link ldap-service:ldap-host --env PHPLDAPADMIN_LDAP_HOSTS=ldap-host --detach osixia/phpldapadmin:0.7.1

PHPLDAP_IP=$(docker inspect -f "{{ .NetworkSettings.IPAddress }}" phpldapadmin-service)

echo "Go to: https://$PHPLDAP_IP or https://localhost if running this on your machine"
echo "Login DN: cn=admin,dc=example,dc=org"
echo "Password: admin"
echo "Log into phpLDAPAdmin and create a new user for yourself !"
