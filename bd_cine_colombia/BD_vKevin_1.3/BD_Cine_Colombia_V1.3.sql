/*==============================================================*/
/* DBMS name:      SAP SQL Anywhere 16                          */
/* Created on:     13/03/2023 6:44:56 p. m.                     */
/*==============================================================*/


if exists(select 1 from sys.sysforeignkey where role='FK_CANASTA_REFERENCE_PRODUCTO') then
    alter table CANASTA
       delete foreign key FK_CANASTA_REFERENCE_PRODUCTO
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_CARTELER_REFERENCE_FUNCION') then
    alter table CARTELERA_FUNCION
       delete foreign key FK_CARTELER_REFERENCE_FUNCION
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_CARTELER_REFERENCE_PELICULA') then
    alter table CARTELERA_FUNCION
       delete foreign key FK_CARTELER_REFERENCE_PELICULA
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_CINE_FK_CINE_R_CIUDAD') then
    alter table CINE
       delete foreign key FK_CINE_FK_CINE_R_CIUDAD
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_CINE_REFERENCE_CARTELER') then
    alter table CINE
       delete foreign key FK_CINE_REFERENCE_CARTELER
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_CINE_SAL_FK_CINE_C_CINE') then
    alter table CINE_SALAS
       delete foreign key FK_CINE_SAL_FK_CINE_C_CINE
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_CINE_SAL_FK_SALA_C_SALA') then
    alter table CINE_SALAS
       delete foreign key FK_CINE_SAL_FK_SALA_C_SALA
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_COMPRA_REFERENCE_USUARIO') then
    alter table COMPRA
       delete foreign key FK_COMPRA_REFERENCE_USUARIO
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_COMPRA_REFERENCE_FACTURA') then
    alter table COMPRA
       delete foreign key FK_COMPRA_REFERENCE_FACTURA
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_DEPARTAM_REFERENCE_CIUDAD') then
    alter table DEPARTAMENTO
       delete foreign key FK_DEPARTAM_REFERENCE_CIUDAD
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_DISTRIBU_REFERENCE_SALA') then
    alter table DISTRIBUCION
       delete foreign key FK_DISTRIBU_REFERENCE_SALA
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_FACTURA_REFERENCE_CANASTA') then
    alter table FACTURA
       delete foreign key FK_FACTURA_REFERENCE_CANASTA
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_FACTURA_REFERENCE_RESERVA') then
    alter table FACTURA
       delete foreign key FK_FACTURA_REFERENCE_RESERVA
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_PELICULA_REFERENCE_PELICULA') then
    alter table PELICULA_CARTELERA
       delete foreign key FK_PELICULA_REFERENCE_PELICULA
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_PELICULA_REFERENCE_CARTELER') then
    alter table PELICULA_CARTELERA
       delete foreign key FK_PELICULA_REFERENCE_CARTELER
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_PUESTO_REFERENCE_DISTRIBU') then
    alter table PUESTO
       delete foreign key FK_PUESTO_REFERENCE_DISTRIBU
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_PUESTO_REFERENCE_TIPO_PUE') then
    alter table PUESTO
       delete foreign key FK_PUESTO_REFERENCE_TIPO_PUE
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_RESERVA_REFERENCE_CARTELER') then
    alter table RESERVA
       delete foreign key FK_RESERVA_REFERENCE_CARTELER
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_RESERVA_REFERENCE_PUESTO') then
    alter table RESERVA
       delete foreign key FK_RESERVA_REFERENCE_PUESTO
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_SALA_REFERENCE_TIPO_SAL') then
    alter table SALA
       delete foreign key FK_SALA_REFERENCE_TIPO_SAL
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_USUARIO_REFERENCE_TIPO_DOC') then
    alter table USUARIO
       delete foreign key FK_USUARIO_REFERENCE_TIPO_DOC
end if;

drop table if exists CANASTA;

drop table if exists CARTELERA;

drop table if exists CARTELERA_FUNCION;

drop table if exists CINE;

drop table if exists CINE_SALAS;

drop table if exists CIUDAD;

drop table if exists COMPRA;

drop table if exists DEPARTAMENTO;

drop table if exists DISTRIBUCION;

drop table if exists FACTURA;

drop table if exists FUNCION;

drop table if exists PELICULA;

drop table if exists PELICULA_CARTELERA;

drop table if exists PRODUCTO;

drop table if exists PUESTO;

drop table if exists RESERVA;

