#!/bin/bash

#sqlplus -s wso2carbon/wso2carbon@//localhost/WSO2CARBON_DB @/docker-entrypoint-initdb.d/00-grants.sqlx
sqlplus -s wso2carbon/wso2carbon@//localhost/WSO2CARBON_DB @/docker-entrypoint-initdb.d/01-greg.sqlx
sqlplus -s wso2carbon/wso2carbon@//localhost/WSO2CARBON_DB @/docker-entrypoint-initdb.d/02-metrics.sqlx
sqlplus -s wso2carbon/wso2carbon@//localhost/WSO2CARBON_DB @/docker-entrypoint-initdb.d/03-identity.sqlx
sqlplus -s wso2carbon/wso2carbon@//localhost/WSO2CARBON_DB @/docker-entrypoint-initdb.d/04-social.sqlx
sqlplus -s wso2carbon/wso2carbon@//localhost/WSO2CARBON_DB @/docker-entrypoint-initdb.d/05-bps.sqlx
