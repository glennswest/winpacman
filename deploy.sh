oc delete po/winpacman
sleep 30
oc adm new-project winpacman --node-selector=''
oc create -f winpacman.yaml
oc expose po/winpacman
oc expose svc/winpacman --hostname=winpacman.app.openshift.ncc9.com
