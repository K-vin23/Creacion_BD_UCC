/*==============================================================*/
/* User for postgres                                                 */
/*==============================================================*/

CREATE database biblioteca;
CREATE USER biblio WITH encrypted password 'biblio';
GRANT ALL PRIVILEGES ON database biblioteca TO biblio;
GRANT USAGE,CREATE ON SCHEMA public TO biblio;

GRANT ALL ON DATABASE biblioteca TO biblio;
ALTER DATABASE biblioteca OWNER TO biblio;
GRANT USAGE, CREATE ON SCHEMA PUBLIC TO biblio;




