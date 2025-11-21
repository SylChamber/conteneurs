function kubectl --wraps=kubectl --description 'alias kubectl=kubecolor'
  command kubecolor $argv
end

function kubecolor --wraps kubectl
  command kubecolor $argv
end

function oc --wraps=oc --description 'alias oc=kubecolor'
  KUBECOLOR_KUBECTL=oc command kubecolor $argv
end
