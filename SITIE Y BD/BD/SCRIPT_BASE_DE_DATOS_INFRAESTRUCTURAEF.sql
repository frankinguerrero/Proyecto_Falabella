Create database BDINFRAESTRUCTURAEF;
USE BDINFRAESTRUCTURAEF;

create table Informe_Hard(
Id_InfoHard int primary key auto_increment,
Nombre_Compo varchar(20) null,
Tipo_Compo varchar(20) null,
Marca_Compo varchar(20) null,
Serial_Compo varchar(20) null,
Estado_Compo varchar(20) null,
Capacidad_Compo varchar(20) null
);

create table Hoja_Vida(
Id_Hoja_Vida int primary key auto_increment,
Id_TestConecFK int,
Id_InfoHardFK int,
Id_SOfk int,
Id_EquipoFK int,
Id_InfoSpecFK int
);

create table Equipo(
Id_Equipo int primary key auto_increment,
Tipo_Equi varchar(20) null,
Marca_Equi varchar(20) null,
Modelo_Equi varchar(20) null
);

create table Test_Conec(
Id_TestConec int primary key auto_increment,
Nombre_Host varchar(20) null,
Nombre_Red varchar(20) null,
Tipo_Conexion varchar(20) null,
Tipo_IP varchar(20) null,
Direccion_IP varchar(20) null,
Perfil_Red varchar(20) null,
Mascara varchar(20) null,
Puerta_Enlace varchar(20) null,
MAC varchar(20) null
);

create table SO(
Id_SO int primary key auto_increment,
Id_EstadoSoftFK int, 
SO varchar(20) null,
Licen_SO varchar(15) null,
MultipleSO varchar(5) null,
Service_Pack varchar(20) null,
Arquitectura varchar(15) null,
Contro_Comple varchar(5) null,
Parti_Disc varchar(10) null
); 

create table Soft_Especifico(
Id_InfoSpec int primary key auto_increment,
Tipo_Soft varchar(20) null,
Nombre_Sof varchar(20) null,
Version_Soft varchar(15) null,
Estado_Soft varchar(15) null,
Carac_Sof varchar(40) null,
Licenciado varchar(5) null,
FecLicencia date null,
Observaciones varchar(100) null
);

create table Bitacoras(
Id_Bitacora int primary key auto_increment,
Id_UsuarioFK int,
Causa varchar(20) null,
Fecha_Bi date null,
Falla varchar(100) null,
Id_EquipoFK int,
Observacion varchar(200) 
);

create table Incidencias(
Id_Incidencias int primary key auto_increment,
Id_UsuarioFK int,
Area varchar(20) not null,
Fecha_Inci date not null,
Incidencia varchar(100) not null,
Id_EquipoFK int
);

create table Usuarios(
Id_Usuario int primary key auto_increment, 
Tipo_Usuarios varchar(20) null,
Nombre_Usuario varchar(20) null,
Tipo_Documento varchar(30) null,
Nick_name varchar(20) null,
Email varchar(20) null,
Contraseña varchar(20) null,
Celular varchar(20) null
);

create table D_Entrada(
Id_Entrada int primary key auto_increment,
Id_Hoja_VidaFK int,
Id_UsuarioFK int,
Fech_Entrada date not null
);

create table D_Salida(
Id_Salida int primary key auto_increment,
Id_Hoja_VidaFK int,
Id_UsuarioFK int,
Fech_Sal date not null
);

ALTER TABLE Hoja_Vida
ADD CONSTRAINT FKInforme_HardHoja_Vida
FOREIGN KEY (Id_InfoHardFK)
REFERENCES Informe_Hard (Id_InfoHard);

ALTER TABLE Hoja_Vida
ADD CONSTRAINT FKTest_ConecHoja_Vida
FOREIGN KEY (Id_TestConecFK)
REFERENCES Test_Conec (Id_TestConec);

ALTER TABLE Hoja_Vida
ADD CONSTRAINT FKEquipoHoja_Vida
FOREIGN KEY (Id_EquipoFK)
REFERENCES Equipo (Id_Equipo);

ALTER TABLE Hoja_Vida
ADD CONSTRAINT FKSOHoja_Vida
FOREIGN KEY (Id_SOFK)
REFERENCES SO (Id_SO);

ALTER TABLE Hoja_Vida
ADD CONSTRAINT FKSoft_EspecificoHoja_Vida
FOREIGN KEY (Id_InfoSpecFK)
REFERENCES Soft_Especifico (Id_InfoSpec);

ALTER TABLE D_Entrada
ADD CONSTRAINT FKHoja_VidaD_Entrada
FOREIGN KEY (Id_Hoja_VidaFK)
REFERENCES Hoja_Vida (Id_Hoja_Vida);

ALTER TABLE D_Salida
ADD CONSTRAINT FKHoja_VidaD_Salida
FOREIGN KEY (Id_Hoja_VidaFK)
REFERENCES Hoja_Vida (Id_Hoja_Vida);

ALTER TABLE D_Entrada
ADD CONSTRAINT FKUsuariosD_Entrada
FOREIGN KEY (Id_UsuarioFK)
REFERENCES Usuarios (Id_Usuario);

ALTER TABLE D_Salida
ADD CONSTRAINT FKUsuariosD_Salida
FOREIGN KEY (Id_UsuarioFK)
REFERENCES Usuarios (Id_Usuario);

alter table Bitacoras
add constraint FKUsuariosBitacoras
foreign key (Id_UsuarioFK)
REFERENCES Usuarios (Id_Usuario);

alter table Incidencias
add constraint FKUsuariosIncidencias
foreign key (Id_UsuarioFK)
REFERENCES Usuarios (Id_Usuario);

alter table Bitacoras
add constraint FKEquipoBitacoras
foreign key (Id_EquipoFK)
REFERENCES Equipo (Id_Equipo);

alter table Incidencias
add constraint FKEquipoIncidencias
foreign key (Id_EquipoFK)
REFERENCES Equipo (Id_Equipo);
