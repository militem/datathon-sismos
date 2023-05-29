//RUTA DE LA API
const express = require('express');
const router = express.Router();

const mysqlConnection = require('../database');

router.post('/api/sismos/', (req, res) => {
    const { date_inicial, date_final } = req.body;
    mysqlConnection.query("SELECT * FROM sismos WHERE fecha BETWEEN ? AND ? ORDER BY fecha ASC", [date_inicial, date_final], (err, rows, fields) => {
        if (!err) {
            result = {
                msg: 'OK',
                rows: rows
            }
            res.json(result);
        } else {
            result = {
                msg: 'error'
            }
            res.json(result);
            console.log(err);
        }
    });
});

router.post('/api/sismos/bydate/', (req, res) => {
    const { date } = req.body;
    mysqlConnection.query("SELECT * FROM sismos WHERE fecha = ? ORDER BY fecha ASC", [date], (err, rows, fields) => {
        if (!err) {
            result = {
                msg: 'OK',
                rows: rows
            }
            res.json(result);
        } else {
            result = {
                msg: 'error'
            }
            res.json(result);
            console.log(err);
        }
    });
});

router.post('/api/sismos/magnitud/', (req, res) => {
    const { magnitud_inicial, magnitud_final } = req.body;
    mysqlConnection.query("SELECT * FROM sismos WHERE magnitud >= ? AND magnitud <= ?", [magnitud_inicial, magnitud_final], (err, rows, fields) => {
        if (!err) {
            result = {
                msg: 'OK',
                rows: rows
            }
            res.json(result);
        } else {
            result = {
                msg: 'error'
            }
            res.json(result);
            console.log(err);
        }
    });
});

router.post('/api/sismos/profundidad/', (req, res) => {
    const { profundidad_inicial, profundidad_final } = req.body;
    mysqlConnection.query("SELECT * FROM sismos WHERE profundidad >= ? AND profundidad <= ?", [profundidad_inicial, profundidad_final], (err, rows, fields) => {
        if (!err) {
            result = {
                msg: 'OK',
                rows: rows
            }
            res.json(result);
        } else {
            result = {
                msg: 'error'
            }
            res.json(result);
            console.log(err);
        }
    });
});

router.get('/api/sismos/latest/', (req, res) => {
    mysqlConnection.query("SELECT * FROM sismos ORDER BY fecha DESC LIMIT 10", (err, rows, fields) => {
        if (!err) {
            result = {
                msg: 'OK',
                rows: rows
            }
            res.json(result);
        } else {
            result = {
                msg: 'error'
            }
            res.json(result);
            console.log(err);
        }
    });
});

module.exports = router;