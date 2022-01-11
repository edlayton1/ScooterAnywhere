#!/bin/bash
echo "Descargando datos"

# marca
curl "https://api.mockaroo.com/api/64aed530?count=10&key=1dd99910" > "marca.sql"

# telefono
curl "https://api.mockaroo.com/api/180230a0?count=20&key=1dd99910" > "telefono.sql"

#zona
curl "https://api.mockaroo.com/api/7086d310?count=50&key=1dd99910" > "zona.sql"

#status_scooter
curl "https://api.mockaroo.com/api/582a3a10?count=7&key=1dd99910" > "status_scooter.sql"

# scooter
curl "https://api.mockaroo.com/api/9e9f8f50?count=100&key=1dd99910" > "scooter.sql"

# zona_scooter
curl "https://api.mockaroo.com/api/884a5a30?count=500&key=1dd99910" > "zona_scooter.sql"

# historico
curl "https://api.mockaroo.com/api/b23b3ee0?count=500&key=1dd99910" > "historico_scooter_status.sql"

# usuario
curl "https://api.mockaroo.com/api/484941e0?count=500&key=1dd99910" > "usuario.sql"

# tarjeta usuario
curl "https://api.mockaroo.com/api/481ad8f0?count=1000&key=1dd99910" > "tarjeta_usuario.sql"

# tarjeta prepago
curl "https://api.mockaroo.com/api/481ad8f0?count=1000&key=1dd99910" > "tarjeta_prepago.sql"

# falla
curl "https://api.mockaroo.com/api/cb23af10?count=200&key=1dd99910" > "falla.sql"

# servicio c
curl "https://api.mockaroo.com/api/8728b750?count=100&key=1dd99910" > "servicio_c.sql"

# servicio ren
curl "https://api.mockaroo.com/api/8728b750?count=200&key=1dd99910" > "servicio_rent.sql"

# servicio v
curl "https://api.mockaroo.com/api/8728b750?count=200&key=1dd99910" > "servicio_v.sql"

#servicio_viaje
curl "https://api.mockaroo.com/api/20c7f290?count=200&key=1dd99910" > "servicio_viaje.sql"

#servicio_renta
curl "https://api.mockaroo.com/api/20c7f290?count=200&key=1dd99910" > "servicio_renta.sql"

# servicio_carga
curl "https://api.mockaroo.com/api/20c7f290?count=100&key=1dd99910" > "servicio_recarga.sql"

# carga_scooter
curl "https://api.mockaroo.com/api/81abe8f0?count=200&key=1dd99910" > "recarga_scooter.sql"