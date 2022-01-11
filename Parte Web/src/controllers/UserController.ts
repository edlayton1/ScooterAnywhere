import { Request, Response, NextFunction } from 'express';

export const signIn = (req: Request, res: Response, next: NextFunction) => {
	res.render('signIn');
};
