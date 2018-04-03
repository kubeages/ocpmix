oc adm new-project openshift-metrics-node-exporter --node-selector='region=primary'
oc create -f node-exporter.yaml -n openshift-metrics-node-exporter
oc adm policy add-scc-to-user -z prometheus-node-exporter -n openshift-metrics-node-exporter hostaccess
oc create -f alert-manager-service.yaml -n openshift-metrics
oc expose service alertmanager -n openshift-metrics
