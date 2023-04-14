/*==============================================================*/
/* DBMS name:      ORACLE Version 12c                           */
/* Created on:     10/04/2023 7:34:22 p.�m.                     */
/*==============================================================*/

/*==============================================================*/
/* Table: CANASTA                                               */
/*==============================================================*/
create table CANASTA (
   ID_CANASTA           varchar(5)            not null,
   ID_PRODUCTO          varchar(2)            not null,
   CANTIDAD             varchar(2)            not null,
   TOTAL                varchar(2),
   constraint PK_CANASTA primary key (ID_CANASTA)
);

/*==============================================================*/
/* Table: CARTELERA                                             */
/*==============================================================*/
create table CARTELERA (
   ID_CARTELERA         varchar(2)            not null,
   ID_CINE              varchar(5),
   ESTADO               varchar(2),
   constraint PK_CARTELERA primary key (ID_CARTELERA)
);

/*==============================================================*/
/* Table: CARTELERA_FUNCION                                     */
/*==============================================================*/
create table CARTELERA_FUNCION (
   ID_FUNCION           varchar(2)            not null,
   ID_CARTELERA         varchar(2)            not null,
   ID_PELICULA          varchar(2),
   ID_CINE_             varchar(5),
   ID_SALA              varchar(5),
   constraint PK_CARTELERA_FUNCION primary key (ID_FUNCION, ID_CARTELERA)
);

/*==============================================================*/
/* Table: CINE                                                  */
/*==============================================================*/
create table CINE (
   ID_CINE_             varchar(5)            not null,
   ID_CIUDAD            varchar(2),
   DIRECCION            varchar(40),
   TELEFONO             varchar(50),
   ESTADO               varchar(1),
   constraint PK_CINE primary key (ID_CINE_)
);

/*==============================================================*/
/* Table: CINE_SALAS                                            */
/*==============================================================*/
create table CINE_SALAS (
   ID_CINE_             varchar(5)            not null,
   ID_SALA              varchar(5)            not null,
   NOMBRE               varchar(40),
   ESTADO               varchar(1)            not null,
   constraint PK_CINE_SALAS primary key (ID_CINE_, ID_SALA)
);

/*==============================================================*/
/* Table: CIUDAD                                                */
/*==============================================================*/
create table CIUDAD (
   ID_CIUDAD            varchar(2)            not null,
   ID_DPTO              VARCHAR(3),
   NOMBRE               varchar(20)           not null,
   constraint PK_CIUDAD primary key (ID_CIUDAD)
);

/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE (
   IDENTIFICACION       varchar(14)           not null,
   NOMBRES              varchar(20)           not null,
   APELLIDOS            VARCHAR2(20),
   FECHA_NACIMIENTO     VARCHAR2(10),
   constraint PK_CLIENTE primary key (IDENTIFICACION)
);

/*==============================================================*/
/* Table: CLIENTE_CORREO                                        */
/*==============================================================*/
create table CLIENTE_CORREO (
   ID_CORREO            VARCHAR2(2)           not null,
   IDENTIFICACION       varchar(14)           not null,
   CORREO               VARCHAR2(50)          not null,
   USUARIO_LOG          VARCHAR2(10)          not null,
   FEC_REGISTRO         TIMESTAMP WITH TIME ZONE  not null,
   FEC_ACTUALIZACION    TIMESTAMP WITH TIME ZONE,
   constraint PK_CLIENTE_CORREO primary key (ID_CORREO)
);

/*==============================================================*/
/* Table: CLIENTE_DIRECCION                                     */
/*==============================================================*/
create table CLIENTE_DIRECCION (
   ID_DIRECCION         NUMBER(15)            not null,
   IDENTIFICACION       varchar(14),
   ID_CIUDAD            varchar(2)            not null,
   VIA_PRINCIPAL        VARCHAR2(10),
   NOMENCLATURA         VARCHAR2(5),
   COMPLEMENTO          VARCHAR2(5),
   USUARIO_LOG          VARCHAR2(10),
   FEC_REGISTRO         TIMESTAMP WITH TIME ZONE,
   FEC_ACTUALIZACION    TIMESTAMP WITH TIME ZONE,
   constraint PK_CLIENTE_DIRECCION primary key (ID_DIRECCION)
);

/*==============================================================*/
/* Table: CLIENTE_REDES                                         */
/*==============================================================*/
create table CLIENTE_REDES (
   ID_CLIENTE_REDES     VARCHAR2(2)           not null,
   IDENTIFICACION       varchar(14)           not null,
   ID_RED               VARCHAR2(2)           not null,
   NOMBRE_PERFIL        VARCHAR(30),
   FEC_REGISTRO         TIMESTAMP WITH TIME ZONE  not null,
   FEC_ACTUALIZACION    TIMESTAMP WITH TIME ZONE,
   USUARIO_LOG          VARCHAR2(10)          not null,
   constraint PK_CLIENTE_REDES primary key (ID_CLIENTE_REDES)
);

