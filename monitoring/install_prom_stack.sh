#!/bin/bash
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm upgrade  --install prometheus-stack prometheus-community/kube-prometheus-stack -f values.yaml -n monitoring --create-namespace