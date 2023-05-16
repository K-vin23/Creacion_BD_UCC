/*==============================================================*/
/* DBMS name:      ORACLE Version 12c                           */
/* Created on:     15/05/2023 8:53:39 p.�m.                     */
/*==============================================================*/

/*==============================================================*/
/* Table: AUTOR                                                 */
/*==============================================================*/
create table AUTOR (
   ID_AUTOR             NUMBER(15)            not null,
   NOMBRE               VARCHAR(40)           not null,
   APELLIDO             VARCHAR(40),
   constraint PK_AUTOR primary key (ID_AUTOR)
);

/*==============================================================*/
/* Table: BIBLIOTECA_ROL                                        */
/*==============================================================*/
create table BIBLIOTECA_ROL (
   ID_ROL               VARCHAR(5)            not null,
   ROL                  VARCHAR(20),
   constraint PK_BIBLIOTECA_ROL primary key (ID_ROL)
);

/*==============================================================*/
/* Table: CIUDAD                                                */
/*==============================================================*/
create table CIUDAD (
   ID_CIUDAD            VARCHAR(6)            not null,
   ID_PAIS              VARCHAR(6),
   CIUDAD               VARCHAR(100),
   constraint PK_CIUDAD primary key (ID_CIUDAD)
);

/*==============================================================*/
/* Table: DOCUMENTO                                             */
/*==============================================================*/
create table DOCUMENTO (
   ID_DOCUMENTO         NUMBER(10)            not null,
   ID_MATERIAL          VARCHAR(4),
   ID_IDIOMA            VARCHAR(5),
   ID_FORMATO           VARCHAR(5),
   TITULO_DOCUMENTO     VARCHAR(30),
   FECHA_DOCUMENTO      DATE,
   DESCRIPCION          VARCHAR(200),
   FECHA_SUBIDA         TIMESTAMP WITH LOCAL TIME ZONE,
   ID_USER_LOG          NUMBER(6),
   constraint PK_DOCUMENTO primary key (ID_DOCUMENTO)
);

/*==============================================================*/
/* Table: DOCUMENTO_AUTOR                                       */
/*==============================================================*/
create table DOCUMENTO_AUTOR (
   ID_AUTOR             NUMBER(15)            not null,
   ID_DOCUMENTO         NUMBER(10)
);

/*==============================================================*/
/* Table: DOCUMENTO_EDITOR                                      */
/*==============================================================*/
create table DOCUMENTO_EDITOR (
   ID_EDITOR            NUMBER(15),
   ID_DOCUMENTO         NUMBER(10)
);

/*==============================================================*/
/* Table: DOCUMENTO_MATERIA                                     */
/*==============================================================*/
create table DOCUMENTO_MATERIA (
   ID_DOCUMENTO         NUMBER(10),
   ID_MATERIA           VARCHAR(4)            not null
);

/*==============================================================*/
/* Table: EDITOR                                                */
/*==============================================================*/
create table EDITOR (
   ID_EDITOR            NUMBER(15)            not null,
   EDITOR               VARCHAR(40)           not null,
   constraint PK_EDITOR primary key (ID_EDITOR)
);

/*==============================================================*/
/* Table: FORMATO                                               */
/*==============================================================*/
create table FORMATO (
   ID_FORMATO           VARCHAR(5)            not null,
   FORMATO              VARCHAR(40)           not null,
   constraint PK_FORMATO primary key (ID_FORMATO)
);

/*==============================================================*/
/* Table: FUENTE                                                */
/*==============================================================*/
create table FUENTE (
   ID_FUENTE            VARCHAR(4)            not null,
   ID_TIPOFUENTE        VARCHAR(4)            not null,
   NOMBRE               VARCHAR(100)          not null,
   ESTADO               VARCHAR(1)           default 'A'  not null
      constraint CKC_ESTADO_FUENTE check (ESTADO in ('I','A')),
   constraint PK_FUENTE primary key (ID_FUENTE)
);