/*==============================================================*/
/* Table: COMPRA                                                */
/*==============================================================*/
create table COMPRA (
   ID_FACTURA           varchar(2)            not null,
   IDENTIFICACION       varchar(14)           not null,
   constraint PK_COMPRA primary key (ID_FACTURA, IDENTIFICACION)
);

/*==============================================================*/
/* Table: DEPARTAMENTO                                          */
/*==============================================================*/
create table DEPARTAMENTO (
   ID_DPTO              VARCHAR(3)            not null,
   ID_PAIS              VARCHAR(3),
   NOMBRE               VARCHAR(20)           not null,
   constraint PK_DEPARTAMENTO primary key (ID_DPTO)
);

/*==============================================================*/
/* Table: DISTRIBUCION                                          */
/*==============================================================*/
create table DISTRIBUCION (
   ID_DISTRIBUCION      varchar(2)            not null,
   ID_CINE_             varchar(5),
   ID_SALA              varchar(5),
   LETRA_FILA           varchar(2)            not null,
   NUM_COLUMNA          varchar(2),
   constraint PK_DISTRIBUCION primary key (ID_DISTRIBUCION)
);

/*==============================================================*/
/* Table: FACTURA                                               */
/*==============================================================*/
create table FACTURA (
   ID_FACTURA           varchar(2)            not null,
   ID_RESERVA           varchar(5)            not null,
   ID_CANASTA           varchar(5),
   TOTAL_PAGO           varchar(2),
   constraint PK_FACTURA primary key (ID_FACTURA)
);

/*==============================================================*/
/* Table: FUNCION                                               */
/*==============================================================*/
create table FUNCION (
   ID_FUNCION           varchar(2)            not null,
   HORA                 varchar(20)           not null,
   TIPO_FUNCION         varchar(2),
   constraint PK_FUNCION primary key (ID_FUNCION)
);

/*==============================================================*/
/* Table: PAIS                                                  */
/*==============================================================*/
create table PAIS (
   ID_PAIS              VARCHAR(3)            not null,
   NOMBRE               VARCHAR(20)           not null,
   CODIGO_TEL           VARCHAR(10),
   constraint PK_PAIS primary key (ID_PAIS)
);

/*==============================================================*/
/* Table: PASSENCRYPT                                           */
/*==============================================================*/
create table PASSENCRYPT (
   ID_PASSENCRYPT       varchar(3)            not null,
   TYPE_ENCYPT          varchar(2)            not null,
   SCRIPT_LINE          VARCHAR2(200),
   ESTADO               VARCHAR(1),
   constraint PK_PASSENCRYPT primary key (ID_PASSENCRYPT)
);

/*==============================================================*/
/* Table: PELICULA                                              */
/*==============================================================*/
create table PELICULA (
   ID_PELICULA          varchar(2)            not null,
   TITULO               varchar(20)           not null,
   GENERO               varchar(5),
   ESTADO               varchar(2),
   constraint PK_PELICULA primary key (ID_PELICULA)
);

/*==============================================================*/
/* Table: PELICULA_CARTELERA                                    */
/*==============================================================*/
create table PELICULA_CARTELERA (
   ID_CARTELERA         varchar(2)            not null,
   ID_PELICULA          varchar(2)            not null,
   constraint PK_PELICULA_CARTELERA primary key (ID_CARTELERA, ID_PELICULA)
);

/*==============================================================*/
/* Table: PRODUCTO                                              */
/*==============================================================*/
create table PRODUCTO (
   ID_PRODUCTO          varchar(2)            not null,
   PRODUCTO             varchar(5),
   PRECIO_UNITARIO      varchar(2)            not null,
   constraint PK_PRODUCTO primary key (ID_PRODUCTO)
);

/*==============================================================*/
/* Table: PUESTO                                                */
/*==============================================================*/
create table PUESTO (
   ID_PUESTO            NUMBER(2)             not null,
   ID_DISTRIBUCION      varchar(2),
   ID_TIPO_PUESTO       varchar(2),
   ESTADO               varchar(2)            not null,
   constraint PK_PUESTO primary key (ID_PUESTO)
);

/*==============================================================*/
/* Table: REDES                                                 */
/*==============================================================*/
create table REDES (
   ID_RED               VARCHAR2(2)           not null,
   RED_SOCIAL           VARCHAR2(50)          not null,
   constraint PK_REDES primary key (ID_RED)
);

