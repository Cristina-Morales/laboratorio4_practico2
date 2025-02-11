### Desarrollo final del proyecto:

### correccion de errores:
- Se agrego un provider para que funcione de forma automatica el cambio del diseño de la aplicacion.
- Se eliminaron archivos sin uso y los imports sin uso.
- Si bien el buscador de personas funcionaba de forma correcta, se pudo mejorar un poco el buscador. Tambien se cambiaron algunos nombres para que la busqueda funcione mejor.


###  nuevo desarrollo:
Por medio de la libreria http se consumio un servicio que devuelve un listado de gatitos que se muestra en pantalla. El acceso a este listado es por medio del menu lateral y se puede seleccionar un gatito para ver el detalle del mismo.

### API
La api no ha cambiado, sigue siendo la misma esta en el repositorio https://github.com/Cristina-Morales/laboratorio4_practico1.git
se puede editar el puerto de la api desde el archivo /assets/env/.env






### PrototipoFlutter

### screens
Hay 4 screens, listado de regristros, detalle de un registro, perfil de usuario y el homescreen
el detalle de registro y el perfil utilizan el mismo widget para dibujar


### themes
Hay 2 temas, uno para modo oscuro y otro modo claro
### mocks
se guardan los registros mockeados, se deben borrar y generar otro archivo para obtener desde un servicio
### helpers
hay un helper que guarda datos de si es modo oscuro o no.
### widgets
Hay un widget para dibujar el menu y otro para dibujar el perfil de usuario y el detalle de registro.


### Dispositivo de prueba:
Android
Api level: 35-ext13
resolucion px 1080x2400