#API Discovery
#Obtener informacion del contexto actual del cluster
kubectl config get-contexts


#Si no estas dentro del contexto apropiado cambiar de contexto
kubectl config use-context kubernetes-admin@kubernetes


#Obtener informacion del cluster
kubectl cluster-info


#Listar los recursos disponibles en el cluster
kubectl api-resources | more



#Inspeccionar la configuracion de los pods
kubectl explain pods | more


#Inspeccionar la configuracion de los pods y su informacion de despliegue
kubectl explain pod.spec | more
kubectl explain pod.spec.containers | more


#Desplegar el arhivo manifiesto del pod apra visualizar su configuracion
kubectl apply -f pod.yaml


#Listar los pods desplegados 
kubectl get pods


#Eliminar el pod configurado previamente
kubectl delete pod hello-world




#El comando kubectl dry-run sirve para validacion del archivo manifiesto previo a su aplicacion
#El api server validara la informacion provista y a traves del dry-run se "ejecuta" todo el proceso de despliegue
#pero sin desplegar el recurso

kubectl apply -f deployment.yaml --dry-run=server


#Validamos que no se haya desplegado nada
kubectl get deployments


#Usamos kubectl dry-run para la validación del lado del cliente de un  archivo manifiesto ...
kubectl apply -f deployment.yaml --dry-run=client


#Intentemos hacer el despliegue y la validacion de un deployment con errores
kubectl apply -f deployment-error.yaml --dry-run=client


#Podemos generar un archivo de ejemplo a traves del comando dry-run
kubectl create deployment nginx --image=nginx --dry-run=client


#Podemos combinar el comando dry-run con el output para generar un archivo de despliegue
kubectl create deployment nginx --image=nginx --dry-run=client -o yaml | more


#Podemos generar archivos de cualquier tipo, por ejemplo un pod
kubectl run pod nginx-pod --image=nginx --dry-run=client -o yaml | more


#Y escribirlo en un archivo externo 
kubectl create deployment nginx --image=nginx --dry-run=client -o yaml > deployment-generated.yaml
more deployment-generated.yaml