/*==============================================================*/
/* Table: RESERVA                                               */
/*==============================================================*/
create table RESERVA (
   ID_RESERVA           varchar(5)            not null,
   ID_PUESTO            NUMBER(2)             not null,
   ID_FUNCION           varchar(2),
   ID_CARTELERA         varchar(2),
   constraint PK_RESERVA primary key (ID_RESERVA)
);

/*==============================================================*/
/* Table: SALA                                                  */
/*==============================================================*/
create table SALA (
   ID_SALA              varchar(5)            not null,
   ID_TIPO_SALA         varchar(2),
   ESTADO               varchar(1),
   constraint PK_SALA primary key (ID_SALA)
);

/*==============================================================*/
/* Table: TIPO_PUESTO                                           */
/*==============================================================*/
create table TIPO_PUESTO (
   ID_TIPO_PUESTO       varchar(2)            not null,
   TIPO_PUESTO          varchar(2),
   PRECIO               NUMBER(5)             not null,
   constraint PK_TIPO_PUESTO primary key (ID_TIPO_PUESTO)
);

/*==============================================================*/
/* Table: TIPO_SALA                                             */
/*==============================================================*/
create table TIPO_SALA (
   ID_TIPO_SALA         varchar(2)            not null,
   TIPO_SALA            varchar(15),
   constraint PK_TIPO_SALA primary key (ID_TIPO_SALA)
);

/*==============================================================*/
/* Table: TIPO_USUARIO                                          */
/*==============================================================*/
create table TIPO_USUARIO (
   ID_TIPO_USUARIO      VARCHAR2(1)           not null,
   TIPO_USUARIO         varchar(20)           not null,
   constraint PK_TIPO_USUARIO primary key (ID_TIPO_USUARIO)
);

/*==============================================================*/
/* Table: USUARIO                                               */
/*==============================================================*/
create table USUARIO (
   ID_USUARIO           varchar(10)           not null,
   IDENTIFICACION       varchar(14)           not null,
   ID_TIPO_USUARIO      VARCHAR2(1)           not null,
   USERNAME             varchar(5),
   PASS                 varchar(50),
   ID_PASSENCRYPT       varchar(3),
   ESTADO               VARCHAR(1),
   HORA_LOGIN           NUMBER(2)             not null,
   HORA_LOGOUT          NUMBER(2)             not null,
   FEC_REGISTRO         TIMESTAMP WITH TIME ZONE,
   FEC_ACTUALIZACION    TIMESTAMP WITH TIME ZONE,
   constraint PK_USUARIO primary key (ID_USUARIO)
);

/*==============================================================*/
/* Table: USUARIO_CINE                                          */
/*==============================================================*/
create table USUARIO_CINE (
   ID_USUARIO           varchar(10)           not null,
   ID_CINE_             varchar(5)            not null,
   USUARIO_LOG          varchar(10)           not null,
   FECHA_REGISTRO       TIMESTAMP WITH TIME ZONE  not null,
   constraint PK_USUARIO_CINE primary key (ID_USUARIO, ID_CINE_)
);

alter table CANASTA
   add constraint FK_CANASTA_REFERENCE_PRODUCTO foreign key (ID_PRODUCTO)
      references PRODUCTO (ID_PRODUCTO);

alter table CARTELERA
   add constraint FK_CARTELER_REFERENCE_CINE foreign key (ID_CINE)
      references CINE (ID_CINE_);

alter table CARTELERA_FUNCION
   add constraint FK_CARTELER_REFERENCE_FUNCION foreign key (ID_FUNCION)
      references FUNCION (ID_FUNCION);

alter table CARTELERA_FUNCION
   add constraint FK_CARTELER_REFERENCE_PELICULA foreign key (ID_CARTELERA, ID_PELICULA)
      references PELICULA_CARTELERA (ID_CARTELERA, ID_PELICULA);

alter table CARTELERA_FUNCION
   add constraint FK_CARTELER_REFERENCE_CINE_SAL foreign key (ID_CINE_, ID_SALA)
      references CINE_SALAS (ID_CINE_, ID_SALA);

alter table CINE
   add constraint FK_CINE_REFERENCE_CIUDAD foreign key (ID_CIUDAD)
      references CIUDAD (ID_CIUDAD);

alter table CINE_SALAS
   add constraint FK_CINE_SAL_REFERENCE_CINE foreign key (ID_CINE_)
      references CINE (ID_CINE_);

alter table CINE_SALAS
   add constraint FK_CINE_SAL_REFERENCE_SALA foreign key (ID_SALA)
      references SALA (ID_SALA);

