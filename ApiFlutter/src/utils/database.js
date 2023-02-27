const conexionSql = require("mysql");

//conexion
const mysqlConnection = conexionSql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "dbproyec",
  multipleStatements: true,
});

mysqlConnection.connect((error) => {
  if (error) {
    console.error(error);
    return;
  } else {
    console.log("db esta conectado");
  }
});

module.exports = mysqlConnection;
