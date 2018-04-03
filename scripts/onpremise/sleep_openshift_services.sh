#!/bin/bash

#sleep registry
echo Sleeping registry...
oc patch dc docker-registry -n default -p '{"spec":{"replicas":0}}'

#sleep metrics
echo Sleeping metrics...
oc patch rc hawkular-cassandra-1 -n openshift-infra -p '{"spec":{"replicas":0}}'

#sleep logging
echo Sleeping logging...
oc patch dc $(oc get dc -n logging | grep logging-es | awk '{print $1}') -n logging -p '{"spec":{"replicas":0}}'

#sleep ansible service broker
echo Sleeping asb...
oc patch dc asb -n openshift-ansible-service-broker -p '{"spec":{"replicas":0}}'
oc patch dc asb-etcd -n openshift-ansible-service-broker -p '{"spec":{"replicas":0}}'

#sleep prometheus
echo Sleeping prometheus...
oc patch statefulset prometheus -n openshift-metrics -p '{"spec":{"replicas":0}}'

#sleep jenkins
echo Sleeping jenkins...
oc patch dc jenkins -n devops-tools -p '{"spec":{"replicas":0}}'

#sleep nexus
echo Sleeping nexus...
oc patch dc nexus -n devops-tools -p '{"spec":{"replicas":0}}'

#sleep gogs
echo Sleeping gogs...
oc patch dc gogs -n devops-tools -p '{"spec":{"replicas":0}}'
oc patch dc gogs-postgresql -n devops-tools -p '{"spec":{"replicas":0}}'

#sleep heketi
echo Sleeeping heketi....
oc patch dc heketi-cns -n cns -p '{"spec":{"replicas":0}}'
