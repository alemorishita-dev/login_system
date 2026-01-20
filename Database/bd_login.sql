/******************************************************************************/
/* NOME: Script de Criação de Base de Dados - Sistema de Login                */
/* DATA: 2026-01-20                                                           */
/* BANCO: Firebird 2.5+                                                       */
/******************************************************************************/

/* 1. CRIAÇÃO DA TABELA DE USUÁRIOS */
/* Adicionado tratamento para evitar erro se a tabela já existir em alguns gerenciadores */

CREATE TABLE USUARIOS (
    ID      INTEGER NOT NULL,
    NOME    VARCHAR(150) NOT NULL,
    EMAIL   VARCHAR(100) NOT NULL,
    LOGIN   VARCHAR(50) NOT NULL,
    SENHA   VARCHAR(100) NOT NULL, -- Aumentado para suportar HASH (SHA-256) no futuro
    ATIVO   CHAR(1) DEFAULT 'S' NOT NULL,
    
    CONSTRAINT PK_USUARIOS PRIMARY KEY (ID),
    CONSTRAINT UNQ_USUARIOS_LOGIN UNIQUE (LOGIN),
    CONSTRAINT CHK_USUARIOS_ATIVO CHECK (ATIVO IN ('S', 'N')) -- Garante apenas S ou N
);

/* Comentários nos campos para documentação automática */
COMMENT ON TABLE USUARIOS IS 'Tabela responsavel por armazenar as credenciais de acesso ao sistema.';
COMMENT ON COLUMN USUARIOS.ATIVO IS 'Define se o usuario pode logar (S - Sim / N - Nao).';

/* 2. SEQUENCIADOR (GENERATOR) */
CREATE GENERATOR GEN_USUARIOS_ID;
SET GENERATOR GEN_USUARIOS_ID TO 0;

/* 3. TRIGGER PARA AUTO-INCREMENTO */
SET TERM ^ ;

CREATE TRIGGER BI_USUARIOS_ID FOR USUARIOS
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
    -- Se o ID não for informado, busca o próximo valor do Generator
    IF (NEW.ID IS NULL OR NEW.ID = 0) THEN
        NEW.ID = NEXT VALUE FOR GEN_USUARIOS_ID;
END^

SET TERM ; ^

/* 4. CARGA INICIAL (SEED) */
/* Usando UPDATE OR INSERT para evitar erro de duplicidade ao rodar o script novamente */
UPDATE OR INSERT INTO USUARIOS (ID, NOME, EMAIL, LOGIN, SENHA, ATIVO)
VALUES (1, 'Administrador', 'admin@sistema.com.br', 'admin', '123', 'S')
MATCHING (ID);

COMMIT;