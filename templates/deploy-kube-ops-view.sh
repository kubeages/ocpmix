oc create sa kube-ops-view
oc adm policy add-scc-to-user anyuid -z kube-ops-view
oc adm policy add-cluster-role-to-user cluster-admin system:serviceaccount:ops-tools:kube-ops-view
oc apply -f kube-ops-view.yaml
oc expose svc kube-ops-view
