const express=require('express');

const controller=require('../controllers/controlador')

const router=express.Router();

//rutas get,post,put,delete
router.get('/',controller.list);
router.get('/get_datos/:id',controller.get);
router.post('/add_datos',controller.add);
router.post('/add_solici',controller.AddSolic);
router.post('/auth',controller.auth);

module.exports = router;