/*==============================================================*/
/* Table: HISTORIAL                                             */
/*==============================================================*/
create table HISTORIAL (
   ID_USERBIBLIO        NUMBER(6)             not null,
   ID_DOCUMENTO         NUMBER(10),
   FECHA                TIMESTAMP WITH LOCAL TIME ZONE
);

/*==============================================================*/
/* Table: IDIOMA                                                */
/*==============================================================*/
create table IDIOMA (
   ID_IDIOMA            VARCHAR(5)            not null,
   IDIOMA               VARCHAR(100)          not null,
   constraint PK_IDIOMA primary key (ID_IDIOMA)
);

/*==============================================================*/
/* Table: IMAGEN_DOCUMENTO                                      */
/*==============================================================*/
create table IMAGEN_DOCUMENTO (
   ID_DOCUMENTO         NUMBER(10)            not null,
   URL_IMG              VARCHAR(120)          not null
);

/*==============================================================*/
/* Table: MATERIA                                               */
/*==============================================================*/
create table MATERIA (
   ID_MATERIA           VARCHAR(4)            not null,
   NOMBRE               VARCHAR(100)          not null,
   constraint PK_MATERIA primary key (ID_MATERIA)
);

/*==============================================================*/
/* Table: PAIS                                                  */
/*==============================================================*/
create table PAIS (
   ID_PAIS              VARCHAR(6)            not null,
   NOMBRE               VARCHAR(50),
   constraint PK_PAIS primary key (ID_PAIS)
);

/*==============================================================*/
/* Table: PASSENCRYPT                                           */
/*==============================================================*/
create table PASSENCRYPT (
   IDPASSENCRYPT        varchar(3)            not null,
   TYPE_ENCRYPT         varchar(2)            not null,
   SCRIPTLINE           VARCHAR(200),
   ESTADO               VARCHAR(1)           default 'A'  not null
      constraint CKC_ESTADO_PASSENCR check (ESTADO in ('I','A')),
   constraint PK_PASSENCRYPT primary key (IDPASSENCRYPT)
);

/*==============================================================*/
/* Table: REPOSITORIO_BIBLIOTECA                                */
/*==============================================================*/
create table REPOSITORIO_BIBLIOTECA (
   ID_DOCUMENTO         NUMBER(10)            not null,
   ID_FUENTE            VARCHAR(4)            not null,
   FECHA_ACTUALIZACION  TIMESTAMP WITH LOCAL TIME ZONE  not null,
   ID_USER_LOG          NUMBER(6)             not null,
   ESTADO               VARCHAR(1)           default 'A'  not null
      constraint CKC_ESTADO_REPOSITO check (ESTADO in ('A','M'))
);

/*==============================================================*/
/* Table: SOLICITUDES                                           */
/*==============================================================*/
create table SOLICITUDES (
   NUM_SOLICITUD        NUMBER(5)             not null,
   ID_USERBIBLIO        NUMBER(6)             not null,
   SOLICITUD            VARCHAR(100)          not null,
   constraint PK_SOLICITUDES primary key (NUM_SOLICITUD, ID_USERBIBLIO)
);

/*==============================================================*/
/* Table: TIPO_FUENTE                                           */
/*==============================================================*/
create table TIPO_FUENTE (
   ID_TIPOFUENTE        VARCHAR(4)            not null,
   TIPO_FUENTE          VARCHAR(100)          not null,
   constraint PK_TIPO_FUENTE primary key (ID_TIPOFUENTE)
);

/*==============================================================*/
/* Table: TIPO_MATERIAL                                         */
/*==============================================================*/
create table TIPO_MATERIAL (
   ID_MATERIAL          VARCHAR(4)            not null,
   NOMBRE_MATERIAL      VARCHAR(40),
   constraint PK_TIPO_MATERIAL primary key (ID_MATERIAL)
);

