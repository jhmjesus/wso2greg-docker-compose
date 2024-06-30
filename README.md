# wso2greg-docker-compose
WSO2 Governance Registry docker compose environment.

On this docker compose there are available and configured these services:
Service | Description
 --- | ---
```wso2greg``` | WSO2 Governance Registry high avalilability
```openldap``` | OpenLDAP with fake users and roles
```nginx``` | NGInx loadbalance do scale wso2greg container instances
```mysql``` | MySQL database with initialization scrips
```oracle``` | Oracle XE database with initialization scrips
```postgres``` | PostgreSQL database with initialization scrips

# WSO2 Governance Registry

# Openldap
Openldap service create some users and groups to enable permission configuration tests. All users have the same password ```pass```.

It is important to know that the **access permission configurations are not enabled by Docker Image**, they need to be maded in WSO2 Governance Registry administration web application at ```https://<WSO2_HOSTNAME>:9443/carbon```.

The users available are:

Full name | Username | LDAP dn | Groups
 --- | --- | --- | ---
Joao Silva | ```joao``` | ```uid=joao,ou=users,dc=greg,dc=joy,dc=net``` | readers, stores and publishers
Jose Maria | ```jose``` | ```uid=jose,ou=users,dc=greg,dc=joy,dc=net``` | readers and stores
Maria Silva | ```maria``` | ```uid=maria,ou=users,dc=greg,dc=joy,dc=net``` | readers and stores
Luis Silva | ```luis``` | ```uid=luis,ou=users,dc=greg,dc=joy,dc=net``` | readers, stores and publishers
Admin | ```admin``` | ```uid=admin,ou=users,dc=greg,dc=joy,dc=net``` | readers, stores, publishers and admin

The groups available are:

Full name | Group name | LDAP dn | Group members
 --- | --- | --- | ---
 readers | readers | cn=readers,ou=groups,dc=greg,dc=joy,dc=net | joao, jose, maria, luis and admin
 stores | stores | cn=stores,ou=groups,dc=greg,dc=joy,dc=net | joao, jose, maria, luis and admin
 publishers | publishers | cn=publishers,ou=groups,dc=greg,dc=joy,dc=net | joao, luis and admin
 admin | admin | cn=admin,ou=groups,dc=greg,dc=joy,dc=net | admin

# nginx

# Database

Database services were configured in each Docker container, and the initialization scripts for WSO2 product version 5.4.0 were copied to the initdb.d folder.

## PostgreSql

In the WSO2 Governance Registry startup scripts for the postgres database, it was necessary to change the type ```ABSTIME``` to ```TIMESTAMP``` from ```05-bps.sql``` script due to the throwing of the error ```ERROR:  type "abstime" does not exist```. I found the post ```FIX ABSTIME BPS_DB SQL script``` at https://github.com/wso2/carbon-business-process/pull/640.

## Oracle

In the WSO2 Governance Registry startup scripts for the oracle database, it was necessary to create a shell script running the sqlplus command individually calling each script, with the ```.sql``` extension renamed to ```.sqlx```, with the user ```wso2carbon``` due to the throwing of the error ```ORA-04089: cannot create triggers on objects owned by SYS```. I used the example of "Initialization scripts" chapter described in Docker image documentation at https://hub.docker.com/r/gvenzl/oracle-xe