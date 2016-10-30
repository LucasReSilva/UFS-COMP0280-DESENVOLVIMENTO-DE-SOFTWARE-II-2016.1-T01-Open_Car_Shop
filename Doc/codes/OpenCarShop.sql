-- MySQL Script generated by MySQL Workbench
-- 10/30/16 15:58:11
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema opencarshop
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `opencarshop` ;

-- -----------------------------------------------------
-- Schema opencarshop
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `opencarshop` DEFAULT CHARACTER SET utf8 ;
USE `opencarshop` ;

-- -----------------------------------------------------
-- Table `opencarshop`.`Endereco`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `opencarshop`.`Endereco` ;

CREATE TABLE IF NOT EXISTS `opencarshop`.`Endereco` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cep` VARCHAR(9) NULL DEFAULT '_____-___',
  `estado` CHAR(2) NOT NULL,
  `cidade` VARCHAR(45) NOT NULL,
  `bairro` VARCHAR(45) NOT NULL,
  `rua` VARCHAR(45) NULL,
  `numero` INT NULL,
  `complemento` VARCHAR(45) NULL,
  `tipo` CHAR(1) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `opencarshop`.`Funcionario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `opencarshop`.`Funcionario` ;

CREATE TABLE IF NOT EXISTS `opencarshop`.`Funcionario` (
  `cpf` VARCHAR(15) NOT NULL,
  `nome` VARCHAR(50) NOT NULL,
  `senha` VARCHAR(20) NOT NULL,
  `dataNascimento` DATE NULL,
  `email` VARCHAR(50) NULL,
  `telefone1` VARCHAR(45) NULL,
  `telefone2` VARCHAR(45) NULL,
  `endereco` INT NOT NULL,
  `ativo` TINYINT(1) NULL DEFAULT 1,
  PRIMARY KEY (`cpf`),
  INDEX `fk_Funcionario_Endereco1_idx` (`endereco` ASC),
  CONSTRAINT `fk_Funcionario_Endereco1`
    FOREIGN KEY (`endereco`)
    REFERENCES `opencarshop`.`Endereco` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `opencarshop`.`Contrato`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `opencarshop`.`Contrato` ;

CREATE TABLE IF NOT EXISTS `opencarshop`.`Contrato` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cargo` CHAR(1) NULL,
  `salario` DECIMAL(10,2) NULL,
  `dataInicio` DATE NULL,
  `dataTermino` DATE NULL,
  `funcionario` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id`, `funcionario`),
  INDEX `fk_Contrato_Funcionario1_idx` (`funcionario` ASC),
  CONSTRAINT `fk_Contrato_Funcionario1`
    FOREIGN KEY (`funcionario`)
    REFERENCES `opencarshop`.`Funcionario` (`cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `opencarshop`.`Cliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `opencarshop`.`Cliente` ;

CREATE TABLE IF NOT EXISTS `opencarshop`.`Cliente` (
  `cpf` VARCHAR(15) NOT NULL,
  `nome` VARCHAR(50) NOT NULL,
  `dataNascimento` DATETIME NULL,
  `email` VARCHAR(50) NULL,
  `telefone1` VARCHAR(45) GENERATED ALWAYS AS (),
  `telefone2` VARCHAR(45) NULL,
  `ativo` TINYINT(1) NULL DEFAULT 1,
  `endereco` INT NOT NULL,
  PRIMARY KEY (`cpf`),
  INDEX `fk_Cliente_Endereco1_idx` (`endereco` ASC),
  CONSTRAINT `fk_Cliente_Endereco1`
    FOREIGN KEY (`endereco`)
    REFERENCES `opencarshop`.`Endereco` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `opencarshop`.`Fornecedor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `opencarshop`.`Fornecedor` ;

CREATE TABLE IF NOT EXISTS `opencarshop`.`Fornecedor` (
  `cnpj` VARCHAR(15) NOT NULL,
  `razaoSocial` VARCHAR(50) NOT NULL,
  `descricao` VARCHAR(45) NULL,
  `email` VARCHAR(50) NULL,
  `telefone1` VARCHAR(45) GENERATED ALWAYS AS (),
  `telefone2` VARCHAR(45) NULL,
  `endereco` INT NOT NULL,
  `ativo` TINYINT(1) NULL DEFAULT 1,
  PRIMARY KEY (`cnpj`),
  INDEX `fk_Fornecedor_Endereco_idx` (`endereco` ASC),
  CONSTRAINT `fk_Fornecedor_Endereco`
    FOREIGN KEY (`endereco`)
    REFERENCES `opencarshop`.`Endereco` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `opencarshop`.`Veiculo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `opencarshop`.`Veiculo` ;

CREATE TABLE IF NOT EXISTS `opencarshop`.`Veiculo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `modelo` VARCHAR(45) NOT NULL,
  `ano` YEAR NOT NULL,
  `versao` VARCHAR(45) NOT NULL,
  `opcionalVidrosEletricos` TINYINT(1) NULL DEFAULT 0,
  `opcionalTravasEletricas` TINYINT(1) NULL DEFAULT 0,
  `opcionalAr` TINYINT(1) NULL DEFAULT 0,
  `opcionalFarolNeblina` TINYINT(1) NULL DEFAULT 0,
  `opcionalAltoFalantes` TINYINT(1) NULL DEFAULT 0,
  `quantidade` INT NULL,
  `valor` DECIMAL(10,2) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `opencarshop`.`Peca`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `opencarshop`.`Peca` ;

CREATE TABLE IF NOT EXISTS `opencarshop`.`Peca` (
  `id` INT NOT NULL,
  `descricao` VARCHAR(45) NULL,
  `valor` VARCHAR(45) NULL,
  `tipo` CHAR(1) NULL,
  `quantidade` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `opencarshop`.`Servico`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `opencarshop`.`Servico` ;

CREATE TABLE IF NOT EXISTS `opencarshop`.`Servico` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(45) NOT NULL,
  `valorPadrao` DECIMAL(10,2) NOT NULL,
  `valorFixo` TINYINT(1) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `opencarshop`.`OrcamentoServico`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `opencarshop`.`OrcamentoServico` ;

CREATE TABLE IF NOT EXISTS `opencarshop`.`OrcamentoServico` (
  `id` INT NOT NULL,
  `placa` VARCHAR(45) NOT NULL,
  `data` DATE NULL,
  `funcionario` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id`, `funcionario`),
  INDEX `fk_OrcamentoServico_Funcionario1_idx` (`funcionario` ASC),
  CONSTRAINT `fk_OrcamentoServico_Funcionario1`
    FOREIGN KEY (`funcionario`)
    REFERENCES `opencarshop`.`Funcionario` (`cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `opencarshop`.`ServicoSelecionado`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `opencarshop`.`ServicoSelecionado` ;

CREATE TABLE IF NOT EXISTS `opencarshop`.`ServicoSelecionado` (
  `orcamento` INT NOT NULL,
  `servico` INT NOT NULL,
  PRIMARY KEY (`orcamento`, `servico`),
  INDEX `fk_OrcamentoServico_has_Servico_Servico1_idx` (`servico` ASC),
  INDEX `fk_OrcamentoServico_has_Servico_OrcamentoServico1_idx` (`orcamento` ASC),
  CONSTRAINT `fk_OrcamentoServico_has_Servico_OrcamentoServico1`
    FOREIGN KEY (`orcamento`)
    REFERENCES `opencarshop`.`OrcamentoServico` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_OrcamentoServico_has_Servico_Servico1`
    FOREIGN KEY (`servico`)
    REFERENCES `opencarshop`.`Servico` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `opencarshop`.`VeiculoFornecido`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `opencarshop`.`VeiculoFornecido` ;

CREATE TABLE IF NOT EXISTS `opencarshop`.`VeiculoFornecido` (
  `Fornecedor_cnpj` VARCHAR(15) NOT NULL,
  `Veiculo_id` INT NOT NULL,
  PRIMARY KEY (`Fornecedor_cnpj`, `Veiculo_id`),
  INDEX `fk_Fornecedor_has_Veiculo_Veiculo1_idx` (`Veiculo_id` ASC),
  INDEX `fk_Fornecedor_has_Veiculo_Fornecedor1_idx` (`Fornecedor_cnpj` ASC),
  CONSTRAINT `fk_Fornecedor_has_Veiculo_Fornecedor1`
    FOREIGN KEY (`Fornecedor_cnpj`)
    REFERENCES `opencarshop`.`Fornecedor` (`cnpj`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Fornecedor_has_Veiculo_Veiculo1`
    FOREIGN KEY (`Veiculo_id`)
    REFERENCES `opencarshop`.`Veiculo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `opencarshop`.`PecaForncida`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `opencarshop`.`PecaForncida` ;

CREATE TABLE IF NOT EXISTS `opencarshop`.`PecaForncida` (
  `fornecedor` VARCHAR(15) NOT NULL,
  `peca` INT NOT NULL,
  PRIMARY KEY (`fornecedor`, `peca`),
  INDEX `fk_Fornecedor_has_Peca_Peca1_idx` (`peca` ASC),
  INDEX `fk_Fornecedor_has_Peca_Fornecedor1_idx` (`fornecedor` ASC),
  CONSTRAINT `fk_Fornecedor_has_Peca_Fornecedor1`
    FOREIGN KEY (`fornecedor`)
    REFERENCES `opencarshop`.`Fornecedor` (`cnpj`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Fornecedor_has_Peca_Peca1`
    FOREIGN KEY (`peca`)
    REFERENCES `opencarshop`.`Peca` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `opencarshop`.`PecaNecessarias`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `opencarshop`.`PecaNecessarias` ;

CREATE TABLE IF NOT EXISTS `opencarshop`.`PecaNecessarias` (
  `peca` INT NOT NULL,
  `orcamentoServico` INT NOT NULL,
  PRIMARY KEY (`peca`, `orcamentoServico`),
  INDEX `fk_Peca_has_OrcamentoServico_OrcamentoServico1_idx` (`orcamentoServico` ASC),
  INDEX `fk_Peca_has_OrcamentoServico_Peca1_idx` (`peca` ASC),
  CONSTRAINT `fk_Peca_has_OrcamentoServico_Peca1`
    FOREIGN KEY (`peca`)
    REFERENCES `opencarshop`.`Peca` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Peca_has_OrcamentoServico_OrcamentoServico1`
    FOREIGN KEY (`orcamentoServico`)
    REFERENCES `opencarshop`.`OrcamentoServico` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `opencarshop`.`OrdemServico`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `opencarshop`.`OrdemServico` ;

CREATE TABLE IF NOT EXISTS `opencarshop`.`OrdemServico` (
  `id` INT NOT NULL,
  `data` VARCHAR(45) NULL,
  `valorFinal` DECIMAL(10,2) NULL,
  `desconto` DECIMAL(6,2) NULL,
  `orcamento` INT NOT NULL,
  `cliente` VARCHAR(15) NOT NULL,
  `funcionario` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id`, `orcamento`, `cliente`, `funcionario`),
  INDEX `fk_OrdemServico_OrcamentoServico1_idx` (`orcamento` ASC),
  INDEX `fk_OrdemServico_Cliente1_idx` (`cliente` ASC),
  INDEX `fk_OrdemServico_Funcionario1_idx` (`funcionario` ASC),
  CONSTRAINT `fk_OrdemServico_OrcamentoServico1`
    FOREIGN KEY (`orcamento`)
    REFERENCES `opencarshop`.`OrcamentoServico` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_OrdemServico_Cliente1`
    FOREIGN KEY (`cliente`)
    REFERENCES `opencarshop`.`Cliente` (`cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_OrdemServico_Funcionario1`
    FOREIGN KEY (`funcionario`)
    REFERENCES `opencarshop`.`Funcionario` (`cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `opencarshop`.`Venda`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `opencarshop`.`Venda` ;

CREATE TABLE IF NOT EXISTS `opencarshop`.`Venda` (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `funcionario` VARCHAR(15) NOT NULL,
  `cliente` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`codigo`),
  INDEX `fk_Funcionario_has_Cliente_Cliente1_idx` (`cliente` ASC),
  INDEX `fk_Funcionario_has_Cliente_Funcionario1_idx` (`funcionario` ASC),
  CONSTRAINT `fk_Funcionario_has_Cliente_Funcionario1`
    FOREIGN KEY (`funcionario`)
    REFERENCES `opencarshop`.`Funcionario` (`cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Funcionario_has_Cliente_Cliente1`
    FOREIGN KEY (`cliente`)
    REFERENCES `opencarshop`.`Cliente` (`cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `opencarshop`.`ItemVeiculo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `opencarshop`.`ItemVeiculo` ;

CREATE TABLE IF NOT EXISTS `opencarshop`.`ItemVeiculo` (
  `veiculo` INT NOT NULL,
  `valorFinal` DECIMAL(10,2) NULL,
  `chasi` VARCHAR(45) NULL,
  `desconto` DECIMAL(6,2) NULL,
  `venda` INT NOT NULL,
  PRIMARY KEY (`veiculo`, `venda`),
  INDEX `fk_Veiculo_has_Funcionario_Veiculo1_idx` (`veiculo` ASC),
  INDEX `fk_ItemVeiculo_Venda1_idx` (`venda` ASC),
  CONSTRAINT `fk_Veiculo_has_Funcionario_Veiculo1`
    FOREIGN KEY (`veiculo`)
    REFERENCES `opencarshop`.`Veiculo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ItemVeiculo_Venda1`
    FOREIGN KEY (`venda`)
    REFERENCES `opencarshop`.`Venda` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `opencarshop`.`ItemPeca`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `opencarshop`.`ItemPeca` ;

CREATE TABLE IF NOT EXISTS `opencarshop`.`ItemPeca` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `valorFinal` DECIMAL(10,2) NULL,
  `desconto` DECIMAL(6,2) NULL,
  `peca` INT NOT NULL,
  `venda` INT NOT NULL,
  PRIMARY KEY (`id`, `peca`, `venda`),
  INDEX `fk_ItemPeca_Peca1_idx` (`peca` ASC),
  INDEX `fk_ItemPeca_Venda1_idx` (`venda` ASC),
  CONSTRAINT `fk_ItemPeca_Peca1`
    FOREIGN KEY (`peca`)
    REFERENCES `opencarshop`.`Peca` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ItemPeca_Venda1`
    FOREIGN KEY (`venda`)
    REFERENCES `opencarshop`.`Venda` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