/*==============================================================*/
/* Table: UNIVERSIDAD                                           */
/*==============================================================*/
create table UNIVERSIDAD (
   ID_UNIVERSIDAD       VARCHAR(6)            not null,
   ID_CIUDAD            VARCHAR(6),
   TELEFONO_PRINCIPAL   VARCHAR(11),
   DOMINIO_CORREO       VARCHAR(40),
   constraint PK_UNIVERSIDAD primary key (ID_UNIVERSIDAD)
);

/*==============================================================*/
/* Table: USUARIO_BIBLIOTECA                                    */
/*==============================================================*/
create table USUARIO_BIBLIOTECA (
   ID_USERBIBLIO        NUMBER(6)             not null,
   ID_ROL               VARCHAR(5)            not null,
   ID_USUARIO_UNI       VARCHAR(10)           not null,
   CORREO_INSTITUTO     VARCHAR(100)          not null,
   USERNAME             VARCHAR(11)           not null,
   PASS                 VARCHAR(40)           not null,
   IDPASSENCRYPT        VARCHAR(3),
   ID_UNIVERSIDAD       VARCHAR(6)            not null,
   ESTADO               VARCHAR(1)           default 'A'  not null
      constraint CKC_ESTADO_USUARIO_ check (ESTADO in ('I','A')),
   FECHA_REGISTRO       TIMESTAMP WITH LOCAL TIME ZONE  not null,
   FECHA_ACTUALIZACION  TIMESTAMP WITH LOCAL TIME ZONE,
   constraint PK_USUARIO_BIBLIOTECA primary key (ID_USERBIBLIO)
);

/*==============================================================*/
/* Table: USUARIO_ROL                                           */
/*==============================================================*/
create table USUARIO_ROL (
   ID_ROL               VARCHAR(5)            not null,
   ROL                  VARCHAR(20),
   constraint PK_USUARIO_ROL primary key (ID_ROL)
);

/*==============================================================*/
/* Table: USUARIO_UNIVERSIDAD                                   */
/*==============================================================*/
create table USUARIO_UNIVERSIDAD (
   ID_USUARIO           VARCHAR(10)           not null,
   ID_UNIVERSIDAD       VARCHAR(6)            not null,
   ID_ROL               VARCHAR(5),
   IDENTIFICACION       VARCHAR(12),
   NOMBRE               VARCHAR(11),
   APELLIDO             VARCHAR(40),
   CORREO_INSTITUTO     VARCHAR(100),
   constraint PK_USUARIO_UNIVERSIDAD primary key (ID_UNIVERSIDAD, ID_USUARIO)
);

alter table CIUDAD
   add constraint FK_CIUDAD_REFERENCE_PAIS foreign key (ID_PAIS)
      references PAIS (ID_PAIS);

alter table DOCUMENTO
   add constraint FK_DOCUMENT_REFERENCE_IDIOMA foreign key (ID_IDIOMA)
      references IDIOMA (ID_IDIOMA);

alter table DOCUMENTO
   add constraint FK_DOCUMENT_REFERENCE_TIPO_MAT foreign key (ID_MATERIAL)
      references TIPO_MATERIAL (ID_MATERIAL);

alter table DOCUMENTO
   add constraint FK_DOCUMENT_REFERENCE_USUARIO_ foreign key (ID_USER_LOG)
      references USUARIO_BIBLIOTECA (ID_USERBIBLIO);

alter table DOCUMENTO
   add constraint FK_DOCUMENT_REFERENCE_FORMATO foreign key (ID_FORMATO)
      references FORMATO (ID_FORMATO);

alter table DOCUMENTO_AUTOR
   add constraint FK_DOCAUT_REFERENCE_DOCUMENT foreign key (ID_DOCUMENTO)
      references DOCUMENTO (ID_DOCUMENTO);

alter table DOCUMENTO_AUTOR
   add constraint FK_DOCUMENT_REFERENCE_AUTOR foreign key (ID_AUTOR)
      references AUTOR (ID_AUTOR);

