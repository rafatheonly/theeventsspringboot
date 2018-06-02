CREATE TABLE IF NOT EXISTS usuario (
  id BIGINT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(60) NOT NULL,
  cpf VARCHAR(14) NOT NULL,
  email VARCHAR(50) NOT NULL,
  senha VARCHAR(32) NOT NULL,
  foto VARCHAR(60) NULL,
  ativo TINYINT(1) NOT NULL,
  PRIMARY KEY (id))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS tipoevento (
  id BIGINT NOT NULL AUTO_INCREMENT,
  descricao VARCHAR(45) NULL,
  PRIMARY KEY (id))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS evento (
  id BIGINT NOT NULL AUTO_INCREMENT,
  titulo VARCHAR(45) NOT NULL,
  data VARCHAR(11) NOT NULL,
  descricao VARCHAR(255) NOT NULL,
  local VARCHAR(45) NOT NULL,
  foto VARCHAR(60) NULL,
  ativo TINYINT(1) NOT NULL,
  tipoevento_id BIGINT NOT NULL,
  PRIMARY KEY (id, tipoevento_id),
  INDEX fk_evento_tipoevento1_idx (tipoevento_id ASC),
  CONSTRAINT fk_evento_tipoevento1
    FOREIGN KEY (tipoevento_id)
    REFERENCES tipoevento (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS usuarioevento (
  id BIGINT NOT NULL AUTO_INCREMENT,
  usuario_id BIGINT NOT NULL,
  evento_id BIGINT NOT NULL,
  dataCriacao DATE NOT NULL,
  PRIMARY KEY (id, usuario_id, evento_id),
  INDEX fk_usuario_has_evento_evento1_idx (evento_id ASC),
  INDEX fk_usuario_has_evento_usuario_idx (usuario_id ASC),
  CONSTRAINT fk_usuario_has_evento_usuario
    FOREIGN KEY (usuario_id)
    REFERENCES usuario (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_usuario_has_evento_evento1
    FOREIGN KEY (evento_id)
    REFERENCES evento (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS comentario (
  id BIGINT NOT NULL AUTO_INCREMENT,
  usuario_id BIGINT NOT NULL,
  evento_id BIGINT NOT NULL,
  dataComentario DATE NOT NULL,
  comentario VARCHAR(255) NOT NULL,
  ativo TINYINT(1) NOT NULL,
  PRIMARY KEY (id, usuario_id, evento_id),
  INDEX fk_comentario_usuario1_idx (usuario_id ASC),
  INDEX fk_comentario_evento1_idx (evento_id ASC),
  CONSTRAINT fk_comentario_usuario1
    FOREIGN KEY (usuario_id)
    REFERENCES usuario (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_comentario_evento1
    FOREIGN KEY (evento_id)
    REFERENCES evento (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;