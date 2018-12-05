oc delete po/winpacman
sleep 30
oc adm new-project winpacman --node-selector=''
oc project winpacman
oc create -f winpacman2019.yaml
oc expose po/winpacman --port=8080
oc expose svc/winpacman 
