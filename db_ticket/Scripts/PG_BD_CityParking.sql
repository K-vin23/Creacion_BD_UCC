/*==============================================================*/
/* DBMS name:      PostgreSQL 9.x                               */
/* Created on:     17/04/2023 9:05:10 p.�m.                     */
/*==============================================================*/

/*==============================================================*/
/* Table: CIUDAD                                                */
/*==============================================================*/
create table CIUDAD (
   ID_CIUDAD            varchar(2)           not null,
   NOMBRE               varchar(20)          not null,
   constraint PK_CIUDAD primary key (ID_CIUDAD)
);

/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE (
   IDENTIFICACION       varchar(14)          not null,
   ID_TIPODOC           VARCHAR(1)           null,
   NOMBRES              varchar(20)          not null,
   APELLIDOS            VARCHAR(20)          null,
   TELEFONO             VARCHAR(20)          null,
   CORREO               VARCHAR(30)          null,
   PLACA_VEH            VARCHAR(20)          null,
   constraint PK_CLIENTE primary key (IDENTIFICACION)
);

/*==============================================================*/
/* Table: ESTABLECIMIENTOS                                      */
/*==============================================================*/
create table ESTABLECIMIENTOS (
   ID_ESTAB             varchar(6)           not null,
   ID_CIUDAD            varchar(2)           null,
   NOMBRE               varchar(20)          not null,
   DIRECCION            VARCHAR(20)          null,
   TELEFONO             VARCHAR(20)          null,
   CORREO               VARCHAR(40)          null,
   constraint PK_ESTABLECIMIENTOS primary key (ID_ESTAB)
);

/*==============================================================*/
/* Table: FACTURA                                               */
/*==============================================================*/
create table FACTURA (
   ID_FACTURA           varchar(5)           not null,
   ID_TICKET            varchar(5)           null,
   ID_PRODUCTO          varchar(1)           null,
   ID_FPAGO             varchar(1)           null,
   TARIFA_IVA           NUMERIC(5,2)         null,
   TOTAL_PAGO           NUMERIC(5,2)         null,
   constraint PK_FACTURA primary key (ID_FACTURA)
);

/*==============================================================*/
/* Table: FORMA_PAGO                                            */
/*==============================================================*/
create table FORMA_PAGO (
   ID_FPAGO             varchar(1)           not null,
   FORMA_PAGO           varchar(20)          null,
   constraint PK_FORMA_PAGO primary key (ID_FPAGO)
);

/*==============================================================*/
/* Table: PRODUCTO                                              */
/*==============================================================*/
create table PRODUCTO (
   ID_PRODUCTO          varchar(1)           not null,
   NOMBRE               varchar(2)           null,
   ID_TIPOAC            VARCHAR(1)           null,
   VALOR                NUMERIC(6,2)         null,
   constraint PK_PRODUCTO primary key (ID_PRODUCTO)
);

/*==============================================================*/
/* Table: TICKET                                                */
/*==============================================================*/
create table TICKET (
   ID_TICKET            varchar(5)           not null,
   ID_ESTAB             varchar(6)           null,
   FECHA                TIMESTAMP WITH TIME ZONE null,
   HORA_ENTRADA         varchar(5)           not null,
   HORA_SALIDA          VARCHAR(5)           null,
   USUARIO_LOG          varchar(5)           null,
   constraint PK_TICKET primary key (ID_TICKET)
);

/*==============================================================*/
/* Table: TIPO_ACCESO                                           */
/*==============================================================*/
create table TIPO_ACCESO (
   ID_TIPOAC            varchar(1)           not null,
   TIPO_ACCESO          varchar(20)          null,
   constraint PK_TIPO_ACCESO primary key (ID_TIPOAC)
);

/*==============================================================*/
/* Table: TIPO_DOCUMENTO                                        */
/*==============================================================*/
create table TIPO_DOCUMENTO (
   ID_TIPDOC            VARCHAR(1)           not null,
   NOMBRE               VARCHAR(20)          not null,
   constraint PK_TIPO_DOCUMENTO primary key (ID_TIPDOC)
);

