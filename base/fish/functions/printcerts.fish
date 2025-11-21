function printcerts --wraps='openssl crl2pkcs7 -nocrl -certfile /dev/stdin | openssl pkcs7 -text -noout -print_certs' --description 'alias printcerts openssl crl2pkcs7 -nocrl -certfile /dev/stdin | openssl pkcs7 -text -noout -print_certs'
  openssl crl2pkcs7 -nocrl -certfile /dev/stdin | openssl pkcs7 -text -noout -print_certs $argv
        
end
