# services-base-nginx-config
Este repositorio contiene la configuración base del servidor de nginx para los servicios a implementar. En concreto, contiene un archivo docker-compose que levanta un servidor de nginx en el puerto 4000(TBD) en la red bridge, para permitir comunicación con el resto de los contenedores. Sumado a eso, lee los archivos de nginx/servers y nginx/variables. Los primeros son incluidos en la configuración base de nginx, extendiendola. La segunda contiene los maps para las variables de entorno a ser utilizadas en los archivos de configuración de nginx.
# Configuración previa en EC2:
- En primer lugar, se debe contar con una instancia de EC2 funcionando.
- Posterior a esto, se debe instalar docker y docker-compose. Para esto, se debe correr los siguientes comandos:
    a. Docker:
        ```sudo amazon-linux-extras install docker
        sudo service docker start
        sudo usermod -a -G docker ec2-user```
    b. Docker-compose:
        ```
        sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
        sudo chmod +x /usr/local/bin/docker-compose
        ```
- En cuanto a los secretos de repositorio/ambiente, se deben crear los siguientes secretos:
    - AWS_EC2_PRIVATE_KEY*
    - EC2_HOSTNAME
    - EC2_USERNAME
    Además, se debe crear una llave de ssh en el EC2. Para esto, se puede hacer directamente en aws o crear una de forma manual con el comando `ssh-keygen -t rsa`. Este comando generará una llave,    que se encontrará en el archivo id_rsa.pub en el último caso. Con esta llave se deben realizar dos acciones:
        a. Guardarla como deploy key en el repositorio en github.
        b. Copiarla, agregarle un tag y concatenarla a los contenidos existentes en el archivo `authorized_keys` en la instancia de la EC2 en la ruta `.ssh/`. Esto se puede realizar de la siguiente    forma:
        `echo <key + tag> >> authorized_keys`
    Por último, el contenido del archivo id_rsa o equivalente generado, debe ser guardado en el secreto de repositorio AWS_EC2_PRIVATE_KEY*
    En relación a las variables de repositorio/ambiente, se debe crear las siguientes variables opcionalmente:
    - CUSTOM_DOMAIN_NAME: A ser utilizado en nginx.
    Notar que tanto los secretos como variables pueden ser adaptados a ambientes de ser necesario a través de github.