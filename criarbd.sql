SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `escola` DEFAULT CHARACTER SET utf8 ;
USE `escola` ;

-- -----------------------------------------------------
-- Table `escola`.`Pessoa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `escola`.`Pessoa` (
  `id_pessoa` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `cpf` VARCHAR(14) NOT NULL COMMENT 'Gravar com máscara (000.000.000-00)',
  `dt_nascimento` DATETIME NOT NULL,
  `sexo` INT NOT NULL,
  `estado_civil` INT NOT NULL,
  `nome_mae` VARCHAR(100) NOT NULL,
  `nome_pai` VARCHAR(100) NULL,
  PRIMARY KEY (`id_pessoa`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `escola`.`Aluno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `escola`.`Aluno` (
  `id_aluno` INT NOT NULL AUTO_INCREMENT,
  `dt_cadastro` DATETIME NOT NULL,
  `id_pessoa` INT NOT NULL,
  PRIMARY KEY (`id_aluno`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `escola`.`Turma`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `escola`.`Turma` (
  `id_turma` INT NOT NULL AUTO_INCREMENT,
  `dt_incial` DATETIME NOT NULL,
  `dt_final` DATETIME NOT NULL,
  `ano` INT NOT NULL,
  `periodo` INT NOT NULL,
  `descricao` VARCHAR(50) NOT NULL,
  `id_curso` INT NOT NULL,
  PRIMARY KEY (`id_turma`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `escola`.`Curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `escola`.`Curso` (
  `id_curso` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(100) NULL,
  PRIMARY KEY (`id_curso`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `escola`.`Professor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `escola`.`Professor` (
  `id_professor` INT NOT NULL AUTO_INCREMENT,
  `formacao` VARCHAR(45) NOT NULL,
  `id_pessoa` INT NOT NULL,
  PRIMARY KEY (`id_professor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `escola`.`AlunoTurma`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `escola`.`AlunoTurma` (
  `id_aluno` INT NOT NULL,
  `id_turma` INT NOT NULL,
  `dt_matricula` DATETIME NOT NULL,
  `dt_cancelamento` DATETIME NOT NULL,
  PRIMARY KEY (`id_aluno`, `id_turma`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `escola`.`Disciplina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `escola`.`Disciplina` (
  `id_disciplina` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `numero` INT NOT NULL,
  `creditos` INT NOT NULL,
  PRIMARY KEY (`id_disciplina`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `escola`.`Prof_turm_disc`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `escola`.`Prof_turm_disc` (
  `id_professor` INT NOT NULL,
  `id_turma` INT NOT NULL,
  `id_disciplina` INT NOT NULL,
  PRIMARY KEY (`id_professor`, `id_turma`, `id_disciplina`)
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `escola`.`Frequencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `escola`.`Frequencia` (
  `id_aluno` INT NOT NULL,
  `id_turma` INT NOT NULL,
  `id_disciplina` INT NOT NULL,
  `dt_frequencia` DATETIME NOT NULL,
  `frequencia` INT NOT NULL DEFAULT 0 COMMENT '0 - presente\n1 - ausente',
  PRIMARY KEY (`id_aluno`, `id_turma`, `id_disciplina`, `dt_frequencia`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `escola`.`Avaliacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `escola`.`Avaliacao` (
  `id_avaliacao` INT NOT NULL,
  `descricacao` VARCHAR(45) NOT NULL,
  `valor` DOUBLE NOT NULL,
  `observacao` TEXT NULL,
  PRIMARY KEY (`id_avaliacao`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `escola`.`AvaliacaoTurma`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `escola`.`AvaliacaoTurma` (
  `id_avaliacao` INT NOT NULL,
  `id_aluno` INT NOT NULL,
  `id_turma` INT NOT NULL,
  `id_disciplina` INT NOT NULL,
  `dt_avalicacao` DATETIME NOT NULL,
  `nota` DOUBLE NOT NULL,
  PRIMARY KEY (`id_avaliacao`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

SELECT * FROM pessoa;