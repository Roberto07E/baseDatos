DROP DATABASE IF EXISTS tiendaa;


CREATE DATABASE tiendaa;

USE tiendaa;

CREATE TABLE usuarios (
  id_usuario int(10) UNSIGNED NOT NULL,
  nombre_usuario varchar(50) NOT NULL,
  apellido_usuario varchar(50) NOT NULL,
  correo_usuario varchar(100) NOT NULL,
  clave_usuario varchar(10) NOT NULL,
  fecha_registro datetime NOT NULL DEFAULT current_timestamp()
) ;


CREATE TABLE clientes (
  id_cliente int(10) UNSIGNED NOT NULL,
  nombre_cliente varchar(50) NOT NULL,
  apellido_cliente varchar(50) NOT NULL,
  dui_cliente varchar(10) NOT NULL,
  correo_cliente varchar(100) NOT NULL,
  telefono_cliente varchar(9) NOT NULL,
  direccion_cliente varchar(250) NOT NULL,
  nacimiento_cliente date NOT NULL,
  clave_cliente varchar(100) NOT NULL,
  estado_cliente tinyint(1) NOT NULL DEFAULT 1,
  fecha_registro date NOT NULL DEFAULT current_timestamp()
) ;


CREATE TABLE categorias (

  id_categoria int(10) UNSIGNED NOT NULL,
  nombre_categoria varchar(50) NOT NULL,
  descripcion_categoria varchar(250) DEFAULT NULL,
  imagen_categoria varchar(25) NOT NULL
) ;


CREATE TABLE productos (

  id_producto int(10) UNSIGNED NOT NULL,
  nombre_producto varchar(50) NOT NULL,
  descripcion_producto varchar(250) NOT NULL,
  precio_producto decimal(5,2) NOT NULL,
  existencias_producto int(10) UNSIGNED NOT NULL,
  imagen_producto varchar(25) NOT NULL,
  id_categoria int(10) UNSIGNED NOT NULL,
  estado_producto tinyint(1) NOT NULL,
  id_usuario int(10) UNSIGNED NOT NULL,

  fecha_registro date NOT NULL DEFAULT current_timestamp()
) ;

CREATE TABLE pedidos (

  id_pedido int(10) UNSIGNED NOT NULL,
  id_cliente int(10) UNSIGNED NOT NULL,
  direccion_pedido varchar(250) NOT NULL,
  estado_pedido enum('Pendiente','Finalizado','Entregado','Anulado') NOT NULL,
  fecha_registro date NOT NULL DEFAULT current_timestamp()
) ;


CREATE TABLE detalles_pedido (

  id_detalle int(10) UNSIGNED NOT NULL,
  id_producto int(10) UNSIGNED NOT NULL,
  cantidad_producto smallint(6) UNSIGNED NOT NULL,
  precio_producto decimal(5,2) UNSIGNED NOT NULL,
  id_pedido int(10) UNSIGNED NOT NULL
) ;

CREATE TABLE valoraciones (
id_valoracion int(10) UNSIGNED NOT NULL,

id_detalle int(10) UNSIGNED NOT NULL,
calificacion_producto varchar(250) NULL,
fecha_valoracion date NOT NULL,
estado_comentario boolean NOT NULL
) ;


ALTER TABLE productos
ADD CONSTRAINT fk_productos_categorias FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria);

ALTER TABLE productos
ADD CONSTRAINT fk_productos_usuarios FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario);

ALTER TABLE pedidos
ADD CONSTRAINT fk_pedidos_clientes FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente);

ALTER TABLE detalles_pedido
ADD CONSTRAINT fk_detalles_pedido_productos FOREIGN KEY (id_producto) REFERENCES productos(id_producto);

ALTER TABLE detalles_pedido
ADD CONSTRAINT fk_detalles_pedido_pedidos FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido);

