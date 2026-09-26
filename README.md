# PR0102 - Instalación y configuración de Webmin

## 1. Actualizar los repositorios

Primero actualizamos la información de los repositorios de Ubuntu:

```bash
sudo apt update
```

![Actualización de repositorios](images/update.png)

---

## 2. Instalar curl

Instalamos `curl`, que utilizaremos para descargar el script de configuración de Webmin:

```bash
sudo apt install curl
```

![Instalación de curl](images/curl.png)

---

## 3. Descargar el script de Webmin

Descargamos el script oficial para configurar el repositorio de Webmin:

```bash
curl -O https://raw.githubusercontent.com/webmin/webmin/master/webmin-setup-repo.sh
```

![Descarga del script](images/intsall.png)

---

## 4. Configurar el repositorio

Ejecutamos el script descargado:

```bash
sudo sh webmin-setup-repo.sh
```

![Ij¡nstalacion del webmin](images/download.png)

---

## 5. Actualizar los repositorios

Después de añadir el repositorio de Webmin, volvemos a actualizar los repositorios:

```bash
sudo apt update
```

![Actualización de repositorios](images/update2.png)

---

## 6. Instalar Webmin

Instalamos Webmin con:

```bash
sudo apt-get install webmin --install-recommends
```

La opción `--install-recommends` instala también los paquetes recomendados para Webmin.

![Instalación de Webmin](images/install2.png)

---

## 7. Comprobar que Webmin está funcionando

Comprobamos el estado del servicio:

```bash
sudo systemctl status webmin
```

El servicio debe aparecer como:

```text
Active: active (running)
```

![Estado de Webmin](images/status.png)

---

## 8. Obtener la dirección IP del servidor

Para consultar las interfaces de red y las direcciones IP utilizamos:

```bash
ip a
```

La dirección utilizada para acceder al servidor fue:

```text
192.168.56.101
```

![Dirección IP](images/ip.png)

---

## 9. Configurar el firewall

Permitimos las conexiones SSH:

```bash
sudo ufw allow ssh
```

Permitimos el puerto utilizado por Webmin:

```bash
sudo ufw allow 10000/tcp
```

Activamos el firewall:

```bash
sudo ufw enable
```

Y comprobamos su estado:

```bash
sudo ufw status
```

![Configuración del firewall](images/firewall.png)

---

## 10. Acceder a Webmin

Desde el navegador accedemos a:

```text
https://192.168.56.101:10000
```

El puerto `10000` es el utilizado por Webmin.

Al acceder por primera vez puede aparecer un aviso del navegador relacionado con el certificado HTTPS.

![Acceso a Webmin](images/webminlogin.png)


![Webmin Dashboard](images/webmindashboard.png)

---

## 11. Automatización

Todos los pasos principales de instalación y configuración se han automatizado mediante un script Bash situado en:

```text
webmin-install.sh
```

Para darle permisos de ejecución:

```bash
chmod +x webmin-install.sh
```

Y para ejecutarlo:

```bash
./webmin-install.sh
```

El script permite realizar la instalación sin tener que introducir manualmente todos los comandos.
