/*==============================================================*/
/* User for postgres                                                 */
/*==============================================================*/

CREATE database banco;
CREATE USER banco WITH encrypted password 'banco';
GRANT ALL PRIVILEGES ON database banco TO banco;
GRANT USAGE,CREATE ON SCHEMA public TO banco;

GRANT ALL ON DATABASE banco TO banco;
ALTER DATABASE banco OWNER TO banco;
GRANT USAGE, CREATE ON SCHEMA PUBLIC TO banco;




