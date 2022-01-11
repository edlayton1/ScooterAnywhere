import oracledb, { Pool } from 'oracledb';

const pass = 'pass';

let isConnectionSet = false;
let pool: oracledb.Pool;

export const db = async (): Promise<oracledb.Pool> => {
	if (!isConnectionSet) {
		const _pool = await oracledb.createPool({
			user: 'dpmp_proy_invitado',
			password: pass,
			connectString: 'pc-jjdp.fi.unam/cursobd.fi.unam',
		});
		isConnectionSet = true;
		//connection = await pool.getConnection();
		pool = _pool;
		return pool;
	}
	return pool;
	//const users = await connection.execute(`select * from usuario`);
};

export const dbClose = async () => {
	pool.close();
};
