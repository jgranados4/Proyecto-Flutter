const express=require('express');
const app= express();

//Config
app.set('port',process.env.PORT ||3000);

//Middleware
app.use(express.json());
//

app.use(express.urlencoded({extended:false}))
//Rutas
const routes =app.use(require('./routes/rutas'))
//
app.listen(app.get('port'),()=>{console.log(`Server on port http://localhost:${app.get('port')}`)})