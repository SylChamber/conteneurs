set -gx KREW_ROOT $HOME/.local/share/krew
set -x PATH $KREW_ROOT/bin $PATH

# abbréviations pour Kubernetes
if status is-interactive
    abbr -a -- k kubectl
    abbr -a -- kaf 'kubectl apply -f'
    abbr -a -- kcd 'kubectl config set-context --current --namespace'
    abbr -a -- kc 'kubectl create'
    abbr -a -- kd 'kubectl describe'
    abbr -a -- kdel 'kubectl delete'
    abbr -a -- kg 'kubectl get'
    abbr -a -- kk 'kubectl krew'
    abbr -a -- kr 'kubectl run'
    abbr -a -- kuc 'kubectl config use-context'
    abbr -a -- kuns 'kubectl config unset contexts.$(kubectl config current-context).namespace'
    abbr -a -- kw 'watch -c kubecolor --force-colors'
    abbr -a -- kx 'kubectl exec'

    abbr -a -- ocaf 'oc apply -f'
    abbr -a -- occd 'oc config set-context --current --namespace'
    abbr -a -- occ 'oc create'
    abbr -a -- ocd 'oc describe'
    abbr -a -- ocdel 'oc delete'
    abbr -a -- ocg 'oc get'
    abbr -a -- ock 'oc krew'
    abbr -a -- ocr 'oc run'
    abbr -a -- ocuc 'oc config use-context'
    abbr -a -- ocuns 'oc config unset contexts.$(kubectl config current-context).namespace'
    abbr -a -- ocw 'KUBECOLOR_KUBECTL=oc watch -c kubecolor --force-colors'
    abbr -a -- ocx 'oc exec'
end