alter table DOCUMENTO_EDITOR
   add constraint FK_DOCUMENT_REFERENCE_EDITOR foreign key (ID_EDITOR)
      references EDITOR (ID_EDITOR);

alter table DOCUMENTO_EDITOR
   add constraint FK_DOCEDIT_REFERENCE_DOCUMENT foreign key (ID_DOCUMENTO)
      references DOCUMENTO (ID_DOCUMENTO);

alter table DOCUMENTO_MATERIA
   add constraint FK_DOCMAT_REFERENCE_DOCUMENT foreign key (ID_DOCUMENTO)
      references DOCUMENTO (ID_DOCUMENTO);

alter table DOCUMENTO_MATERIA
   add constraint FK_DOCUMENT_REFERENCE_MATERIA foreign key (ID_MATERIA)
      references MATERIA (ID_MATERIA);

alter table FUENTE
   add constraint FK_FUENTE_REFERENCE_TIPO_FUE foreign key (ID_TIPOFUENTE)
      references TIPO_FUENTE (ID_TIPOFUENTE);

alter table HISTORIAL
   add constraint FK_HISTORIA_REFERENCE_USUARIO_ foreign key (ID_USERBIBLIO)
      references USUARIO_BIBLIOTECA (ID_USERBIBLIO);

alter table HISTORIAL
   add constraint FK_HISTORIA_REFERENCE_DOCUMENT foreign key (ID_DOCUMENTO)
      references DOCUMENTO (ID_DOCUMENTO);

alter table IMAGEN_DOCUMENTO
   add constraint FK_IMAGEN_D_REFERENCE_DOCUMENT foreign key (ID_DOCUMENTO)
      references DOCUMENTO (ID_DOCUMENTO);

alter table REPOSITORIO_BIBLIOTECA
   add constraint FK_REPOSITO_REFERENCE_FUENTE foreign key (ID_FUENTE)
      references FUENTE (ID_FUENTE);

alter table REPOSITORIO_BIBLIOTECA
   add constraint FK_REPOSITO_REFERENCE_DOCUMENT foreign key (ID_DOCUMENTO)
      references DOCUMENTO (ID_DOCUMENTO);

alter table REPOSITORIO_BIBLIOTECA
   add constraint FK_REPOSITO_REFERENCE_USUARIO_ foreign key (ID_USER_LOG)
      references USUARIO_BIBLIOTECA (ID_USERBIBLIO);

alter table SOLICITUDES
   add constraint FK_SOLICITU_REFERENCE_USUARIO_ foreign key (ID_USERBIBLIO)
      references USUARIO_BIBLIOTECA (ID_USERBIBLIO);

alter table UNIVERSIDAD
   add constraint FK_UNIVERSI_REFERENCE_CIUDAD foreign key (ID_CIUDAD)
      references CIUDAD (ID_CIUDAD);

alter table USUARIO_BIBLIOTECA
   add constraint FK_USUARIO__REFERENCE_BIBLIOTE foreign key (ID_ROL)
      references BIBLIOTECA_ROL (ID_ROL);

alter table USUARIO_BIBLIOTECA
   add constraint FK_USUARIO__REFERENCE_PASSENCR foreign key (IDPASSENCRYPT)
      references PASSENCRYPT (IDPASSENCRYPT);

alter table USUARIO_BIBLIOTECA
   add constraint FK_USERU_REFERENCE_USUARIOBIB foreign key (ID_UNIVERSIDAD, ID_USUARIO_UNI)
      references USUARIO_UNIVERSIDAD (ID_UNIVERSIDAD, ID_USUARIO);

alter table USUARIO_UNIVERSIDAD
   add constraint FK_USUARIO__REFERENCE_UNIVERSI foreign key (ID_UNIVERSIDAD)
      references UNIVERSIDAD (ID_UNIVERSIDAD);

alter table USUARIO_UNIVERSIDAD
   add constraint FK_USERU_REFERENCE_USERROL foreign key (ID_ROL)
      references USUARIO_ROL (ID_ROL);

