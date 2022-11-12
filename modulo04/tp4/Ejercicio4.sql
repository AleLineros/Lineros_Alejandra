ejercicio4

-- se creo un DER con datos otorgados por la catedra, correspondiente al ejercicio 1

-- Schema Ejercicio1
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Ejercicio1` DEFAULT CHARACTER SET utf8 ;
USE `Ejercicio1` ;

-- -----------------------------------------------------
-- Table `Ejercicio1`.`ALUMNO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ejercicio1`.`ALUMNO` (
  `id_Matrícua` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `DNI` VARCHAR(45) NOT NULL,
  `FechaNacimiento` DATE NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_Matrícua`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ejercicio1`.`CURSO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ejercicio1`.`CURSO` (
  `id_Curso` INT NOT NULL AUTO_INCREMENT,
  `NOMBRE` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_Curso`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ejercicio1`.`PROFESORES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ejercicio1`.`PROFESORES` (
  `id_Profesor` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `Especialidad` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_Profesor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ejercicio1`.`CURSO_PROFESOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ejercicio1`.`CURSO_PROFESOR` (
  `idCURSO_PROFESOR` INT NOT NULL AUTO_INCREMENT,
  `PROFESORES_id_Profesor` INT NOT NULL,
  `CURSO_id_Curso` INT NOT NULL,
  PRIMARY KEY (`idCURSO_PROFESOR`),
  INDEX `fk_CURSO_PROFESOR_PROFESORES_idx` (`PROFESORES_id_Profesor` ASC) VISIBLE,
  INDEX `fk_CURSO_PROFESOR_CURSO1_idx` (`CURSO_id_Curso` ASC) VISIBLE,
  CONSTRAINT `fk_CURSO_PROFESOR_PROFESORES`
    FOREIGN KEY (`PROFESORES_id_Profesor`)
    REFERENCES `Ejercicio1`.`PROFESORES` (`id_Profesor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CURSO_PROFESOR_CURSO1`
    FOREIGN KEY (`CURSO_id_Curso`)
    REFERENCES `Ejercicio1`.`CURSO` (`id_Curso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ejercicio1`.`CURSO_ALUMNO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ejercicio1`.`CURSO_ALUMNO` (
  `id_CURSO_ALUMNO` INT NOT NULL AUTO_INCREMENT,
  `CURSO_id_Curso` INT NOT NULL,
  `ALUMNO_id_Matrícua` INT NOT NULL,
  PRIMARY KEY (`id_CURSO_ALUMNO`),
  INDEX `fk_CURSO_ALUMNO_CURSO1_idx` (`CURSO_id_Curso` ASC) VISIBLE,
  INDEX `fk_CURSO_ALUMNO_ALUMNO1_idx` (`ALUMNO_id_Matrícua` ASC) VISIBLE,
  CONSTRAINT `fk_CURSO_ALUMNO_CURSO1`
    FOREIGN KEY (`CURSO_id_Curso`)
    REFERENCES `Ejercicio1`.`CURSO` (`id_Curso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CURSO_ALUMNO_ALUMNO1`
    FOREIGN KEY (`ALUMNO_id_Matrícua`)
    REFERENCES `Ejercicio1`.`ALUMNO` (`id_Matrícua`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

--para cargar los datos en las correpondientes columnas se utilizo:
use ejercicio1;
INSERT INTO alumno   VALUES ("01","Bruno_Fernandez","47.003.532","08/04/2006","bfernandez@gmail.com"),
 ("02","Pedro Gonzalez","46.343.501","24/12/2005","pedrog@gmail.com"),
 ("03","Isabela Da Silva","47.576.184","30/10/2006","isadasilva@gmail.com");
SELECT * FROM alumno;
INSERT INTO curso VALUES ("01","Matematica","02"),
 ("02","Fisica","01"),
 ("02","Fisica","03"),
 ("03","Musica","01");
SELECT * FROM curso;
 INSERT INTO curso_alumno VALUES ("04","01","03");
 ("02","02","01"),
 ("03","03","01");
 SELECT * FROM curso_alumno;
 INSERT INTO profesores VALUES ("01","Pedro Rpman","fisica", "pedro@gmail.com"),
 ("02","Camila Ferreire","Matematica", "camilaf@gmail.com"),
 ("03","Lorena Farias","Musica","farlorena@gmailcom");
  SELECT * FROM profesores;
  INSERT INTO curso_profesor VALUES ("01","01","02"),
 ("02","02","01"),
 ("03","03","03");


-- para crear el DER correspondiente al ejercicio 2 se utilizo:
 -- Schema Ejercicio2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Ejercicio2` DEFAULT CHARACTER SET utf8 ;
USE `Ejercicio2` ;

-- -----------------------------------------------------
-- Table `Ejercicio2`.`PAIS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ejercicio2`.`PAIS` (
  `id_Pais` INT NOT NULL AUTO_INCREMENT,
  `Nombre_Pais` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_Pais`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ejercicio2`.`PROVINCIA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ejercicio2`.`PROVINCIA` (
  `id_Provincia` INT NOT NULL AUTO_INCREMENT,
  `Nombre_Provincia` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_Provincia`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ejercicio2`.`LOCALIDAD`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ejercicio2`.`LOCALIDAD` (
  `Codigo_Localidad` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `Codigo_Postal` VARCHAR(45) NOT NULL,
  `PROVINCIA_id_Provincia` INT NOT NULL,
  PRIMARY KEY (`Codigo_Localidad`),
  INDEX `fk_LOCALIDAD_PROVINCIA1_idx` (`PROVINCIA_id_Provincia` ASC) VISIBLE,
  CONSTRAINT `fk_LOCALIDAD_PROVINCIA1`
    FOREIGN KEY (`PROVINCIA_id_Provincia`)
    REFERENCES `Ejercicio2`.`PROVINCIA` (`id_Provincia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ejercicio2`.`EMPLEADO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ejercicio2`.`EMPLEADO` (
  `id_Empleado` INT NOT NULL AUTO_INCREMENT,
  `DNI` VARCHAR(45) NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `Fecha_alta` DATE NOT NULL,
  `LOCALIDAD_Codigo_Localidad` INT NOT NULL,
  PRIMARY KEY (`id_Empleado`),
  INDEX `fk_EMPLEADO_LOCALIDAD_idx` (`LOCALIDAD_Codigo_Localidad` ASC) VISIBLE,
  UNIQUE INDEX `DNI_UNIQUE` (`DNI` ASC) VISIBLE,
  CONSTRAINT `fk_EMPLEADO_LOCALIDAD`
    FOREIGN KEY (`LOCALIDAD_Codigo_Localidad`)
    REFERENCES `Ejercicio2`.`LOCALIDAD` (`Codigo_Localidad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ejercicio2`.`telefono_tipo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ejercicio2`.`telefono_tipo` (
  `id_Teletono` INT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(45) NOT NULL,
  `estado` ENUM("A", "B") NOT NULL DEFAULT '\"A\"',
  `numero` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_Teletono`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ejercicio2`.`Prov_PAIS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ejercicio2`.`Prov_PAIS` (
  `id_PORV_PAIS` INT NOT NULL AUTO_INCREMENT,
  `id_Provincia` INT NOT NULL,
  `id_Pais` INT NOT NULL,
  PRIMARY KEY (`id_PORV_PAIS`),
  INDEX `id_Provincia_idx` (`id_Provincia` ASC) VISIBLE,
  INDEX `id_Pais_idx` (`id_Pais` ASC) VISIBLE,
  CONSTRAINT `id_Provincia`
    FOREIGN KEY (`id_Provincia`)
    REFERENCES `Ejercicio2`.`PROVINCIA` (`id_Provincia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_Pais`
    FOREIGN KEY (`id_Pais`)
    REFERENCES `Ejercicio2`.`PAIS` (`id_Pais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ejercicio2`.`EMPLEADO_has_telefono_tipo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ejercicio2`.`EMPLEADO_has_telefono_tipo` (
  `EMPLEADO_id_Empleado` INT NOT NULL,
  `telefono_tipo_id_Teletono` INT NOT NULL,
  PRIMARY KEY (`EMPLEADO_id_Empleado`, `telefono_tipo_id_Teletono`),
  INDEX `fk_EMPLEADO_has_telefono_tipo_telefono_tipo1_idx` (`telefono_tipo_id_Teletono` ASC) VISIBLE,
  INDEX `fk_EMPLEADO_has_telefono_tipo_EMPLEADO1_idx` (`EMPLEADO_id_Empleado` ASC) VISIBLE,
  CONSTRAINT `fk_EMPLEADO_has_telefono_tipo_EMPLEADO1`
    FOREIGN KEY (`EMPLEADO_id_Empleado`)
    REFERENCES `Ejercicio2`.`EMPLEADO` (`id_Empleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_EMPLEADO_has_telefono_tipo_telefono_tipo1`
    FOREIGN KEY (`telefono_tipo_id_Teletono`)
    REFERENCES `Ejercicio2`.`telefono_tipo` (`id_Teletono`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- carga de datos en las diferentes columnas: 
use ejercicio2;

INSERT INTO pais VALUES ("01","Argentina"),("02","Brasil"),("03","España");
INSERT INTO provincia  VALUES ("01","Misiones", "01"),
("02","Salta", "01"),
("03","Entre Rios", "01");
INSERT INTO localidad  VALUES ("01","San Pedro ","3352","01"),
    ("02","Oran ","4530","02"),("03","Federacion ","3206","03");
INSERT INTO prov_pais VALUES ("01","01","03"), ("02","02","01"),("03","03","02");
INSERT INTO telefono_tipo  VALUES ("01","fijo","A","3764272503"), ("02","celular","A","+549348970");

SELECT * FROM empleado;
SELECT * FROM telefono_tipo;
INSERT INTO empleado   VALUES ("01","29.873.533","Carolina Rodriguez","caror@gmailcom","3","2022-11-09");
    INSERT INTO empleado   VALUES ("02","28.484.091","Pedro Mendez","pepe@gmailcom","01","2022-02-04");
   INSERT INTO empleado   VALUES  ("03","32.3007.501","Eugenia Gimenez","gimenez@gmailcom","02","2022-03-28");
SELECT * FROM provincia;
INSERT INTO empleado_has_telefono_tipo VALUES ("01","02"), ("02","01");



--Se diseñó una base de datos sobre la información de las reservas de una empresa dedicada al alquiler de automóviles:

-- Schema Ejercicio3
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Ejercicio3` DEFAULT CHARACTER SET utf8 ;
USE `Ejercicio3` ;

-- -----------------------------------------------------
-- Table `Ejercicio3`.`RESERVA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ejercicio3`.`RESERVA` (
  `id_RESERVA` INT NOT NULL AUTO_INCREMENT,
  `fecha inicio` DATE NOT NULL,
  `fecha final` DATE NOT NULL,
  `precio final` INT NOT NULL,
  PRIMARY KEY (`id_RESERVA`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ejercicio3`.`CLIENTE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ejercicio3`.`CLIENTE` (
  `id_CLIENTE` INT NOT NULL AUTO_INCREMENT,
  `DNI` VARCHAR(45) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id_CLIENTE`),
  UNIQUE INDEX `DNI_UNIQUE` (`DNI` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ejercicio3`.`COCHE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ejercicio3`.`COCHE` (
  `id_MATRICULA` INT NOT NULL AUTO_INCREMENT,
  `modelo` VARCHAR(45) NOT NULL,
  `color` VARCHAR(45) NOT NULL,
  `marca` VARCHAR(45) NOT NULL,
  `precio alquiler_x hora` INT NOT NULL,
  PRIMARY KEY (`id_MATRICULA`),
  UNIQUE INDEX `id_MATRICULA_UNIQUE` (`id_MATRICULA` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ejercicio3`.`RESERVA_COCHE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ejercicio3`.`RESERVA_COCHE` (
  `id_RESERVA_COCHE` INT NOT NULL AUTO_INCREMENT,
  `gasolina disponible` VARCHAR(45) NOT NULL,
  `RESERVA_id_RESERVA` INT NOT NULL,
  `COCHE_id_MATRICULA` INT NOT NULL,
  PRIMARY KEY (`id_RESERVA_COCHE`, `RESERVA_id_RESERVA`, `COCHE_id_MATRICULA`),
  INDEX `fk_RESERVA_COCHE_RESERVA1_idx` (`RESERVA_id_RESERVA` ASC) VISIBLE,
  INDEX `fk_RESERVA_COCHE_COCHE1_idx` (`COCHE_id_MATRICULA` ASC) VISIBLE,
  CONSTRAINT `fk_RESERVA_COCHE_RESERVA1`
    FOREIGN KEY (`RESERVA_id_RESERVA`)
    REFERENCES `Ejercicio3`.`RESERVA` (`id_RESERVA`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_RESERVA_COCHE_COCHE1`
    FOREIGN KEY (`COCHE_id_MATRICULA`)
    REFERENCES `Ejercicio3`.`COCHE` (`id_MATRICULA`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ejercicio3`.`RESERVA_CLIENTE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ejercicio3`.`RESERVA_CLIENTE` (
  `id_RESERVA_CLIENTE` INT NOT NULL AUTO_INCREMENT,
  `aval_cliente` VARCHAR(45) NOT NULL,
  `RESERVA_id_RESERVA` INT NOT NULL,
  `CLIENTE_id_CLIENTE` INT NOT NULL,
  PRIMARY KEY (`id_RESERVA_CLIENTE`, `RESERVA_id_RESERVA`, `CLIENTE_id_CLIENTE`),
  INDEX `fk_RESERVA_CLIENTE_RESERVA1_idx` (`RESERVA_id_RESERVA` ASC) VISIBLE,
  INDEX `fk_RESERVA_CLIENTE_CLIENTE1_idx` (`CLIENTE_id_CLIENTE` ASC) VISIBLE,
  CONSTRAINT `fk_RESERVA_CLIENTE_RESERVA1`
    FOREIGN KEY (`RESERVA_id_RESERVA`)
    REFERENCES `Ejercicio3`.`RESERVA` (`id_RESERVA`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_RESERVA_CLIENTE_CLIENTE1`
    FOREIGN KEY (`CLIENTE_id_CLIENTE`)
    REFERENCES `Ejercicio3`.`CLIENTE` (`id_CLIENTE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ejercicio3`.`TELEFONO_CLIENTE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ejercicio3`.`TELEFONO_CLIENTE` (
  `id_TELEFONO_CLIENTE` INT NOT NULL AUTO_INCREMENT,
  `numero` INT NOT NULL,
  `estado` ENUM("A", "B") NOT NULL DEFAULT 'A',
  `descripcion` VARCHAR(45) NOT NULL,
  `CLIENTE_id_CLIENTE` INT NOT NULL,
  PRIMARY KEY (`id_TELEFONO_CLIENTE`, `CLIENTE_id_CLIENTE`),
  INDEX `fk_TELEFONO_CLIENTE_CLIENTE1_idx` (`CLIENTE_id_CLIENTE` ASC) VISIBLE,
  CONSTRAINT `fk_TELEFONO_CLIENTE_CLIENTE1`
    FOREIGN KEY (`CLIENTE_id_CLIENTE`)
    REFERENCES `Ejercicio3`.`CLIENTE` (`id_CLIENTE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

--para cargar los datos se utilizo:
use ejercicio3;
INSERT INTO reserva VALUES ("01","2022-11-11","2022-11-13", "72.000"),("02","2022-11-15","2022-11-16", "10.320");
INSERT INTO coche VALUES ("01","Eco Sport xl","rojo", "Fort", "500","FMT587"),("02","Corsa Clasic","Azúl","Chevrolet", "430","LIR981"),
("03","Logan","Gris", "Renault","1000","AE44JO");
INSERT INTO cliente VALUES ("01", "29.873.666","Camilo Ferreira", "Horacio Quiroga 2333"),
("02", "17.007.605", "Mirta Flores", "Felix Bogado 1443"),
("03", "36.393.502", "Alex Quinteros", "Trincheras 2323");
INSERT INTO telefono_cliente VALUES ("01", "3764268898", "A", "celular", "02"),
("02", "3764436538", "A", "Fijo", "03");
INSERT INTO reserva_cliente VALUES ("01","--","01", "02"), ("02", "--", "02", "01");
INSERT INTO reserva_coche VALUES ("01", "45lt","01","01"), ("02","25lt", "02","02");
