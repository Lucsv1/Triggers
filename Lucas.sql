CREATE TABLE tb_aufitoria(
id NUMBER generated always as identity,
tabela VARCHAR2(30),
operacao VARCHAR2(30),
data DATE,
usuario VARCHAR2(30)
)

CREATE OR REPLACE TRIGGER trg_auditoria
AFTER INSERT OR UPDATE OR DELETE ON pedido_novos?
FOR EACH ROW
DECLARE
  operacao     VARCHAR2(30);?
  nome_usuario VARCHAR2(100);?
BEGIN
 IF INSERTING THEN?
 operacao := 'INSERT';
  ELSIF UPDATING THEN?
    operacao := 'UPDATE';?
  ELSIF DELETING THEN?
    operacao := 'DELETE';?
  END IF;?
  
  nome_usuario := SYS_CONTEXT('USERENV', 'SESSION_USER');?
  
  INSERT INTO TB_AUDITORIA?

    (tabela, operacao, DATA, USUARIO)?

  VALUES?

    ('PEDIDO_NOVOS', operacao, sysdate, nome_usuario);?

END;?
 

