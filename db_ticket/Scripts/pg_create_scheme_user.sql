/*==============================================================*/
/* User for postgres                                                 */
/*==============================================================*/

CREATE database ticket;
CREATE USER ticket WITH encrypted password 'ticket';
GRANT ALL PRIVILEGES ON database ticket TO ticket;
GRANT USAGE,CREATE ON SCHEMA public TO ticket;

GRANT ALL ON DATABASE ticket TO ticket;
ALTER DATABASE ticket OWNER TO ticket;
GRANT USAGE, CREATE ON SCHEMA PUBLIC TO ticket;




