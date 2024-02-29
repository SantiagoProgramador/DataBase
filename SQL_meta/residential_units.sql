CREATE TABLE residential_units (
	unit_nit varchar(11) PRIMARY KEY,
    unit_name varchar(30) NOT NULL,
    stratum INT NOT NULL
);

CREATE TABLE guards (
	guard_id varchar(10) primary key,
    guard_name varchar(40) NOT NULL,
    date_of_birth date,
    gender varchar(4) CHECK(gender in("M","F","other"))  
);

CREATE TABLE buildings (
	building_id INT PRIMARY KEY AUTO_INCREMENT,
	number_of_floors INT CHECK(number_of_floors BETWEEN 5 AND 8),
	location varchar(40),
    id_unit varchar(11),
    CONSTRAINT fk_id_unit foreign key(id_unit) REFERENCES residential_units(unit_nit)
);

# ALTER TABLE buildings ADD COLUMN id_unit varchar(11)
# ALTER TABLE buildings ADD CONSTRAINT fk_id_unit foreign key(id_unit) REFERENCES residential_units(unit_nit)

CREATE TABLE news (
	id INT AUTO_INCREMENT PRIMARY KEY,
    id_building INT,
    id_guard varchar(10),
    CONSTRAINT fk_id_building foreign key(id_building) REFERENCES buildings(building_id),
    CONSTRAINT fk_id_guard foreign key(id_guard) REFERENCES guards(guard_id)
);

CREATE TABLE apartments (
	apartment_number INT PRIMARY KEY AUTO_INCREMENT,
    floor INT NOT NULL,
    apartment_value DOUBLE CHECK(apartment_value BETWEEN 10000 AND 100000),
    id_building INT,
    CONSTRAINT fk_id_building_floor foreign key(id_building)
    REFERENCES buildings(building_id)
);

ALTER TABLE buildings 
ADD COLUMN areas varchar(40) CHECK(areas IN ("Piscina","Alameda","Cancha"));

#INSERT INTO RESIDENTIAL_UNITS
INSERT INTO residential_units 
VALUES ("12345","Mira flores","3"),("12223","Fontana real", 2);
SELECT * FROM residential_units;

INSERT INTO buildings(number_of_floors,areas) VALUES(6,"piscina");
SELECT * FROM buildings;

INSERT INTO guards VALUES ("123456","pepe","2000-10-20","M");
SELECT * FROM guards;
