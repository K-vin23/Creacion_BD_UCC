/*==============================================================*/
/* DBMS name:      PostgreSQL 9.x                               */
/* Created on:     5/04/2023 11:21:46 p.�m.                     */
/*==============================================================*/


/*==============================================================*/
/* Table: BANCO                                                 */
/*==============================================================*/
create table BANCO (
   ID_BANCO             VARCHAR(5)           not null,
   ID_PAIS              VARCHAR(3)           null,
   NOMBRE               VARCHAR(40)          null,
   TELEFONO_ADMIN       VARCHAR(20)          null,
   TELEFONO_ATENCION    VARCHAR(20)          null,
   PAGINA_WEB           VARCHAR(50)          null,
   constraint PK_BANCO primary key (ID_BANCO)
);

/*==============================================================*/
/* Table: BANCO_CUENTA                                          */
/*==============================================================*/
create table BANCO_CUENTA (
   ID_BANCO             VARCHAR(5)           null,
   ID_CUENTA            NUMERIC(15)          null
);

/*==============================================================*/
/* Table: BANCO_USUARIOS                                        */
/*==============================================================*/
create table BANCO_USUARIOS (
   ID_USUARIO           varchar(10)          null,
   ID_BANCO             VARCHAR(5)           null
);

/*==============================================================*/
/* Table: CIUDAD                                                */
/*==============================================================*/
create table CIUDAD (
   ID_CIUDAD            varchar(2)           not null,
   ID_DPTO              VARCHAR(3)           null,
   NOMBRE               varchar(20)          not null,
   constraint PK_CIUDAD primary key (ID_CIUDAD)
);

/*==============================================================*/
/* Table: CLASE_PRODUCTO                                        */
/*==============================================================*/
create table CLASE_PRODUCTO (
   ID_CLASE_PRODUCTO    VARCHAR(10)          not null,
   NOMBRE               VARCHAR(30)          null,
   ESTADO               VARCHAR(1)           null,
   constraint PK_CLASE_PRODUCTO primary key (ID_CLASE_PRODUCTO)
);

/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE (
   IDENTIFICACION       varchar(14)          not null,
   NOMBRES              varchar(20)          not null,
   APELLIDOS            VARCHAR(20)          null,
   FECHA_NACIMIENTO     VARCHAR(10)          null,
   constraint PK_CLIENTE primary key (IDENTIFICACION)
);

/*==============================================================*/
/* Table: CLIENTE_CORREO                                        */
/*==============================================================*/
create table CLIENTE_CORREO (
   ID_CORREO            VARCHAR(2)           not null,
   IDENTIFICACION       varchar(14)          not null,
   CORREO               VARCHAR(50)          not null,
   USUARIO_LOG          VARCHAR(10)          not null,
   FEC_REGISTRO         TIMESTAMP WITH TIME ZONE not null,
   FEC_ACTUALIZACION    TIMESTAMP WITH TIME ZONE null,
   constraint PK_CLIENTE_CORREO primary key (ID_CORREO)
);

/*==============================================================*/
/* Table: CLIENTE_DIRECCION                                     */
/*==============================================================*/
create table CLIENTE_DIRECCION (
   ID_DIRECCION         NUMERIC(15)          not null,
   IDENTIFICACION       varchar(14)          null,
   ID_CIUDAD            varchar(2)           not null,
   VIA_PRINCIPAL        VARCHAR(10)          null,
   NOMENCLATURA         VARCHAR(5)           null,
   COMPLEMENTO          VARCHAR(5)           null,
   USUARIO_LOG          VARCHAR(10)          null,
   FEC_REGISTRO         TIMESTAMP WITH TIME ZONE null,
   FEC_ACTUALIZACION    TIMESTAMP WITH TIME ZONE null,
   constraint PK_CLIENTE_DIRECCION primary key (ID_DIRECCION)
);

/*==============================================================*/
/* Table: CLIENTE_REDES                                         */
/*==============================================================*/
create table CLIENTE_REDES (
   ID_CLIENTE_REDES     VARCHAR(2)           not null,
   IDENTIFICACION       varchar(14)          not null,
   ID_RED               VARCHAR(2)           not null,
   NOMBRE_PERFIL        VARCHAR(30)          null,
   FEC_REGISTRO         TIMESTAMP WITH TIME ZONE not null,
   FEC_ACTUALIZACION    TIMESTAMP WITH TIME ZONE null,
   USUARIO_LOG          VARCHAR(10)          not null,
   constraint PK_CLIENTE_REDES primary key (ID_CLIENTE_REDES)
);

