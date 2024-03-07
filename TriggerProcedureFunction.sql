DELIMITER |

CREATE PROCEDURE agregar_producto_verificado(IN id_detalle INT, IN id_producto INT, IN cantidad_producto INT, IN precio_producto decimal(5,2), IN id_pedido INT)
BEGIN
    -- Variable para guardar el valor de las existencias
    DECLARE cantidad_stock INT;
   
    -- Obtener la cantidad en stock disponible para ventas
    SELECT existencias_producto INTO cantidad_stock FROM productos WHERE id_producto = id_producto LIMIT 1;
   
    -- Verficar que el producto tenga existencias MAYORES O IGUALES a las que se quieren comprar
    IF cantidad_stock IS NOT NULL AND cantidad_stock >= cantidad_producto THEN
        -- Si hay suficientes se hace el INSERT en detalles
        INSERT INTO detalles_pedido (id_detalle, id_producto, cantidad_producto, precio_producto, id_pedido) VALUES (id_detalle, id_producto, cantidad_producto, precio_producto, id_pedido);
        SELECT 'Producto agregado con exito' AS message;
    ELSE
        -- Si no hay suficientes, NO INSERTA DATOS solo muestra mensaje
        SELECT 'No se pudo agregar el producto al pedido ya que no hay existencias suficientes' AS message;
    END IF;
END|

DELIMITER ;

DELIMITER |

CREATE FUNCTION verificar_existencias_producto(id_producto INT) RETURNS VARCHAR(100)

BEGIN
    -- Variable para guardar el valor de las existencias
    DECLARE cantidad_stock INT;
    -- Variable para escribir el resultado de la evaluacion: 'No disponible', 'Pocas existencias', 'Disponible'
    DECLARE status VARCHAR(100);

    -- Obtener la cantidad en existencias disponibles
    SELECT existencias_producto INTO cantidad_stock FROM productos WHERE id_producto = id_producto;

-- Si del producto hay 0 existencias
    IF cantidad_stock = 0 THEN
        SET status = 'No disponible';
-- Si del producto hay 5 o menos existencias
    ELSEIF cantidad_stock <= 5 THEN
        SET status = 'Pocas existencias';
-- Si del producto hay mas de 5 existencias
    ELSE
        SET status = 'Disponible';
    END IF;
-- Devuelve el valor de la variable de resultado de la evaluacion: 'No disponible', 'Pocas existencias', 'Disponible'
    RETURN status;
END|

DELIMITER ;

DELIMITER //

CREATE TRIGGER actualizar_existencias
AFTER INSERT ON detalles_pedido
FOR EACH ROW
BEGIN
    UPDATE productos
    SET existencias = existencias - NEW.cantidad
    WHERE producto_id = NEW.producto_id;
END//

DELIMITER ;
