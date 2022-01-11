import express from 'express';
let router = express.Router();
import { db } from '../util/database';

declare module 'express-session' {
	interface Session {
		loggedin: boolean;
		name: string;
	}
}

//display login page
router.get('/', function (req, res, next) {
	// render to views/user/add.ejs
	res.render('auth/login', {
		email: '',
		password: '',
	});
});

//display login page
router.get('/login', function (req, res, next) {
	// render to views/user/add.ejs
	res.render('auth/login', {
		email: '',
		password: '',
	});
});

const getUser = async (req, res, usuario, password) => {
	try {
		const connection = await (await db()).getConnection();
		const data = await connection.execute(
			'SELECT * FROM usuario WHERE nombre = :usuario AND contrasenia = :password',
			[usuario, password]
			// if user not found
		);
		console.log(data.rows);
		const rows = data.rows;
		await connection.close();

		console.log(rows[0][1]);
		if (rows.length <= 0) {
			req.flash('error', 'Ingrese usuario y contraseña validas!');
			res.redirect('/login');
		} else {
			// if user found
			// render to views/user/edit.ejs template file

			req.session.loggedin = true;
			req.session.name = rows[0][1];
			res.redirect('/auth/home');
		}
	} catch (err) {}
};

//authenticate user
router.post('/authentication', function (req, res, next) {
	var usuario = req.body.usuario;
	var password = req.body.password;
	console.log(`usuario ${usuario} pass ${password}`);

	getUser(req, res, usuario, password);
});

router.get('/signup', function (req, res) {
	res.render('auth/signup');
});

const postUser = async (req, res, usuario, apellidos, password) => {
	try {
		const connection = await (await db()).getConnection();
		const data = await connection.execute(
			'insert into usuario(usuario_id, nombre, apellidos, constrasenia) values(usuario_seq.nextval,:usuario,:apellidos, :password)',
			[usuario, apellidos, password]
			// if user not found
		);
		console.log(data);
		await connection.close();
		/* const rows = data.rows;

		console.log(rows[0][1]);
		if (rows.length <= 0) {
			req.flash('error', 'Ingrese usuario y contraseña validas!');
			res.redirect('/login');
		} else {
			// if user found
			// render to views/user/edit.ejs template file

			req.session.loggedin = true;
			req.session.name = rows[0][1];
			res.redirect('/auth/home');
		} */
	} catch (err) {
		console.error(err);
	}
};

router.post('/register', function (req, res, next) {
	let usuario = req.body.usuario;
	let appellidos = req.body.apellidos;
	let password = req.body.password;

	console.log(`usuario ${usuario} apellidos ${appellidos} pass ${password}`);
	postUser(req, res, usuario, appellidos, password);
});

//display home page
router.get('/home', function (req, res, next) {
	if (req.session.loggedin) {
		res.render('auth/home', {
			title: 'Datos',
			name: req.session.name,
		});
	} else {
		req.flash('success', 'Porfavot Ingrese');
		res.redirect('/login');
	}
});

// Logout user
router.get('/logout', function (req, res) {
	req.session.destroy((err) => {
		console.log(err);
	});
	req.flash('success', 'Vuelva a iniciar sesion');
	res.redirect('/login');
});

export default router;
