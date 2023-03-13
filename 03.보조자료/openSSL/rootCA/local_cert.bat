mkdir D:\B_util\cert\local_cert
d:
cd D:\B_util\cert\local_cert
pause
openssl genrsa -aes256 -out localhost_private.key 2048
openssl req -new -key localhost_private.key -out localhost.csr -config %OPENSSL_HOME%\ssl\openssl.cnf
openssl x509 -req -days 1825 -in localhost.csr -out localhost.crt -CA ../rootCA/rootca.crt -CAcreateserial -CAkey ../rootCA/rootca_private.key -extensions v3_req -extfile %OPENSSL_HOME%\ssl\openssl.cnf
openssl pkcs12 -export -in localhost.crt -inkey localhost_private.key -out keystore -name "tomcat cert" -CAfile ../rootCA/rootca.crt -caname root -chain