#!/bin/sh
ssh-agent
ssh -T git@github.com
ssh-add ~/.ssh/id_rsa
