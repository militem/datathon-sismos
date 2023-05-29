const express = require('express');
const app = express();

/* Cors para permitir las consultas a la API
    https://es.stackoverflow.com/questions/218426/falta-la-cabecera-cors-access-control-allow-origin
*/
const cors = require('cors');

//Configuración del servidor
app.set('port', process.env.PORT || 3000);
const config = {
    application: {
        cors: {
            server: [{
                origin: "localhost:8081", // nombre del host con el puerto (localhost:8081) o (*) en caso que sea acceso libre
                credentials: true
            }]
        }
    }
}

//Funciones antes de las rutas
app.use(express.json());
app.use(cors(
    config.application.cors.server
));

//Rutas o URL's
app.use(require('./src/routes/api'));

//Iniciar el Servidor
app.listen(app.get('port'), () => {
    console.log('Server on port ', app.get('port'));
});