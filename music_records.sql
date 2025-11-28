DROP DATABASE p311_music_store

CREATE DATABASE p311_music_store

USE p311_music_store


 1
CREATE TABLE Groups (
	id INT IDENTITY(1,1) PRIMARY KEY,
	name NVARCHAR(50) NOT NULL,
	peoples NVARCHAR(400)
)

CREATE TABLE Genres (
	id INT IDENTITY(1,1) PRIMARY KEY,
	name NVARCHAR(50)
)


CREATE TABLE Albums (
	id INT IDENTITY(1,1) PRIMARY KEY,
	group_id INT NOT NULL,
	publish_year INT NOT NULL,
	CONSTRAINT FK_Albums_Groups FOREIGN KEY (group_id) REFERENCES Groups(id)
)




CREATE TABLE Music (
	id INT IDENTITY(1,1) PRIMARY KEY,
	title NVARCHAR(50) NOT NULL,
	music_text TEXT,
	group_id INT NOT NULL,
	album_id INT,
	CONSTRAINT FK_Music_Groups FOREIGN KEY (group_id) REFERENCES Groups(id),
	CONSTRAINT FK_Music_Albums FOREIGN KEY (album_id) REFERENCES Albums(id)	
)


CREATE TABLE MusicGenres (
	music_id INT NOT NULL,
	genre_id INT NOT NULL,
	PRIMARY KEY (music_id, genre_id),
	CONSTRAINT FK_MusicGenres_Music FOREIGN KEY (music_id) REFERENCES Music(id),
	CONSTRAINT FK_MusicGenres_Genres FOREIGN KEY (genre_id) REFERENCES Genres(id)
)


CREATE TABLE Records (
	id INT IDENTITY(1,1) PRIMARY KEY,
	name NVARCHAR(100) NOT NULL,
	group_id INT,
	quantity_on_store INT NOT NULL,
	price MONEY NOT NULL,
	is_on_sale BIT NOT NULL, 
	CONSTRAINT FK_Records_Groups FOREIGN KEY (group_id) REFERENCES Groups(id),
	CONSTRAINT CHK_Records_quantity_on_store CHECK (quantity_on_store >= 0),
	CONSTRAINT CHK_Records_price CHECK (price >= 0)
)


CREATE TABLE Users (
	id INT IDENTITY(1,1) PRIMARY KEY,
	name NVARCHAR(100) NOT NULL,
	phone NVARCHAR(15) NOT NULL,
	total_money_spent MONEY NOT NULL,
	sale_percent INT NOT NULL,
	CONSTRAINT CHK_Users_total_money_spent CHECK (total_money_spent >= 0),
	CONSTRAINT CHK_Users_sale_percent CHECK (sale_percent >= 0)
)


CREATE TABLE UsersShopping (
	id INT IDENTITY(1,1) PRIMARY KEY,
	user_id INT NOT NULL,
	record_id INT NOT NULL,
	shopping_date DATE NOT NULL,
	CONSTRAINT FK_UsersShopping_Users FOREIGN KEY (user_id) REFERENCES Users(id),
	CONSTRAINT FK_UsersShopping_Records FOREIGN KEY (record_id) REFERENCES Records(id)
)
