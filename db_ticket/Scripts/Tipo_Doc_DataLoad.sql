/*==============================================================*/
/* Table: TIPO_DOCUMENTO                                        */
/*==============================================================*/
/*create table TIPO_DOCUMENTO (
   ID_TIPDOC            VARCHAR(1)            not null,
   NOMBRE               VARCHAR(20)           not null,
   constraint PK_TIPO_DOCUMENTO primary key (ID_TIPDOC)
);*/

INSERT INTO TIPO_DOCUMENTO(ID_TIPODOC, NOMBRE)VALUES ('ABIS', 'Sistema Automático de Identificación por biometrías');
INSERT INTO TIPO_DOCUMENTO(ID_TIPODOC, NOMBRE)VALUES ('AFIS', 'Sistema Automático de Identificación de Impresiones Dactilares');
INSERT INTO TIPO_DOCUMENTO(ID_TIPODOC, NOMBRE)VALUES ('ANI', 'Archivo Nacional de Identificación');
INSERT INTO TIPO_DOCUMENTO(ID_TIPODOC, NOMBRE)VALUES ('CC', 'Cedula de ciudadanía');
INSERT INTO TIPO_DOCUMENTO(ID_TIPODOC, NOMBRE)VALUES ('CC PV', 'Cedula de ciudadanía de primera vez');
INSERT INTO TIPO_DOCUMENTO(ID_TIPODOC, NOMBRE)VALUES ('CC DUP', 'Duplicado de cédula de ciudadanía');
INSERT INTO TIPO_DOCUMENTO(ID_TIPODOC, NOMBRE)VALUES ('CC REN', 'Renovación de cédula de ciudadanía');
INSERT INTO TIPO_DOCUMENTO(ID_TIPODOC, NOMBRE)VALUES ('CC REC', 'Rectificación de cedula de ciudadanía');
INSERT INTO TIPO_DOCUMENTO(ID_TIPODOC, NOMBRE)VALUES ('CC DIG', 'Cédula digital');
INSERT INTO TIPO_DOCUMENTO(ID_TIPODOC, NOMBRE)VALUES ('CCT', 'Centro de consulta técnica');
INSERT INTO TIPO_DOCUMENTO(ID_TIPODOC, NOMBRE)VALUES ('DCU', 'Unidad de captura de datos en papel');
INSERT INTO TIPO_DOCUMENTO(ID_TIPODOC, NOMBRE)VALUES ('EIS', 'Estación integrada de servicios');
INSERT INTO TIPO_DOCUMENTO(ID_TIPODOC, NOMBRE)VALUES ('HLED-WEB', 'Herramienta Logística de Entrega de documentos vía web');
INSERT INTO TIPO_DOCUMENTO(ID_TIPODOC, NOMBRE)VALUES ('MTR', 'Manejador de Transacciones.');
INSERT INTO TIPO_DOCUMENTO(ID_TIPODOC, NOMBRE)VALUES ('NIP', 'Número de Identificación personal');
INSERT INTO TIPO_DOCUMENTO(ID_TIPODOC, NOMBRE)VALUES ('NUIP', 'Número Único de Identificación Personal');
INSERT INTO TIPO_DOCUMENTO(ID_TIPODOC, NOMBRE)VALUES ('SIC', 'Sistema de Información de Correspondencia');
INSERT INTO TIPO_DOCUMENTO(ID_TIPODOC, NOMBRE)VALUES ('SITAC', 'Sistema Integral de tramites al ciudadano (Cancillería)');
INSERT INTO TIPO_DOCUMENTO(ID_TIPODOC, NOMBRE)VALUES ('TI', 'Tarjeta de identidad');
INSERT INTO TIPO_DOCUMENTO(ID_TIPODOC, NOMBRE)VALUES ('TI PV', 'Tarjeta de identidad de primera vez');
INSERT INTO TIPO_DOCUMENTO(ID_TIPODOC, NOMBRE)VALUES ('TI DUP', 'Duplicado de tarjeta de identidad');
INSERT INTO TIPO_DOCUMENTO(ID_TIPODOC, NOMBRE)VALUES ('TI REN', 'Renovación de tarjeta de identidad');
INSERT INTO TIPO_DOCUMENTO(ID_TIPODOC, NOMBRE)VALUES ('TI REC', 'Rectificación de tarjeta de identidad');
