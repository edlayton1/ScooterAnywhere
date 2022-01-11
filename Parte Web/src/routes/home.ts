import express from 'express';

import { index } from '../controllers/home';
import { signIn } from '../controllers/UserController';

const router = express.Router();

router.get('/', index);

export default router;
