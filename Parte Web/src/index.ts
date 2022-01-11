import express, { response } from 'express';
import expressValidator from 'express-validator';
import flash from 'express-flash';
import session from 'express-session';
import cookieParser from 'cookie-parser';
import { createError } from 'http-errors';

import homeRoute from './routes/home';
import authRouter from './routes/auth';

import { db, dbClose } from './util/database';
import bodyParser from 'body-parser';

const app = express();

app.set('views', __dirname + '/views');
app.set('view engine', 'ejs');

app.use(express.static(__dirname + '/public'));
app.use(express.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(cookieParser());

app.use(
	session({
		secret: '123456cat',
		resave: false,
		saveUninitialized: true,
		cookie: { maxAge: 60000 },
	})
);

app.use(flash());
//app.use(expressValidator());

app.use((req, res, next) => {
	res.setHeader('Access-Control-Allow-Origin', '*');
	res.setHeader(
		'Access-Control-Allow-Methods',
		'OPTIONS, GET, POST, PUT, PATCH, DELETE'
	);
	res.setHeader('Access-Control-Allow-Headers', 'Content-Type, Authorization');
	next();
});

app.use('/', homeRoute);
app.use('/auth', authRouter);

app.use((req, res) => {
	res.render('404');
});

const server = app.listen(3000);
