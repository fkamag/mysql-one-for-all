DROP DATABASE IF EXISTS SpotifyClone;

  CREATE DATABASE IF NOT EXISTS SpotifyClone;

  CREATE TABLE IF NOT EXISTS `SpotifyClone`.`plan` (
  `id_plan` INT NOT NULL AUTO_INCREMENT,
  `name_plan` VARCHAR(45) NOT NULL,
  `price_plan` DECIMAL(7,2) NOT NULL,
  PRIMARY KEY (`id_plan`),
  UNIQUE INDEX `name_plan_UNIQUE` (`name_plan` ASC))
ENGINE = InnoDB;

  CREATE TABLE IF NOT EXISTS `SpotifyClone`.`user` (
  `id_user` INT NOT NULL AUTO_INCREMENT,
  `name_user` VARCHAR(45) NOT NULL,
  `age_user` INT NOT NULL,
  `date_subscription` DATE NOT NULL,
  `id_plan` INT NOT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE INDEX `name_user_UNIQUE` (`name_user` ASC),
  INDEX `fk_user_plan1_idx` (`id_plan` ASC),
  CONSTRAINT `fk_user_plan1`
    FOREIGN KEY (`id_plan`)
    REFERENCES `SpotifyClone`.`plan` (`id_plan`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`artist` (
  `id_artist` INT NOT NULL AUTO_INCREMENT,
  `name_artist` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_artist`),
  UNIQUE INDEX `name_artist_UNIQUE` (`name_artist` ASC))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`album` (
  `id_album` INT NOT NULL AUTO_INCREMENT,
  `name_album` VARCHAR(45) NOT NULL,
  `id_artist` INT NOT NULL,
  `release_year` VARCHAR(4) NOT NULL,
  PRIMARY KEY (`id_album`),
  UNIQUE INDEX `name_album_UNIQUE` (`name_album` ASC),
  INDEX `fk_album_artist_idx` (`id_artist` ASC),
  CONSTRAINT `fk_album_artist`
    FOREIGN KEY (`id_artist`)
    REFERENCES `SpotifyClone`.`artist` (`id_artist`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`user_artist` (
  `id_following` INT NOT NULL AUTO_INCREMENT,
  `id_user` INT NOT NULL,
  `id_artist` INT NOT NULL,
  INDEX `fk_user_has_artist_artist1_idx` (`id_artist` ASC),
  INDEX `fk_user_has_artist_user1_idx` (`id_following` ASC, `id_user` ASC),
  PRIMARY KEY (`id_artist`, `id_user`),
  CONSTRAINT `fk_user_has_artist_user1`
    FOREIGN KEY (`id_user`)
    REFERENCES `SpotifyClone`.`user` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_artist_artist1`
    FOREIGN KEY (`id_artist`)
    REFERENCES `SpotifyClone`.`artist` (`id_artist`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`song` (
  `id_song` INT NOT NULL AUTO_INCREMENT,
  `name_song` VARCHAR(45) NOT NULL,
  `id_album` INT NOT NULL,
  `duration` INT NOT NULL,
  PRIMARY KEY (`id_song`),
  UNIQUE INDEX `name_song_UNIQUE` (`name_song` ASC),
  INDEX `fk_song_album1_idx` (`id_album` ASC),
  CONSTRAINT `fk_song_album1`
    FOREIGN KEY (`id_album`)
    REFERENCES `SpotifyClone`.`album` (`id_album`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`user_song` (
  `id_user` INT NOT NULL,
  `id_song` INT NOT NULL,
  `date_played` VARCHAR(45) NOT NULL,
  INDEX `fk_user_has_song_song1_idx` (`id_song` ASC),
  INDEX `fk_user_has_song_user1_idx` (`id_user` ASC),
  PRIMARY KEY (`id_song`, `date_played`),
  CONSTRAINT `fk_user_has_song_user1`
    FOREIGN KEY (`id_user`)
    REFERENCES `SpotifyClone`.`user` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_song_song1`
    FOREIGN KEY (`id_song`)
    REFERENCES `SpotifyClone`.`song` (`id_song`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO SpotifyClone.plan (name_plan, price_plan)
  VALUES
    ('gratuito', 0.00),
    ('familiar',	7.99),
    ('universitário',	5.99),
    ('pessoal', 6.99);

INSERT INTO SpotifyClone.user (name_user, age_user, date_subscription, id_plan)
  VALUES
    ('Barbara Liskov',	82,	'2019-10-20',	1),
    ('Robert Cecil Martin',	58,	'2017-01-06',	1),
    ('Ada Lovelace',	37,	'2017-12-30',	2),
    ('Martin Fowler',	46,	'2017-01-17',	2),
    ('Sandi Metz',	58, '2018-04-29',	2),
    ('Paulo Freire',	19,	'2018-02-14',	3),
    ('Bell Hooks',	26,	'2018-01-05',	3),
    ('Christopher Alexander',	85,	'2019-06-05',	4),
    ('Judith Butler',	45,	'2020-05-13',	4),
    ('Jorge Amado',	58,	'2017-02-17',	4);
    
INSERT INTO SpotifyClone.artist (name_artist)
	VALUES
		('Beyoncé'),
		('Queen'),
		('Elis Regina'),
		('Baco Exu do Blues'),
		('Blind Guardian'),
		('Nina Simone');

INSERT INTO SpotifyClone.album (name_album, id_artist, release_year)
	VALUES
		('Renaissance',	1, 2022),
		('Jazz',	2,	1978),
		('Hot Space',	2,	1982),
		('Falso Brilhante',	3,	1998),
		('Vento de Maio',	3,	2001),
		('QVVJFA?',	4,	2003),
		('Somewhere Far Beyond',	5,	2007),
		('I Put A Spell On You',	6,	2012);

INSERT INTO SpotifyClone.user_artist (id_user, id_artist)
	VALUES
		(1,	1),
		(1,	2),
		(1,	3),
		(2,	1),
		(2,	3),
		(3,	2),
		(4,	4),
		(5,	5),
		(5,	6),
		(6,	6),
		(6,	1),
		(7,	6),
		(9,	3),
		(10, 2);

INSERT INTO SpotifyClone.song (name_song, id_album, duration)
	VALUES
		('Break My Soul',	1,	279),
		('VIRGO’S GROOVE',	1,	369),
		('ALIEN SUPERSTAR',	1,	116),
		('Don’t Stop Me Now',	2,	203),
		('Under Pressure',	3,	152),
		('Como Nossos Pais',	4,	105),
		('O Medo de Amar é o Medo de Ser Livre',	5,	207),
		('Samba em Paris',	6,	267),
		('The Bard’s Song',	7,	244),
		('Feeling Good',	8,	100);

INSERT INTO SpotifyClone.user_song (id_song, id_user, date_played)
	VALUES
		(8,	1,	'2022-02-28 10:45:55'),
		(2,	1,	'2020-05-02 05:30:35'),
		(10,	1,	'2020-03-06 11:22:33'),
		(10,	2,	'2022-08-05 08:05:17'),
		(7,	2,	'2020-01-02 07:40:33'),
		(10,	3,	'2020-11-13 16:55:13'),
		(2,	3,	'2020-12-05 18:38:30'),
		(8,	4,	'2021-08-15 17:10:10'),
		(8,	5,	'2022-01-09 01:44:33'),
		(5,	5,	'2020-08-06 15:23:43'),
		(7,	6,	'2017-01-24 00:31:17'),
		(1,	6,	'2017-10-12 12:35:20'),
		(4,	7,	'2011-12-15 22:30:49'),
		(4,	8,	'2012-03-17 14:56:41'),
		(9,	9,	'2022-02-24 21:14:22'),
		(3,	10,	'2015-12-13 08:30:22');
