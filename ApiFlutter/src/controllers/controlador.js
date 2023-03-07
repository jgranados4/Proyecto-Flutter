const mysqlConnection = require("../utils/database");
const Bcrypt = require("bcryptjs");
const controller = {};

//TODO:GET
controller.list = (req, res) => {
  console.log("listado");
  mysqlConnection.query("SELECT * FROM login", (err, rows, fields) => {
    if (!err) {
      res.json({
        status_code: 202,
        message: "listado",
        datos: rows,
      });
      console.log(rows, fields);
    } else {
      res.json({
        code: 500,
        error: true,
        message: err,
      });
    }
  });
};
//TODO get un Datos
controller.get = (req, res) => {
  const { id } = req.params;

  mysqlConnection.query(
    "SELECT * FROM login WHERE id=?",
    [id],
    (err, rows, fields) => {
      if (!err) {
        res.json(rows[0]);
      } else {
        console.log(err);
        res.json({
          code: 500,
          error: true,
          message: err,
        });
      }
    }
  );
};
//TODO: add
controller.add = async (req, res) => {
  let { nombre, cedula, direccion, username, password } = req.body;
  let passwordHash = await Bcrypt.hash(password, 8);
  console.log(nombre, cedula, direccion, username, password);
  const query = `INSERT INTO login(nombre,cedula,direccion,username,password)VALUES(?,?,?,?,?)`;
  mysqlConnection.query(
    query,
    [nombre, cedula, direccion, username, (password = passwordHash)],
    (err, rows, fields) => {
      if (!err) {
        res.json({
          error: false,
          message: "Saved",
        });
      } else {
        res.json({
          error: true,
          message: err,
        });
        console.log(err);
      }
    }
  );
};
controller.AddSolic=(req,res)=>{
  const {bloque,aula}=req.body;
  console.log(bloque,aula);
  const query=`INSERT INTO solicitudes(bloque,aula) VALUES(?,?)`;
  mysqlConnection.query(query,[bloque,aula],(err,rows,fields)=>{
    if(!err){
      res.json({
        error:false,
        message:"Saved"
      })
    }else{
      res.json({
        error:true,
        message:err,
      })
      console.log(err)
    }
  });
}
//* Autentificacion
controller.auth = async (req, res, next) => {
  let { username, password } = req.body;
  let passwordHash = await Bcrypt.hash(password, 8);
  if (username && password) {
    mysqlConnection.query(
      `SELECT * FROM login WHERE username=?`,
      [username],
      async (error, results) => {
        console.log(results.length);
        if (
          results.length == 0 ||
          !(await Bcrypt.compare(password, results[0].password))
        ) {
          res.json({
            error: true,
            message: error,
          });
        } else {
          res.json({
            error: false,
            message: "Login correcto",
          });
        }
      }
    );
  }
  console.log(username, password, passwordHash);
};

module.exports = controller;
