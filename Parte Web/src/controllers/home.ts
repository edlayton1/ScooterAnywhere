import { Request, Response, NextFunction } from 'express';

export const index = (req: Request, res: Response, next: NextFunction) => {
	res.render('index');
};
