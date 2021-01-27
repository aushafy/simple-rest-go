#!/bin/bash

if [ $BRANCH_NAME=main ]; 
    then export CLUSTER=production-cluster
elif [ $BRANCH_NAME=dev ];
    then export CLUSTER=development-cluster
fi