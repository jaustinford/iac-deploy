#!/usr/bin/bash

# <UDF name="iac_user_name" label="IAC User Name" />
# <UDF name="iac_user_id" label="IAC User ID" />
# <UDF name="iac_user_authorized_key" label="IAC User Authorized Key "/>

exec > /var/log/stackscript.log 2>&1

useradd \
    --home-dir /home/${IAC_USER_NAME} \
    --create-home \
    --uid ${IAC_USER_ID} \
    --shell /usr/bin/bash \
    ${IAC_USER_NAME}

echo "${IAC_USER_NAME}  ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/lab_sudoers

mkdir /home/${IAC_USER_NAME}/.ssh
touch /home/${IAC_USER_NAME}/.ssh/authorized_keys

chmod 700 /home/${IAC_USER_NAME}/.ssh
chmod 600 /home/${IAC_USER_NAME}/.ssh/authorized_keys

chown -R ${IAC_USER_NAME}:${IAC_USER_NAME} /home/${IAC_USER_NAME}/.ssh

echo "${IAC_USER_AUTHORIZED_KEY}" > /home/${IAC_USER_NAME}/.ssh/authorized_keys
