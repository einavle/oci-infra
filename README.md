
## start Argo rollouts
kubectl argo rollouts dashboard

## Start jaeger and kiali (need to install them first plus promethuse)

Add the istioctl to your path with: export PATH=$HOME/.istioctl/bin:$PATH

- istioctl dashboard jaeger
- istioctl dashboard kiali