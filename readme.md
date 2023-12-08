- Добавляем helm репозитории

```
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx

helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
```


  - Обновляем репозитории: 

	```helm repo update```

- Установим в кластер ingres контроллер с помощью команды: 
```
helm install ingress ingress-nginx \
--namespace ingress --create-namespace \
-f app/ing_values.yaml
```

- Установим в кластер ingress контроллер с помощью команды: 
```
helm install prometheus-stack prometheus-community/kube-prometheus-stack \
--namespace ingress --create-namespace \
-f monitoring/values.yaml
```

- Деплой приложения:
```
kubectl apply -f app/simple-http.yaml
```

Для тестирования нагрузки использовался инструмент: 
	- vegeta - cli инструмент нагрузочного тестирования.
 Полная команда для проведения тестирования:
```
echo "GET http://<domain.name>/status/<http-status>" | vegeta attack -duration=100m
```
 - ```<domain.name>``` - укажите Ваш домен
 - ```<http-status>``` - укажите нужный ответ сервера (2хх, 4xx, 5xx, etc)
 