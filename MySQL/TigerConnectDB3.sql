-- MySQL Script generated by MySQL Workbench
-- Wed Jul 12 14:39:14 2017
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema tcdb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema tcdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `tcdb` DEFAULT CHARACTER SET utf8 ;
USE `tcdb` ;

-- -----------------------------------------------------
-- Table `tcdb`.`user_info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tcdb`.`user_info` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(20) NOT NULL,
  `password` VARCHAR(20) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `tcdb`.`basic_info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tcdb`.`basic_info` (
  `user_id` INT NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `class_year` VARCHAR(45) NULL DEFAULT NULL,
  `description` LONGTEXT NULL DEFAULT NULL,
  `major` VARCHAR(45) NULL DEFAULT NULL,
  `residential_college` VARCHAR(45) NULL,
  PRIMARY KEY (`user_id`),
  INDEX `fk_basic_info_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_basic_info_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `tcdb`.`user_info` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `tcdb`.`conversation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tcdb`.`conversation` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_1` INT NOT NULL,
  `user_2` INT NOT NULL,
  `last_active` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `latest_message_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_conversation_user1_idx` (`user_1` ASC),
  INDEX `fk_conversation_user2_idx` (`user_2` ASC),
  CONSTRAINT `fk_conversation_user1`
    FOREIGN KEY (`user_1`)
    REFERENCES `tcdb`.`user_info` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_conversation_user2`
    FOREIGN KEY (`user_2`)
    REFERENCES `tcdb`.`user_info` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `tcdb`.`message`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tcdb`.`message` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `body` LONGTEXT NULL DEFAULT NULL,
  `conversation_id` INT NOT NULL,
  `is_sent` BIT(1) NOT NULL DEFAULT b'0',
  `is_recieved` BIT(1) NOT NULL DEFAULT b'0',
  `is_read` BIT(1) NOT NULL DEFAULT b'0',
  `time_sent` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `time_recieved` DATETIME NULL DEFAULT NULL,
  `sender_id` INT NOT NULL,
  `reciever_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_message_conversation1_idx` (`conversation_id` ASC),
  INDEX `fk_message_user1_idx` (`sender_id` ASC),
  INDEX `fk_message_user2_idx` (`reciever_id` ASC),
  CONSTRAINT `fk_message_conversation1`
    FOREIGN KEY (`conversation_id`)
    REFERENCES `tcdb`.`conversation` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_message_user1`
    FOREIGN KEY (`sender_id`)
    REFERENCES `tcdb`.`user_info` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_message_user2`
    FOREIGN KEY (`reciever_id`)
    REFERENCES `tcdb`.`user_info` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 32
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `tcdb`.`personality`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tcdb`.`personality` (
  `user_id` INT NOT NULL,
  `personality_attribute` VARCHAR(45) NOT NULL,
  `scale` INT NOT NULL,
  INDEX `fk_personality_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_personality_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `tcdb`.`user_info` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `tcdb`.`potential_connections`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tcdb`.`potential_connections` (
  `user_id` INT NOT NULL,
  `connection_id` INT NOT NULL,
  `is_seen` BIT(1) NOT NULL DEFAULT b'0',
  `is_deleted` BIT(1) NOT NULL DEFAULT b'0',
  `is_connected` BIT(1) NOT NULL DEFAULT b'0',
  `connection_rating` DECIMAL(2,0) NOT NULL DEFAULT '0',
  `last_active` DATETIME NOT NULL,
  PRIMARY KEY (`user_id`),
  INDEX `fk_potential_connections_user1_idx` (`user_id` ASC),
  INDEX `fk_potential_connections_user2_idx` (`connection_id` ASC),
  CONSTRAINT `fk_potential_connections_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `tcdb`.`user_info` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_potential_connections_user2`
    FOREIGN KEY (`connection_id`)
    REFERENCES `tcdb`.`user_info` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `tcdb`.`special_interests`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tcdb`.`special_interests` (
  `user_id` INT NOT NULL,
  `category_id` INT NOT NULL,
  `specific_interest` VARCHAR(45) NULL DEFAULT NULL,
  `rank` INT NOT NULL,
  INDEX `fk_special_interests_user1_idx` (`user_id` ASC),
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `rank_UNIQUE` (`rank` ASC),
  CONSTRAINT `fk_special_interests_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `tcdb`.`user_info` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8;

USE `tcdb` ;

-- -----------------------------------------------------
-- procedure checkMessages
-- -----------------------------------------------------

DELIMITER $$
USE `tcdb`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `checkMessages`(user INT)
BEGIN

UPDATE message 	
	SET time_recieved = CURRENT_TIMESTAMP
	WHERE user = reciever_id AND is_recieved = 0;

SELECT * FROM message WHERE user = reciever_id AND is_recieved = 0 GROUP BY sender_id ORDER BY time_sent DESC;

UPDATE message 	
	SET is_recieved = 1
	WHERE user = reciever_id AND is_recieved = 0;

END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure getProfile
-- -----------------------------------------------------

DELIMITER $$
USE `tcdb`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getProfile`(user_id INT)
BEGIN

/*SET @temp = (SELECT category_name 
				FROM special_interest_categories 
					RIGHT JOIN special_interests
					ON special_interest_categories.id = category_id
				WHERE user_id = user_id); */

SELECT * 
FROM user_info
	INNER JOIN basic_info ON user.id = user_id 
	INNER JOIN personality ON user.id = user_id
    INNER JOIN special_interests ON user.id = user_id
WHERE user.id = user_id;

-- SELECT @temp;
	

END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure sendMessage
-- -----------------------------------------------------

DELIMITER $$
USE `tcdb`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sendMessage`(sender_id INT, reciever_id INT, mess_body LONGTEXT)
BEGIN

-- if conversation DOES exist--
IF EXISTS (SELECT id FROM conversation WHERE user_1 = sender_id AND user_2 = reciever_id OR user_2 = sender_id AND user_1 = reciever_id)
THEN
	SET @convo_id = (SELECT id FROM conversation WHERE user_1 = sender_id AND user_2 = reciever_id OR user_2 = sender_id AND user_1 = reciever_id);
    INSERT INTO message 
    (body, conversation_id, sender_id, reciever_id, time_sent)
    VALUES
    (mess_body, @convo_id, sender_id, reciever_id, CURRENT_TIMESTAMP);
    
	UPDATE conversation
	SET latest_message_id = LAST_INSERT_ID(),
		last_active = CURRENT_TIMESTAMP
    WHERE id = @convo_id;
    
-- if conversation DOES NOT exist--
-- create convo--    
ELSE
	INSERT INTO conversation
	(user_1, user_2, last_active)
	VALUES
	(sender_id, reciever_id, CURRENT_TIMESTAMP);
    SET @convo_id = LAST_INSERT_ID();
	-- create first message--
	INSERT INTO message 
	(body, conversation_id, sender_id, reciever_id, time_sent)
	VALUES
	(mess_body, @convo_id, sender_id, reciever_id, CURRENT_TIMESTAMP);

END IF;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure showConversation
-- -----------------------------------------------------

DELIMITER $$
USE `tcdb`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `showConversation`(user_current INT, user_B INT)
BEGIN
SET @convo_id = (SELECT id FROM conversation WHERE user_1 = user_current AND user_2 = user_B OR user_2 = user_current AND user_1 = user_B);
SET @latest_message_id = (SELECT latest_message_id FROM conversation WHERE user_1 = user_current AND user_2 = user_B OR user_2 = user_current AND user_1 = user_B);

SELECT *
	FROM message 
	WHERE conversation_id = @convo_id 
	GROUP BY id
    ORDER BY time_sent DESC;
    
UPDATE message
	SET is_read = 1
	WHERE reciever_id = user_current AND is_read = 0;
    
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure unreadMessages
-- -----------------------------------------------------

DELIMITER $$
USE `tcdb`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `unreadMessages`(user_current int)
BEGIN

SELECT * 
FROM message
WHERE user_current = reciever_id AND is_read = 0;

END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure verifyUser
-- -----------------------------------------------------

DELIMITER $$
USE `tcdb`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `verifyUser`(IN username_input VARCHAR(20), IN password_input VARCHAR(20))
BEGIN
SET @matchP = null;
SET @user_id = null;
SELECT password
FROM user_info
WHERE username = username_input
INTO @matchP; 

IF (@matchP = password_input) THEN  
	SET @valid = true;
		(SELECT id 
		 FROM user_info
         WHERE username = username_input
		 INTO @user_id);
ELSE SET @valid = false;
END IF;
SELECT @valid, @user_id;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure createPersonality
-- -----------------------------------------------------

DELIMITER $$
USE `tcdb`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `createPersonality`(user_id INT, personality_id INT, scale INT)
BEGIN

INSERT INTO personality
VALUES
(user_id, personality_id, scale);

SET @valid = true;
SELECT @valid;
END$$

DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