/*==============================================================*/
/* Table: CUENTA                                                */
/*==============================================================*/
create table CUENTA (
   ID_CUENTA            NUMERIC(15)          not null,
   ID_TIPO_CUENTA       VARCHAR(3)           null,
   ID_TIPO_EMBARGO      VARCHAR(3)           null,
   ID_CUENTA_ESTADO     VARCHAR(3)           null,
   ID_MONEDA            VARCHAR(10)          null,
   ID_PAIS              VARCHAR(3)           null,
   FECHA_CREACION       TIMESTAMP WITH TIME ZONE null,
   DESCRIPCION          VARCHAR(50)          null,
   ESTADO               VARCHAR(1)           null,
   FECHA_REGISTRO       TIMESTAMP WITH TIME ZONE null,
   FECHA_ACTUALIZACION  TIMESTAMP WITH TIME ZONE null,
   ID_USUARIO_LOG       varchar(10)          null,
   constraint PK_CUENTA primary key (ID_CUENTA)
);

/*==============================================================*/
/* Table: CUENTA_CLIENTES                                       */
/*==============================================================*/
create table CUENTA_CLIENTES (
   ID_CUENTA            NUMERIC(15)          null,
   IDENTIFICACION       varchar(14)          null
);

/*==============================================================*/
/* Table: CUENTA_ESTADO                                         */
/*==============================================================*/
create table CUENTA_ESTADO (
   ID_CUENTA_ESTADO     VARCHAR(3)           not null,
   NOMBRE               VARCHAR(10)          null,
   ESTADO               VARCHAR(1)           not null,
   constraint PK_CUENTA_ESTADO primary key (ID_CUENTA_ESTADO)
);

/*==============================================================*/
/* Table: CUENTA_MOVIMIENTOS                                    */
/*==============================================================*/
create table CUENTA_MOVIMIENTOS (
   ID_CUENTA_CTRL       NUMERIC(5)           null,
   ID_CUENTA_MOV        NUMERIC(30)          not null,
   ID_CUENTA            NUMERIC(15)          null,
   VALOR                NUMERIC(15,2)        null,
   constraint PK_CUENTA_MOVIMIENTOS primary key (ID_CUENTA_MOV)
);

/*==============================================================*/
/* Table: CUENT_CONTROL                                         */
/*==============================================================*/
create table CUENT_CONTROL (
   ID_CUENT_MOV_CONTRL  NUMERIC(5)           not null,
   FECHA                TIMESTAMP WITH TIME ZONE null,
   constraint PK_CUENT_CONTROL primary key (ID_CUENT_MOV_CONTRL)
);

/*==============================================================*/
/* Table: DEPARTAMENTO                                          */
/*==============================================================*/
create table DEPARTAMENTO (
   ID_DPTO              VARCHAR(3)           not null,
   ID_PAIS              VARCHAR(3)           null,
   NOMBRE               VARCHAR(20)          not null,
   constraint PK_DEPARTAMENTO primary key (ID_DPTO)
);

/*==============================================================*/
/* Table: MONEDA                                                */
/*==============================================================*/
create table MONEDA (
   ID_MONEDA            VARCHAR(10)          not null,
   ID_PAIS              VARCHAR(3)           null,
   NOMBRE               VARCHAR(20)          null,
   ESTADO               VARCHAR(1)           null,
   constraint PK_MONEDA primary key (ID_MONEDA)
);

/*==============================================================*/
/* Table: PAIS                                                  */
/*==============================================================*/
create table PAIS (
   ID_PAIS              VARCHAR(3)           not null,
   NOMBRE               VARCHAR(20)          not null,
   CODIGO_TEL           VARCHAR(10)          null,
   constraint PK_PAIS primary key (ID_PAIS)
);

/*==============================================================*/
/* Table: PASSENCRYPT                                           */
/*==============================================================*/
create table PASSENCRYPT (
   ID_PASSENCRYPT       varchar(3)           not null,
   TYPE_ENCYPT          varchar(2)           not null,
   SCRIPT_LINE          VARCHAR(200)         null,
   ESTADO               VARCHAR(1)           null,
   constraint PK_PASSENCRYPT primary key (ID_PASSENCRYPT)
);

/*==============================================================*/
/* Table: PRODUCTO                                              */
/*==============================================================*/
create table PRODUCTO (
   ID_PRODUCTO          VARCHAR(10)          not null,
   ID_CLASE_PRODUCTO    VARCHAR(10)          null,
   constraint PK_PRODUCTO primary key (ID_PRODUCTO)
);

/*==============================================================*/
/* Table: REDES                                                 */
/*==============================================================*/
create table REDES (
   ID_RED               VARCHAR(2)           not null,
   RED_SOCIAL           VARCHAR(50)          not null,
   constraint PK_REDES primary key (ID_RED)
);