/*==============================================================*/
/* Table: TIPO_USUARIO                                          */
/*==============================================================*/
create table TIPO_USUARIO (
   ID_TIPUSU            VARCHAR(1)           not null,
   TIPO_USUARIO         varchar(20)          not null,
   constraint PK_TIPO_USUARIO primary key (ID_TIPUSU)
);

/*==============================================================*/
/* Table: USUARIO                                               */
/*==============================================================*/
create table USUARIO (
   ID_USER              varchar(5)           not null,
   ID_TIPUSU            VARCHAR(1)           not null,
   IDENTIFICACION       varchar(14)          null,
   NOMBRE               varchar(5)           null,
   REGISTRO             TIMESTAMP WITH TIME ZONE null,
   ESTADO               varchar(1)           null default '1'
      constraint CKC_ESTADO_USUARIO check (ESTADO is null or (ESTADO >= '0' and ESTADO in ('0','1'))),
   constraint PK_USUARIO primary key (ID_USER)
);

/*==============================================================*/
/* Table: USUARIO_ESTABLECIMIENTO                               */
/*==============================================================*/
create table USUARIO_ESTABLECIMIENTO (
   ID_ESTAB             varchar(6)           null,
   ID_USER              varchar(5)           null
);

alter table CLIENTE
   add constraint FK_CLIENTE_REFERENCE_TIPO_DOC foreign key (ID_TIPODOC)
      references TIPO_DOCUMENTO (ID_TIPDOC)
      on delete restrict on update restrict;

alter table ESTABLECIMIENTOS
   add constraint FK_ESTABLEC_REFERENCE_CIUDAD foreign key (ID_CIUDAD)
      references CIUDAD (ID_CIUDAD)
      on delete restrict on update restrict;

alter table FACTURA
   add constraint FK_FACTURA_REFERENCE_FORMA_PA foreign key (ID_FPAGO)
      references FORMA_PAGO (ID_FPAGO)
      on delete restrict on update restrict;

alter table FACTURA
   add constraint FK_FACTURA_REFERENCE_TICKET foreign key (ID_TICKET)
      references TICKET (ID_TICKET)
      on delete restrict on update restrict;

alter table FACTURA
   add constraint FK_FACTURA_REFERENCE_PRODUCTO foreign key (ID_PRODUCTO)
      references PRODUCTO (ID_PRODUCTO)
      on delete restrict on update restrict;

alter table PRODUCTO
   add constraint FK_PRODUCTO_REFERENCE_TIPO_ACC foreign key (ID_TIPOAC)
      references TIPO_ACCESO (ID_TIPOAC)
      on delete restrict on update restrict;

alter table TICKET
   add constraint FK_TICKET_REFERENCE_ESTABLEC foreign key (ID_ESTAB)
      references ESTABLECIMIENTOS (ID_ESTAB)
      on delete restrict on update restrict;

alter table TICKET
   add constraint FK_TICKET_REFERENCE_USUARIO foreign key (USUARIO_LOG)
      references USUARIO (ID_USER)
      on delete restrict on update restrict;

alter table USUARIO
   add constraint FK_USUARIO_REFERENCE_TIPO_USU foreign key (ID_TIPUSU)
      references TIPO_USUARIO (ID_TIPUSU)
      on delete restrict on update restrict;

alter table USUARIO
   add constraint FK_USUARIO_REFERENCE_CLIENTE foreign key (IDENTIFICACION)
      references CLIENTE (IDENTIFICACION)
      on delete restrict on update restrict;

alter table USUARIO_ESTABLECIMIENTO
   add constraint FK_USUARIO__REFERENCE_ESTABLEC foreign key (ID_ESTAB)
      references ESTABLECIMIENTOS (ID_ESTAB)
      on delete restrict on update restrict;

alter table USUARIO_ESTABLECIMIENTO
   add constraint FK_USUARIO__REFERENCE_USUARIO foreign key (ID_USER)
      references USUARIO (ID_USER)
      on delete restrict on update restrict;

