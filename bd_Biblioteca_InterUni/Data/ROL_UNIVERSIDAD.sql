/*==============================================================*/
/* Table: USUARIO_ROL                                           */
/*==============================================================*/
/*create table USUARIO_ROL (
   ID_ROL               VARCHAR(5)           not null,
   ROL                  VARCHAR(20)          null,
   constraint PK_USUARIO_ROL primary key (ID_ROL)
);*/

INSERT INTO USUARIO_ROL (ID_ROL, ROL)VALUES ('ESTUD', 'ESTUDIANTE');
INSERT INTO USUARIO_ROL (ID_ROL, ROL)VALUES ('ADMIN', 'ADMINISTRATIVO');
INSERT INTO USUARIO_ROL (ID_ROL, ROL)VALUES ('DOCEN', 'DOCENTE');
