# Nota 

Esta versión mejora la version de las cookies generando un fichero de map que contiene las URL que existen en el servidor viejo. Una vez que un usuario se accede a una URL del servidor viejo se queda cacheada de forma de que ya no es necesario hacer dos requests ni hace necesaria la cookie.
Este fichero se puede ir guardando con un cron (ejemplo en el fichero de config de haproxy) de forma que se tiene un registro de todas las URL viejas accedidas e incluso este fichero se puede pasar posteriormente para los apaches de los servidores nuevos para hacer redirect y descargar a haproxy
# Contexto

Se está migrando una web corporativa alojada en el "servidorviejo" a un CMS wordpress que tiene dos servidores de backend: "servidornuevo" y "servidornuevo2"

Visto que el cpontenido de la web vieja no va a desaparecer nos transmiten la necesidad de que cuando un usuario haga una petición en la web nueva si esta no se puede resolver porque devuelve un 404 se intente servir desde el servidor viejo automaticamente y de forma transparente

Desde el punto de vista de arquitectura puede ser más aporpiado generar un Location a un hostname diferente cosa que haría más sencilla la configuración de HAProxy o simplemente mantener una ficheros dbm en los "servidores nuevos" con un mapeo de redirecciones. Pero aunque puede ser mejor solución no es el objeto del problema a resolver

# Objetivo del repositorio

Encontrar una configuración de HAProxy que permita de forma transparente (sin cambiar la URL) para el usuario final dirigir las peticiones a los servidores "servidornuevo1" y "servidornuevo2" y que sólo en el caso de que estos devuelvan un 404 pruebe con otro servidor "servidorviejo"

# Bonus (a quien le pueda servir)

En el repo dejo un script de lua para haproxy que he usado alguna vez para recuperar las claves TLS de las conexiones de frontend y poder abrir en plano las capturas de tráfico con tcpdump realizadas en el propio haproxy

El repo adjunto al poner la url http://localhost/noexiste.html se debe ver el HTML correspondiente a la web vieja