drop table if exists SALA;

drop table if exists TIPO_DOCUMENTO;

drop table if exists TIPO_PUESTO;

drop table if exists TIPO_SALA;

drop table if exists USUARIO;

/*==============================================================*/
/* Table: CANASTA                                               */
/*==============================================================*/
create table CANASTA 
(
   ID_CANASTA           varchar(5)                     not null,
   ID_PRODUCTO          varchar(2)                     not null,
   CANTIDAD             varchar(2)                     not null,
   TOTAL                varchar(2)                     null,
   constraint PK_CANASTA primary key clustered (ID_CANASTA)
);

/*==============================================================*/
/* Table: CARTELERA                                             */
/*==============================================================*/
create table CARTELERA 
(
   ID_CARTELERA         varchar(2)                     not null,
   ID_CINE              varchar(20)                    not null,
   ESTADO               varchar(2)                     null,
   constraint PK_CARTELERA primary key clustered (ID_CARTELERA)
);

/*==============================================================*/
/* Table: CARTELERA_FUNCION                                     */
/*==============================================================*/
create table CARTELERA_FUNCION 
(
   ID_CARTELERA_FUNCION varchar(10)                    not null,
   ID_P_C               varchar(2)                     null,
   ID_FUNCION           varchar(2)                     null,
   ID_SALA              varchar(2)                     null,
   constraint PK_CARTELERA_FUNCION primary key clustered (ID_CARTELERA_FUNCION)
);

/*==============================================================*/
/* Table: CINE                                                  */
/*==============================================================*/
create table CINE 
(
   ID_CINE_             varchar(5)                     not null,
   ID_CIUDAD            varchar(5)                     null,
   ID_CARTELERA         varchar(2)                     null,
   DIRECCION            varchar(40)                    null,
   TELEFONO             varchar(50)                    null,
   ESTADO               varchar(1)                     null,
   constraint PK_CINE primary key clustered (ID_CINE_)
);

/*==============================================================*/
/* Table: CINE_SALAS                                            */
/*==============================================================*/
create table CINE_SALAS 
(
   ID_CINE_             varchar(5)                     not null,
   ID_SALA              varchar(5)                     null,
   NOMBRE               varchar(40)                    null,
   ESTADO               varchar(1)                     null
);

/*==============================================================*/
/* Table: CIUDAD                                                */
/*==============================================================*/
create table CIUDAD 
(
   ID_CIUDAD            varchar(2)                     not null,
   ID_DPTO              varchar(2)                     null,
   NOMBRE               varchar(20)                    not null,
   constraint PK_CIUDAD primary key clustered (ID_CIUDAD)
);

/*==============================================================*/
/* Table: COMPRA                                                */
/*==============================================================*/
create table COMPRA 
(
   ID_USUARIO           varchar(2)                     not null,
   ID_FACTURA           varchar(2)                     not null
);

/*==============================================================*/
/* Table: DEPARTAMENTO                                          */
/*==============================================================*/
create table DEPARTAMENTO 
(
   ID_DPTO              VARCHAR(2)                     not null,
   ID_CIUDAD            varchar(2)                     null,
   NOMBRE               VARCHAR(20)                    not null,
   constraint PK_DEPARTAMENTO primary key (ID_DPTO)
);

/*==============================================================*/
/* Table: DISTRIBUCION                                          */
/*==============================================================*/
create table DISTRIBUCION 
(
   ID_DISTRIBUCION      varchar(2)                     not null,
   ID_SALA              varchar(5)                     null,
   LETRA_FILA           varchar(2)                     not null,
   NUM_COLUMNA          varchar(2)                     null,
   constraint PK_DISTRIBUCION primary key clustered (ID_DISTRIBUCION)
);

/*==============================================================*/
/* Table: FACTURA                                               */
/*==============================================================*/
create table FACTURA 
(
   ID_FACTURA           varchar(2)                     not null,
   ID_RESERVA           varchar(5)                     null,
   ID_CANASTA           varchar(5)                     null,
   TOTAL_PAGO           varchar(2)                     null,
   constraint PK_FACTURA primary key clustered (ID_FACTURA)
);

/*==============================================================*/
/* Table: FUNCION                                               */
/*==============================================================*/
create table FUNCION 
(
   ID_FUNCION           varchar(2)                     not null,
   HORA                 varchar(20)                    not null,
   TIPO_FUNCION         varchar(2)                     null,
   constraint PK_FUNCION primary key clustered (ID_FUNCION)
);

