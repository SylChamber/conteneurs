function kubectl --wraps=kubectl --description 'alias kubectl=kubecolor'
  command kubecolor $argv
end

function kubecolor --wraps kubectl
  command kubecolor $argv
end
