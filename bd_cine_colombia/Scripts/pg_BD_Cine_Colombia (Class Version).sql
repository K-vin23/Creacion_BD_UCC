/*==============================================================*/
/* DBMS name:      PostgreSQL 9.x                               */
/* Created on:     15/03/2023 11:38:04 a.�m.                    */
/*==============================================================*/

/*==============================================================*/
/* Table: CINE                                                  */
/*==============================================================*/
create table CINE (
   ID_CINE              VARCHAR(5)           not null,
   ID_CIUDAD            VARCHAR(5)           not null,
   NOMBRE               VARCHAR(40)          not null,
   DIRECCION            VARCHAR(50)          not null,
   TELEFONO_ADMIN       VARCHAR(30)          null,
   TELEFONO_CLIENTES    VARCHAR(30)          null,
   ESTADO               VARCHAR(1)           null default 'A'
      constraint CKC_ESTADO_CINE check (ESTADO is null or (ESTADO in ('A','I') and ESTADO = upper(ESTADO))),
   constraint PK_CINE primary key (ID_CINE)
);

/*==============================================================*/
/* Table: CINE_CARTELERAS                                       */
/*==============================================================*/
create table CINE_CARTELERAS (
   ID_CARTELERA         VARCHAR(10)          not null,
   ID_CINE              VARCHAR(5)           not null,
   ESTADO               VARCHAR(1)           null default 'A'
      constraint CKC_ESTADO_CINE_CAR check (ESTADO is null or (ESTADO in ('A','I') and ESTADO = upper(ESTADO))),
   constraint PK_CINE_CARTELERAS primary key (ID_CARTELERA)
);

/*==============================================================*/
/* Table: CINE_SALAS                                            */
/*==============================================================*/
create table CINE_SALAS (
   ID_SALA              VARCHAR(5)           not null,
   ID_CINE              VARCHAR(5)           not null,
   NOMBRE               VARCHAR(30)          null,
   ESTADO               VARCHAR(1)           null default 'A'
      constraint CKC_ESTADO_CINE_SAL check (ESTADO is null or (ESTADO in ('A','I') and ESTADO = upper(ESTADO))),
   constraint PK_CINE_SALAS primary key (ID_SALA)
);

/*==============================================================*/
/* Table: CIUDAD                                                */
/*==============================================================*/
create table CIUDAD (
   ID_CIUDAD            VARCHAR(5)           not null,
   ID_DEPTO             VARCHAR(2)           not null,
   NOMBRE               VARCHAR(20)          not null,
   constraint PK_CIUDAD primary key (ID_CIUDAD)
);

/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE (
   ID_CLIENTE           NUMERIC(20)          not null,
   ID_TD                VARCHAR(2)           not null,
   NOMBRE               VARCHAR(30)          not null,
   APELLIDOS            VARCHAR(30)          not null,
   constraint PK_CLIENTE primary key (ID_CLIENTE)
);

/*==============================================================*/
/* Table: CLIENTE_DIRECCIONES                                   */
/*==============================================================*/
create table CLIENTE_DIRECCIONES (
   ID_CLIENTE_DIRECCION NUMERIC(15)          not null,
   ID_CLIENTE           NUMERIC(20)          null,
   ID_CIUDAD            VARCHAR(5)          null,
   VIA_PRINCIPAL        VARCHAR(20)         null,
   NOMENCLATURA         VARCHAR(20)         null,
   COMPLEMENTO          VARCHAR(20)         null,
   constraint PK_CLIENTE_DIRECCIONES primary key (ID_CLIENTE_DIRECCION)
);

/*==============================================================*/
/* Table: DEPARTAMENTO                                          */
/*==============================================================*/
create table DEPARTAMENTO (
   ID_DEPTO             VARCHAR(2)           not null,
   NOMBRE               VARCHAR(20)          not null,
   constraint PK_DEPARTAMENTO primary key (ID_DEPTO)
);

/*==============================================================*/
/* Table: PELICULA                                              */
/*==============================================================*/
create table PELICULA (
   ID_PELICULA          VARCHAR(10)          not null,
   NOMBRE               VARCHAR(100)         not null,
   ESTADO               VARCHAR(1)           null default 'A'
      constraint CKC_ESTADO_PELICULA check (ESTADO is null or (ESTADO in ('A','I') and ESTADO = upper(ESTADO))),
   constraint PK_PELICULA primary key (ID_PELICULA)
);

/*==============================================================*/
/* Table: PELICULA_CARTELERA                                    */
/*==============================================================*/
create table PELICULA_CARTELERA (
   ID_CARTELERA         VARCHAR(10)          not null,
   ID_PELICULA          VARCHAR(10)          not null,
   constraint PK_PELICULA_CARTELERA primary key (ID_CARTELERA, ID_PELICULA)
);

/*==============================================================*/
/* Table: TIPO_DOCUMENTO                                        */
/*==============================================================*/
create table TIPO_DOCUMENTO (
   ID_TD                VARCHAR(2)           not null,
   NOMBRE               VARCHAR(20)          not null,
   constraint PK_TIPO_DOCUMENTO primary key (ID_TD)
);

alter table CINE
   add constraint FK_CINE_REFERENCE_CIUDAD foreign key (ID_CIUDAD)
      references CIUDAD (ID_CIUDAD)
      on delete restrict on update restrict;

alter table CINE_CARTELERAS
   add constraint FK_CINE_CAR_REFERENCE_CINE foreign key (ID_CINE)
      references CINE (ID_CINE)
      on delete restrict on update restrict;

alter table CINE_SALAS
   add constraint FK_CINE_SAL_REFERENCE_CINE foreign key (ID_CINE)
      references CINE (ID_CINE)
      on delete restrict on update restrict;

alter table CIUDAD
   add constraint FK_CIUDAD_REFERENCE_DEPARTAM foreign key (ID_DEPTO)
      references DEPARTAMENTO (ID_DEPTO)
      on delete restrict on update restrict;

alter table CLIENTE
   add constraint FK_CLIENTE_REFERENCE_TIPO_DOC foreign key (ID_TD)
      references TIPO_DOCUMENTO (ID_TD)
      on delete restrict on update restrict;

alter table CLIENTE_DIRECCIONES
   add constraint FK_CLIENTE__REFERENCE_CLIENTE foreign key (ID_CLIENTE)
      references CLIENTE (ID_CLIENTE)
      on delete restrict on update restrict;

alter table CLIENTE_DIRECCIONES
   add constraint FK_CLIENTE__REFERENCE_CIUDAD foreign key (ID_CIUDAD)
      references CIUDAD (ID_CIUDAD)
      on delete restrict on update restrict;

alter table PELICULA_CARTELERA
   add constraint FK_PELICULA_REFERENCE_CINE_CAR foreign key (ID_CARTELERA)
      references CINE_CARTELERAS (ID_CARTELERA)
      on delete restrict on update restrict;

alter table PELICULA_CARTELERA
   add constraint FK_PELICULA_REFERENCE_PELICULA foreign key (ID_PELICULA)
      references PELICULA (ID_PELICULA)
      on delete restrict on update restrict;

