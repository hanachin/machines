#!/bin/sh
eval `ssh-agent`
ssh -T git@github.com
