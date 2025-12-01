function kubectl --wraps=kubectl --description 'alias kubectl=kubecolor'
  command kubecolor $argv
end

function kubecolor --wraps kubectl
  command kubecolor $argv
end

function oc418 --wraps=oc418 --description 'alias oc418=kubecolor'
  KUBECOLOR_KUBECTL=oc418 command kubecolor $argv
end

function oc420 --wraps=oc420 --description 'alias oc420=kubecolor'
  KUBECOLOR_KUBECTL=oc420 command kubecolor $argv
end

function oc --wraps=oc420 --description 'alias oc=oc420'
  command oc420 $argv
end
