-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: tiendaa
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorias` (
  `id_categoria` int(10) unsigned NOT NULL,
  `nombre_categoria` varchar(50) NOT NULL,
  `descripcion_categoria` varchar(250) DEFAULT NULL,
  `imagen_categoria` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Electrónica','Productos electrónicos de última generación','electronica.jpg'),(2,'Ropa','Moda para todas las edades y estilos','ropa.jpg'),(3,'Hogar','Artículos para el hogar y decoración','hogar.jpg'),(4,'Alimentación','Productos alimenticios frescos y de calidad','alimentacion.jpg'),(5,'Belleza','Productos de belleza y cuidado personal','belleza.jpg'),(6,'Deporte','Equipamiento y accesorios deportivos','deporte.jpg'),(7,'Libros','Una amplia selección de libros de todos los géneros','libros.jpg'),(8,'Juguetes','Diversión para todas las edades','juguetes.jpg'),(9,'Electrodomésticos','Todo lo necesario para equipar tu hogar','electrodomesticos.jpg'),(10,'Muebles','Mobiliario para todas las áreas de tu hogar','muebles.jpg'),(11,'Calzado','Zapatos y zapatillas para toda la familia','calzado.jpg'),(12,'Accesorios','Complementos para dar el toque final a tu look','accesorios.jpg'),(13,'Viajes','Ofertas en viajes y experiencias inolvidables','viajes.jpg'),(14,'Mascotas','Productos y accesorios para tus mascotas','mascotas.jpg'),(15,'Herramientas','Herramientas para tus proyectos de bricolaje','herramientas.jpg'),(16,'Salud','Productos para el cuidado de la salud y el bienestar','salud.jpg'),(17,'Arte y Manualidades','Materiales para expresar tu creatividad','arte_manualidades.jpg'),(18,'Tecnología','Lo último en gadgets y dispositivos tecnológicos','tecnologia.jpg'),(19,'Instrumentos Musicales','Todo para los amantes de la música','instrumentos_musicales.jp'),(20,'Jardinería','Herramientas y productos para tu jardín','jardineria.jpg'),(21,'Moda Infantil','Ropa y accesorios para los más pequeños','moda_infantil.jpg'),(22,'Automóviles','Accesorios y productos para tu vehículo','automoviles.jpg'),(23,'Fotografía','Cámaras, accesorios y equipos fotográficos','fotografia.jpg'),(24,'Cosméticos','Productos de belleza y cuidado personal','cosmeticos.jpg'),(25,'Bicicletas','Todo para los aficionados al ciclismo','bicicletas.jpg');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientes` (
  `id_cliente` int(10) unsigned NOT NULL,
  `nombre_cliente` varchar(50) NOT NULL,
  `apellido_cliente` varchar(50) NOT NULL,
  `dui_cliente` varchar(10) NOT NULL,
  `correo_cliente` varchar(100) NOT NULL,
  `telefono_cliente` varchar(9) NOT NULL,
  `direccion_cliente` varchar(250) NOT NULL,
  `nacimiento_cliente` date NOT NULL,
  `clave_cliente` varchar(100) NOT NULL,
  `estado_cliente` tinyint(1) NOT NULL DEFAULT 1,
  `fecha_registro` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalles_pedido`
--

DROP TABLE IF EXISTS `detalles_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalles_pedido` (
  `id_detalle` int(10) unsigned NOT NULL,
  `id_producto` int(10) unsigned NOT NULL,
  `cantidad_producto` smallint(6) unsigned NOT NULL,
  `precio_producto` decimal(5,2) unsigned NOT NULL,
  `id_pedido` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalles_pedido`
--

LOCK TABLES `detalles_pedido` WRITE;
/*!40000 ALTER TABLE `detalles_pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalles_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedidos` (
  `id_pedido` int(10) unsigned NOT NULL,
  `id_cliente` int(10) unsigned NOT NULL,
  `direccion_pedido` varchar(250) NOT NULL,
  `estado_pedido` enum('Pendiente','Finalizado','Entregado','Anulado') NOT NULL,
  `fecha_registro` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productos` (
  `id_producto` int(10) unsigned NOT NULL,
  `nombre_producto` varchar(50) NOT NULL,
  `descripcion_producto` varchar(250) NOT NULL,
  `precio_producto` decimal(5,2) NOT NULL,
  `existencias_producto` int(10) unsigned NOT NULL,
  `imagen_producto` varchar(25) NOT NULL,
  `id_categoria` int(10) unsigned NOT NULL,
  `estado_producto` tinyint(1) NOT NULL,
  `id_usuario` int(10) unsigned NOT NULL,
  `fecha_registro` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'Teléfono inteligente','Teléfono inteligente de última generación con pantalla HD y cámara de alta resolución',599.99,100,'telefono.jpg',1,1,1,'2024-02-22'),(2,'Camiseta deportiva','Camiseta deportiva transpirable con tecnología de secado rápido',29.99,200,'camiseta.jpg',2,1,2,'2024-02-22'),(3,'Set de utensilios de cocina','Set de utensilios de cocina de acero inoxidable de alta calidad',49.99,50,'utensilios_cocina.jpg',3,1,3,'2024-02-22'),(4,'Aceite de oliva virgen extra','Aceite de oliva virgen extra de cosecha propia',9.99,300,'aceite_oliva.jpg',4,1,4,'2024-02-22'),(5,'Crema hidratante facial','Crema hidratante facial con ingredientes naturales y protección solar',19.99,150,'crema_hidratante.jpg',5,1,5,'2024-02-22'),(6,'Balón de fútbol','Balón de fútbol oficial de la liga, tamaño estándar',24.99,100,'balon_futbol.jpg',6,1,6,'2024-02-22'),(7,'Libro de ficción','Best-seller internacional de ciencia ficción',14.99,80,'libro_ficcion.jpg',7,1,7,'2024-02-22'),(8,'Juego de construcción','Juego de construcción con bloques de colores para estimular la creatividad',39.99,120,'juego_construccion.jpg',8,1,8,'2024-02-22'),(9,'Aspiradora robotizada','Aspiradora robotizada con sistema de navegación inteligente',199.99,30,'aspiradora.jpg',9,1,9,'2024-02-22'),(10,'Sofá de tres plazas','Sofá moderno y cómodo de tres plazas en color gris',499.99,20,'sofa.jpg',10,1,10,'2024-02-22'),(11,'Zapatillas deportivas','Zapatillas deportivas para correr con suela amortiguada',79.99,150,'zapatillas.jpg',11,1,11,'2024-02-22'),(1,'Teléfono inteligente','Teléfono inteligente de última generación con pantalla HD y cámara de alta resolución',599.99,100,'telefono.jpg',1,1,1,'2024-02-22'),(2,'Camiseta deportiva','Camiseta deportiva transpirable con tecnología de secado rápido',29.99,200,'camiseta.jpg',2,1,2,'2024-02-22'),(3,'Set de utensilios de cocina','Set de utensilios de cocina de acero inoxidable de alta calidad',49.99,50,'utensilios_cocina.jpg',3,1,3,'2024-02-22'),(4,'Aceite de oliva virgen extra','Aceite de oliva virgen extra de cosecha propia',9.99,300,'aceite_oliva.jpg',4,1,4,'2024-02-22'),(5,'Crema hidratante facial','Crema hidratante facial con ingredientes naturales y protección solar',19.99,150,'crema_hidratante.jpg',5,1,5,'2024-02-22'),(6,'Balón de fútbol','Balón de fútbol oficial de la liga, tamaño estándar',24.99,100,'balon_futbol.jpg',6,1,6,'2024-02-22'),(7,'Libro de ficción','Best-seller internacional de ciencia ficción',14.99,80,'libro_ficcion.jpg',7,1,7,'2024-02-22'),(8,'Juego de construcción','Juego de construcción con bloques de colores para estimular la creatividad',39.99,120,'juego_construccion.jpg',8,1,8,'2024-02-22'),(9,'Aspiradora robotizada','Aspiradora robotizada con sistema de navegación inteligente',199.99,30,'aspiradora.jpg',9,1,9,'2024-02-22'),(10,'Sofá de tres plazas','Sofá moderno y cómodo de tres plazas en color gris',499.99,20,'sofa.jpg',10,1,10,'2024-02-22'),(11,'Zapatillas deportivas','Zapatillas deportivas para correr con suela amortiguada',79.99,150,'zapatillas.jpg',11,1,11,'2024-02-22'),(1,'Teléfono inteligente','Teléfono inteligente de última generación con pantalla HD y cámara de alta resolución',599.99,100,'telefono.jpg',1,1,1,'2024-02-22'),(2,'Camiseta deportiva','Camiseta deportiva transpirable con tecnología de secado rápido',29.99,200,'camiseta.jpg',2,1,2,'2024-02-22'),(3,'Set de utensilios de cocina','Set de utensilios de cocina de acero inoxidable de alta calidad',49.99,50,'utensilios_cocina.jpg',3,1,3,'2024-02-22'),(4,'Aceite de oliva virgen extra','Aceite de oliva virgen extra de cosecha propia',9.99,300,'aceite_oliva.jpg',4,1,4,'2024-02-22'),(5,'Crema hidratante facial','Crema hidratante facial con ingredientes naturales y protección solar',19.99,150,'crema_hidratante.jpg',5,1,5,'2024-02-22'),(6,'Balón de fútbol','Balón de fútbol oficial de la liga, tamaño estándar',24.99,100,'balon_futbol.jpg',6,1,6,'2024-02-22'),(7,'Libro de ficción','Best-seller internacional de ciencia ficción',14.99,80,'libro_ficcion.jpg',7,1,7,'2024-02-22'),(8,'Juego de construcción','Juego de construcción con bloques de colores para estimular la creatividad',39.99,120,'juego_construccion.jpg',8,1,8,'2024-02-22'),(9,'Aspiradora robotizada','Aspiradora robotizada con sistema de navegación inteligente',199.99,30,'aspiradora.jpg',9,1,9,'2024-02-22'),(10,'Sofá de tres plazas','Sofá moderno y cómodo de tres plazas en color gris',499.99,20,'sofa.jpg',10,1,10,'2024-02-22'),(11,'Zapatillas deportivas','Zapatillas deportivas para correr con suela amortiguada',79.99,150,'zapatillas.jpg',11,1,11,'2024-02-22');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `id_usuario` int(10) unsigned NOT NULL,
  `nombre_usuario` varchar(50) NOT NULL,
  `apellido_usuario` varchar(50) NOT NULL,
  `correo_usuario` varchar(100) NOT NULL,
  `clave_usuario` varchar(10) NOT NULL,
  `fecha_registro` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Juan','Pérez','juan@example.com','123abc','2024-02-22 12:00:00'),(2,'María','González','maria@example.com','456def','2024-02-22 12:05:00'),(3,'Luis','Martínez','luis@example.com','789ghi','2024-02-22 12:10:00'),(4,'Ana','Rodríguez','ana@example.com','abc123','2024-02-22 12:15:00'),(5,'Carlos','López','carlos@example.com','def456','2024-02-22 12:20:00'),(6,'Laura','Hernández','laura@example.com','ghi789','2024-02-22 12:25:00'),(7,'Pedro','Díaz','pedro@example.com','123abc','2024-02-22 12:30:00'),(8,'Sofía','Alvarez','sofia@example.com','456def','2024-02-22 12:35:00'),(9,'Diego','Gómez','diego@example.com','789ghi','2024-02-22 12:40:00'),(10,'Elena','Fernández','elena@example.com','abc123','2024-02-22 12:45:00'),(11,'Javier','Sanchez','javier@example.com','def456','2024-02-22 12:50:00'),(12,'Paula','Ramírez','paula@example.com','ghi789','2024-02-22 12:55:00'),(13,'Miguel','Pérez','miguel@example.com','123abc','2024-02-22 13:00:00'),(14,'Isabel','García','isabel@example.com','456def','2024-02-22 13:05:00'),(15,'Antonio','Martín','antonio@example.com','789ghi','2024-02-22 13:10:00'),(16,'Carmen','López','carmen@example.com','abc123','2024-02-22 13:15:00'),(17,'Manuel','Hernández','manuel@example.com','def456','2024-02-22 13:20:00'),(18,'Raquel','Díaz','raquel@example.com','ghi789','2024-02-22 13:25:00'),(19,'Fernando','Alvarez','fernando@example.com','123abc','2024-02-22 13:30:00'),(20,'Natalia','Gómez','natalia@example.com','456def','2024-02-22 13:35:00'),(21,'Gabriel','López','gabriel@example.com','abc123','2024-02-22 13:40:00'),(22,'Alejandro','Martínez','alejandro@example.com','def456','2024-02-22 13:45:00'),(23,'Sara','Fernández','sara@example.com','ghi789','2024-02-22 13:50:00'),(24,'Daniel','González','daniel@example.com','abc123','2024-02-22 13:55:00'),(25,'Eva','Díaz','eva@example.com','def456','2024-02-22 14:00:00');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `valoraciones`
--

DROP TABLE IF EXISTS `valoraciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `valoraciones` (
  `id_valoracion` int(10) unsigned NOT NULL,
  `id_detalle` int(10) unsigned NOT NULL,
  `calificacion_producto` varchar(250) DEFAULT NULL,
  `fecha_valoracion` date NOT NULL,
  `estado_comentario` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `valoraciones`
--

LOCK TABLES `valoraciones` WRITE;
/*!40000 ALTER TABLE `valoraciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `valoraciones` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-07  9:55:56