/*==============================================================*/
/* Table: PELICULA                                              */
/*==============================================================*/
create table PELICULA 
(
   ID_PELICULA          varchar(2)                     not null,
   TITULO               varchar(20)                    not null,
   GENERO               varchar(5)                     null,
   ESTADO               varchar(2)                     null,
   constraint PK_PELICULA primary key clustered (ID_PELICULA)
);

/*==============================================================*/
/* Table: PELICULA_CARTELERA                                    */
/*==============================================================*/
create table PELICULA_CARTELERA 
(
   ID_P_C               varchar(2)                     not null,
   ID_CARTELERA         varchar(2)                     not null,
   ID_PELICULA          varchar(2)                     null,
   constraint PK_PELICULA_CARTELERA primary key clustered (ID_P_C)
);

/*==============================================================*/
/* Table: PRODUCTO                                              */
/*==============================================================*/
create table PRODUCTO 
(
   ID_PRODUCTO          varchar(2)                     not null,
   PRODUCTO             varchar(5)                     null,
   PRECIO_UNITARIO      varchar(2)                     not null,
   constraint PK_PRODUCTO primary key clustered (ID_PRODUCTO)
);

/*==============================================================*/
/* Table: PUESTO                                                */
/*==============================================================*/
create table PUESTO 
(
   ID_PUESTO            numeric(2)                     not null,
   ID_DISTRIBUCION      varchar(2)                     null,
   ID_TIPO_PUESTO       varchar(2)                     null,
   ESTADO               varchar(2)                     not null,
   constraint PK_PUESTO primary key clustered (ID_PUESTO)
);

/*==============================================================*/
/* Table: RESERVA                                               */
/*==============================================================*/
create table RESERVA 
(
   ID_RESERVA           varchar(5)                     not null,
   ID_CARTELERA_FUNCION varchar(10)                    not null,
   ID_PUESTO            numeric(2)                     not null,
   constraint PK_RESERVA primary key clustered (ID_RESERVA)
);

/*==============================================================*/
/* Table: SALA                                                  */
/*==============================================================*/
create table SALA 
(
   ID_SALA              varchar(5)                     not null,
   ID_TIPO_SALA         varchar(2)                     null,
   ESTADO               varchar(1)                     null,
   constraint PK_SALA primary key clustered (ID_SALA)
);

/*==============================================================*/
/* Table: TIPO_DOCUMENTO                                        */
/*==============================================================*/
create table TIPO_DOCUMENTO 
(
   ID_TIPO_DOC          varchar(2)                     not null,
   TIPO_DOC             varchar(5)                     null,
   constraint PK_TIPO_DOCUMENTO primary key clustered (ID_TIPO_DOC)
);

/*==============================================================*/
/* Table: TIPO_PUESTO                                           */
/*==============================================================*/
create table TIPO_PUESTO 
(
   ID_TIPO_PUESTO       varchar(2)                     not null,
   TIPO_PUESTO          varchar(2)                     null,
   PRECIO               float(5)                       not null,
   constraint PK_TIPO_PUESTO primary key clustered (ID_TIPO_PUESTO)
);

/*==============================================================*/
/* Table: TIPO_SALA                                             */
/*==============================================================*/
create table TIPO_SALA 
(
   ID_TIPO_SALA         varchar(2)                     not null,
   TIPO_SALA            varchar(15)                    null,
   constraint PK_TIPO_SALA primary key clustered (ID_TIPO_SALA)
);

/*==============================================================*/
/* Table: USUARIO                                               */
/*==============================================================*/
create table USUARIO 
(
   ID_USUARIO           varchar(2)                     not null,
   ID_TIPO_DOC          varchar(2)                     null,
   TIPO_DOC             varchar(2)                     null,
   IDENTIFICACION       varchar(2)                     not null,
   NOMBRE               varchar(5)                     null,
   CONTRASENA           varchar(2)                     null,
   constraint PK_USUARIO primary key clustered (ID_USUARIO)
);

alter table CANASTA
   add constraint FK_CANASTA_REFERENCE_PRODUCTO foreign key (ID_PRODUCTO)
      references PRODUCTO (ID_PRODUCTO)
      on update restrict
      on delete restrict;

alter table CARTELERA_FUNCION
   add constraint FK_CARTELER_REFERENCE_FUNCION foreign key (ID_FUNCION)
      references FUNCION (ID_FUNCION)
      on update restrict
      on delete restrict;