/*==============================================================*/
/* Table: SUCURSAL                                              */
/*==============================================================*/
create table SUCURSAL (
   ID_SUCURSAL          VARCHAR(5)           not null,
   ID_BANCO             VARCHAR(5)           null,
   ID_CIUDAD            varchar(2)           null,
   DIRECCION            VARCHAR(20)          null,
   constraint PK_SUCURSAL primary key (ID_SUCURSAL)
);

/*==============================================================*/
/* Table: TIPO_CUENTA                                           */
/*==============================================================*/
create table TIPO_CUENTA (
   ID_TIPO_CUENTA       VARCHAR(3)           not null,
   ID_CLASE_PRODUCTO    VARCHAR(10)          null,
   TIPO_CUENTA          VARCHAR(10)          null,
   ESTADO               VARCHAR(1)           null,
   constraint PK_TIPO_CUENTA primary key (ID_TIPO_CUENTA)
);

/*==============================================================*/
/* Table: TIPO_EMBARGO                                          */
/*==============================================================*/
create table TIPO_EMBARGO (
   ID_TIPO_EMBARGO      VARCHAR(3)           not null,
   NOMBRE               VARCHAR(10)          null,
   ESTADO               VARCHAR(1)           null,
   constraint PK_TIPO_EMBARGO primary key (ID_TIPO_EMBARGO)
);

/*==============================================================*/
/* Table: TIPO_USUARIO                                          */
/*==============================================================*/
create table TIPO_USUARIO (
   ID_TIPO_USUARIO      VARCHAR(1)           not null,
   TIPO_USUARIO         varchar(20)          not null,
   constraint PK_TIPO_USUARIO primary key (ID_TIPO_USUARIO)
);

/*==============================================================*/
/* Table: USUARIO                                               */
/*==============================================================*/
create table USUARIO (
   ID_USUARIO           varchar(10)          not null,
   IDENTIFICACION       varchar(14)          not null,
   ID_TIPO_USUARIO      VARCHAR(1)           not null,
   USERNAME             varchar(5)           null,
   PASS                 varchar(50)          null,
   ID_PASSENCRYPT       varchar(3)           null,
   ESTADO               VARCHAR(1)           null,
   HORA_LOGIN           NUMERIC(2)           not null,
   HORA_LOGOUT          NUMERIC(2)           not null,
   FEC_REGISTRO         TIMESTAMP WITH TIME ZONE null,
   FEC_ACTUALIZACION    TIMESTAMP WITH TIME ZONE null,
   constraint PK_USUARIO primary key (ID_USUARIO)
);

alter table BANCO
   add constraint FK_BANCO_REFERENCE_PAIS foreign key (ID_PAIS)
      references PAIS (ID_PAIS)
      on delete restrict on update restrict;

alter table BANCO_CUENTA
   add constraint FK_BANCO_CU_REFERENCE_BANCO foreign key (ID_BANCO)
      references BANCO (ID_BANCO)
      on delete restrict on update restrict;

alter table BANCO_CUENTA
   add constraint FK_BANCO_CU_REFERENCE_CUENTA foreign key (ID_CUENTA)
      references CUENTA (ID_CUENTA)
      on delete restrict on update restrict;

alter table BANCO_USUARIOS
   add constraint FK_BANCO_US_REFERENCE_USUARIO foreign key (ID_USUARIO)
      references USUARIO (ID_USUARIO)
      on delete restrict on update restrict;

alter table BANCO_USUARIOS
   add constraint FK_BANCO_US_REFERENCE_BANCO foreign key (ID_BANCO)
      references BANCO (ID_BANCO)
      on delete restrict on update restrict;

alter table CIUDAD
   add constraint FK_CIUDAD_REFERENCE_DEPARTAM foreign key (ID_DPTO)
      references DEPARTAMENTO (ID_DPTO)
      on delete restrict on update restrict;

alter table CLIENTE_CORREO
   add constraint FK_CL_COR_REFERENCE_CLIENTE foreign key (IDENTIFICACION)
      references CLIENTE (IDENTIFICACION)
      on delete restrict on update restrict;

alter table CLIENTE_DIRECCION
   add constraint FK_CLIENTE__REFERENCE_CIUDAD foreign key (ID_CIUDAD)
      references CIUDAD (ID_CIUDAD)
      on delete restrict on update restrict;

alter table CLIENTE_DIRECCION
   add constraint FK_CL_DIR_REFERENCE_CLIENTE foreign key (IDENTIFICACION)
      references CLIENTE (IDENTIFICACION)
      on delete restrict on update restrict;

