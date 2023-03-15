/*==============================================================*/
/* User for postgres                                                 */
/*==============================================================*/

CREATE database cine;
CREATE USER cine WITH encrypted password 'cine';
GRANT ALL PRIVILEGES ON database cine TO cine;
GRANT USAGE,CREATE ON SCHEMA public TO cine;

GRANT ALL ON DATABASE cine TO cine;
ALTER DATABASE cine OWNER TO cine;
GRANT USAGE, CREATE ON SCHEMA PUBLIC TO cine;