alter table CIUDAD
   add constraint FK_CIUDAD_REFERENCE_DEPARTAM foreign key (ID_DPTO)
      references DEPARTAMENTO (ID_DPTO);

alter table CLIENTE_CORREO
   add constraint FK_CL_COR_REFERENCE_CLIENTE foreign key (IDENTIFICACION)
      references CLIENTE (IDENTIFICACION);

alter table CLIENTE_DIRECCION
   add constraint FK_CL_DIR_REFERENCE_CLIENTE foreign key (IDENTIFICACION)
      references CLIENTE (IDENTIFICACION);

alter table CLIENTE_DIRECCION
   add constraint FK_CIUDAD_DIR_REFERENCE_CIUDAD foreign key (ID_CIUDAD)
      references CIUDAD (ID_CIUDAD);

alter table CLIENTE_REDES
   add constraint FK_CL_RED_REFERENCE_REDES foreign key (ID_RED)
      references REDES (ID_RED);

alter table CLIENTE_REDES
   add constraint FK_CL_RED_REFERENCE_CLIENTE foreign key (IDENTIFICACION)
      references CLIENTE (IDENTIFICACION);

alter table COMPRA
   add constraint FK_COMPRA_REFERENCE_FACTURA foreign key (ID_FACTURA)
      references FACTURA (ID_FACTURA);

alter table COMPRA
   add constraint FK_COMPRA_REFERENCE_CLIENTE foreign key (IDENTIFICACION)
      references CLIENTE (IDENTIFICACION);

alter table DEPARTAMENTO
   add constraint FK_DEPARTAM_REFERENCE_PAIS foreign key (ID_PAIS)
      references PAIS (ID_PAIS);

alter table DISTRIBUCION
   add constraint FK_DISTRIBU_REFERENCE_CINE_SAL foreign key (ID_CINE_, ID_SALA)
      references CINE_SALAS (ID_CINE_, ID_SALA);

alter table FACTURA
   add constraint FK_FACTURA_REFERENCE_CANASTA foreign key (ID_CANASTA)
      references CANASTA (ID_CANASTA);

alter table FACTURA
   add constraint FK_FACTURA_REFERENCE_RESERVA foreign key (ID_RESERVA)
      references RESERVA (ID_RESERVA);

alter table PELICULA_CARTELERA
   add constraint FK_PELICULA_REFERENCE_PELICULA foreign key (ID_PELICULA)
      references PELICULA (ID_PELICULA);

alter table PELICULA_CARTELERA
   add constraint FK_PELICULA_REFERENCE_CARTELER foreign key (ID_CARTELERA)
      references CARTELERA (ID_CARTELERA);

alter table PUESTO
   add constraint FK_PUESTO_REFERENCE_DISTRIBU foreign key (ID_DISTRIBUCION)
      references DISTRIBUCION (ID_DISTRIBUCION);

alter table PUESTO
   add constraint FK_PUESTO_REFERENCE_TIP_PUES foreign key (ID_TIPO_PUESTO)
      references TIPO_PUESTO (ID_TIPO_PUESTO);

alter table RESERVA
   add constraint FK_RESERVA_REFERENCE_CARTELER foreign key (ID_FUNCION, ID_CARTELERA)
      references CARTELERA_FUNCION (ID_FUNCION, ID_CARTELERA);

alter table RESERVA
   add constraint FK_RESERVA_REFERENCE_PUESTO foreign key (ID_PUESTO)
      references PUESTO (ID_PUESTO);

alter table SALA
   add constraint FK_SALA_REFERENCE_TIPO_SAL foreign key (ID_TIPO_SALA)
      references TIPO_SALA (ID_TIPO_SALA);

alter table USUARIO
   add constraint FK_USUARIO_REFERENCE_TIPO_USU foreign key (ID_TIPO_USUARIO)
      references TIPO_USUARIO (ID_TIPO_USUARIO);

alter table USUARIO
   add constraint FK_USUARIO_REFERENCE_CLIENTE foreign key (IDENTIFICACION)
      references CLIENTE (IDENTIFICACION);

alter table USUARIO
   add constraint FK_USUARIO_REFERENCE_PASSENCR foreign key (ID_PASSENCRYPT)
      references PASSENCRYPT (ID_PASSENCRYPT);

alter table USUARIO_CINE
   add constraint FK_USU_CINE_REFERENCE_CINE foreign key (ID_CINE_)
      references CINE (ID_CINE_);

alter table USUARIO_CINE
   add constraint FK_USUARIO_REFERENCE_USUARIO foreign key (ID_USUARIO)
      references USUARIO (ID_USUARIO);

