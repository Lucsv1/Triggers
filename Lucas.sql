CREATE TABLE PEDIDO_NOVOS AS SELECT * FROM PEDIDO;

ALTER TABLE PEDIDO_NOVOS ADD STATUS VARCHAR(30);

SELECT * FROM PEDIDO_NOVOS;


CREATE OR REPLACE TRIGGER trg_pedido
  BEFORE INSERT ON pedido_novos
  FOR EACH ROW
BEGIN
IF :NEW.STATUS IS NULL THEN
:NEW.STATUS := 'novo Pedido';
END IF;
END;