alter table CARTELERA_FUNCION
   add constraint FK_CARTELER_REFERENCE_PELICULA foreign key (ID_P_C)
      references PELICULA_CARTELERA (ID_P_C)
      on update restrict
      on delete restrict;

alter table CINE
   add constraint FK_CINE_FK_CINE_R_CIUDAD foreign key (ID_CIUDAD)
      references CIUDAD (ID_CIUDAD)
      on update restrict
      on delete restrict;

alter table CINE
   add constraint FK_CINE_REFERENCE_CARTELER foreign key (ID_CARTELERA)
      references CARTELERA (ID_CARTELERA)
      on update restrict
      on delete restrict;

alter table CINE_SALAS
   add constraint FK_CINE_SAL_FK_CINE_C_CINE foreign key (ID_CINE_)
      references CINE (ID_CINE_)
      on update restrict
      on delete restrict;

alter table CINE_SALAS
   add constraint FK_CINE_SAL_FK_SALA_C_SALA foreign key (ID_SALA)
      references SALA (ID_SALA)
      on update restrict
      on delete restrict;

alter table COMPRA
   add constraint FK_COMPRA_REFERENCE_USUARIO foreign key (ID_USUARIO)
      references USUARIO (ID_USUARIO)
      on update restrict
      on delete restrict;

alter table COMPRA
   add constraint FK_COMPRA_REFERENCE_FACTURA foreign key (ID_FACTURA)
      references FACTURA (ID_FACTURA)
      on update restrict
      on delete restrict;

alter table DEPARTAMENTO
   add constraint FK_DEPARTAM_REFERENCE_CIUDAD foreign key (ID_CIUDAD)
      references CIUDAD (ID_CIUDAD)
      on update restrict
      on delete restrict;

alter table DISTRIBUCION
   add constraint FK_DISTRIBU_REFERENCE_SALA foreign key (ID_SALA)
      references SALA (ID_SALA)
      on update restrict
      on delete restrict;

alter table FACTURA
   add constraint FK_FACTURA_REFERENCE_CANASTA foreign key (ID_CANASTA)
      references CANASTA (ID_CANASTA)
      on update restrict
      on delete restrict;

alter table FACTURA
   add constraint FK_FACTURA_REFERENCE_RESERVA foreign key (ID_RESERVA)
      references RESERVA (ID_RESERVA)
      on update restrict
      on delete restrict;

alter table PELICULA_CARTELERA
   add constraint FK_PELICULA_REFERENCE_PELICULA foreign key (ID_PELICULA)
      references PELICULA (ID_PELICULA)
      on update restrict
      on delete restrict;

alter table PELICULA_CARTELERA
   add constraint FK_PELICULA_REFERENCE_CARTELER foreign key (ID_CARTELERA)
      references CARTELERA (ID_CARTELERA)
      on update restrict
      on delete restrict;

alter table PUESTO
   add constraint FK_PUESTO_REFERENCE_DISTRIBU foreign key (ID_DISTRIBUCION)
      references DISTRIBUCION (ID_DISTRIBUCION)
      on update restrict
      on delete restrict;

alter table PUESTO
   add constraint FK_PUESTO_REFERENCE_TIPO_PUE foreign key (ID_TIPO_PUESTO)
      references TIPO_PUESTO (ID_TIPO_PUESTO)
      on update restrict
      on delete restrict;

alter table RESERVA
   add constraint FK_RESERVA_REFERENCE_CARTELER foreign key (ID_CARTELERA_FUNCION)
      references CARTELERA_FUNCION (ID_CARTELERA_FUNCION)
      on update restrict
      on delete restrict;

alter table RESERVA
   add constraint FK_RESERVA_REFERENCE_PUESTO foreign key (ID_PUESTO)
      references PUESTO (ID_PUESTO)
      on update restrict
      on delete restrict;

alter table SALA
   add constraint FK_SALA_REFERENCE_TIPO_SAL foreign key (ID_TIPO_SALA)
      references TIPO_SALA (ID_TIPO_SALA)
      on update restrict
      on delete restrict;

alter table USUARIO
   add constraint FK_USUARIO_REFERENCE_TIPO_DOC foreign key (ID_TIPO_DOC)
      references TIPO_DOCUMENTO (ID_TIPO_DOC)
      on update restrict
      on delete restrict;