alter table CLIENTE_REDES
   add constraint FK_CL_RED_REFERENCE_REDES foreign key (ID_RED)
      references REDES (ID_RED)
      on delete restrict on update restrict;

alter table CLIENTE_REDES
   add constraint FK_CL_RED_REFERENCE_CLIENTE foreign key (IDENTIFICACION)
      references CLIENTE (IDENTIFICACION)
      on delete restrict on update restrict;

alter table CUENTA
   add constraint FK_CUENTA_REFERENCE_TIPO_CUE foreign key (ID_TIPO_CUENTA)
      references TIPO_CUENTA (ID_TIPO_CUENTA)
      on delete restrict on update restrict;

alter table CUENTA
   add constraint FK_CUENTA_REFERENCE_PAIS foreign key (ID_PAIS)
      references PAIS (ID_PAIS)
      on delete restrict on update restrict;

alter table CUENTA
   add constraint FK_CUENTA_REFERENCE_USUARIO foreign key (ID_USUARIO_LOG)
      references USUARIO (ID_USUARIO)
      on delete restrict on update restrict;

alter table CUENTA
   add constraint FK_CUENTA_REFERENCE_TIPO_EMB foreign key (ID_TIPO_EMBARGO)
      references TIPO_EMBARGO (ID_TIPO_EMBARGO)
      on delete restrict on update restrict;

alter table CUENTA
   add constraint FK_CUENTA_REFERENCE_CUE_EST foreign key (ID_CUENTA_ESTADO)
      references CUENTA_ESTADO (ID_CUENTA_ESTADO)
      on delete restrict on update restrict;

alter table CUENTA
   add constraint FK_CUENTA_REFERENCE_MONEDA foreign key (ID_MONEDA)
      references MONEDA (ID_MONEDA)
      on delete restrict on update restrict;

alter table CUENTA_CLIENTES
   add constraint FK_CUENTA_C_REFERENCE_CUENTA foreign key (ID_CUENTA)
      references CUENTA (ID_CUENTA)
      on delete restrict on update restrict;

alter table CUENTA_CLIENTES
   add constraint FK_CUENTA_C_REFERENCE_CLIENTE foreign key (IDENTIFICACION)
      references CLIENTE (IDENTIFICACION)
      on delete restrict on update restrict;

alter table CUENTA_MOVIMIENTOS
   add constraint FK_CUENTA_M_REFERENCE_CUENT_CO foreign key (ID_CUENTA_CTRL)
      references CUENT_CONTROL (ID_CUENT_MOV_CONTRL)
      on delete restrict on update restrict;

alter table CUENTA_MOVIMIENTOS
   add constraint FK_CUENT_MOV_REFERENCE_CUENTA foreign key (ID_CUENTA)
      references CUENTA (ID_CUENTA)
      on delete restrict on update restrict;

alter table DEPARTAMENTO
   add constraint FK_DEPARTAM_REFERENCE_PAIS foreign key (ID_PAIS)
      references PAIS (ID_PAIS)
      on delete restrict on update restrict;

alter table MONEDA
   add constraint FK_MONEDA_REFERENCE_PAIS foreign key (ID_PAIS)
      references PAIS (ID_PAIS)
      on delete restrict on update restrict;

alter table PRODUCTO
   add constraint FK_PRODUCTO_REFERENCE_CLASE_PR foreign key (ID_CLASE_PRODUCTO)
      references CLASE_PRODUCTO (ID_CLASE_PRODUCTO)
      on delete restrict on update restrict;

alter table SUCURSAL
   add constraint FK_SUCURSAL_REFERENCE_BANCO foreign key (ID_BANCO)
      references BANCO (ID_BANCO)
      on delete restrict on update restrict;

alter table SUCURSAL
   add constraint FK_SUCURSAL_REFERENCE_CIUDAD foreign key (ID_CIUDAD)
      references CIUDAD (ID_CIUDAD)
      on delete restrict on update restrict;

alter table TIPO_CUENTA
   add constraint FK_TIPO_CUE_REFERENCE_CLASE_PR foreign key (ID_CLASE_PRODUCTO)
      references CLASE_PRODUCTO (ID_CLASE_PRODUCTO)
      on delete restrict on update restrict;

alter table USUARIO
   add constraint FK_USUARIO_REFERENCE_TIPO_USU foreign key (ID_TIPO_USUARIO)
      references TIPO_USUARIO (ID_TIPO_USUARIO)
      on delete restrict on update restrict;

alter table USUARIO
   add constraint FK_USUARIO_REFERENCE_PASSENCR foreign key (ID_PASSENCRYPT)
      references PASSENCRYPT (ID_PASSENCRYPT)
      on delete restrict on update restrict;
