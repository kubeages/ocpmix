#!/bin/bash
#wakeup heketi
oc patch dc heketi-cns -n cns -p '{"spec":{"replicas":1}}'
echo Waiting for heketi pod wakeup...
while [[ $(oc get pods -n cns | grep heketi | awk '{print $2}') != '1/1' ]]
do
sleep 5
done
echo Heketi pod has waken up, activating all the services

#wakeup registry
echo Waking up registry...
oc patch dc docker-registry -n default -p '{"spec":{"replicas":1}}'

#wakeup metrics
echo Waking up metrics...
oc patch rc hawkular-cassandra-1 -n openshift-infra -p '{"spec":{"replicas":1}}'

#wakeup logging
echo Waking up logging...
oc patch dc $(oc get dc -n logging | grep logging-es | awk '{print $1}') -n logging -p '{"spec":{"replicas":1}}'

#wakeup asb
echo Waking up asb...
oc patch dc asb-etcd -n openshift-ansible-service-broker -p '{"spec":{"replicas":1}}'
echo Waiting for asb-etcd pod wakeup...
while [[ $(oc get pods -n openshift-ansible-service-broker | grep asb-etcd | awk '{print $2}') != '1/1' ]]
do
sleep 5
done
echo asb-etcd pod has waken up, activating asb service...
oc patch dc asb -n openshift-ansible-service-broker -p '{"spec":{"replicas":1}}'

#wakeup prometheus
echo Waking up prometheus...
oc patch statefulset prometheus -n openshift-metrics -p '{"spec":{"replicas":1}}'

#wakeup jenkins
echo Waking up jenkins...
oc patch dc jenkins -n devops-tools -p '{"spec":{"replicas":1}}'

#wakeup nexus
echo Waking up nexus...
oc patch dc nexus -n devops-tools -p '{"spec":{"replicas":1}}'

#wakeup gogs
echo Waking up gogs...
oc patch dc gogs -n devops-tools -p '{"spec":{"replicas":1}}'
oc patch dc gogs-postgresql -n devops-tools -p '{"spec":{"replicas":1}}'


