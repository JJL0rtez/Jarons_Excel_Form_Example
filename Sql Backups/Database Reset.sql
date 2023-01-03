DROP TABLE IF EXISTS Item;
DROP TABLE IF EXISTS ItemDetails;
DROP TABLE IF EXISTS Employee;

-- Create Item and Employee tables --
CREATE TABLE Item(
    ItemID INT AUTO_INCREMENT PRIMARY KEY,
    ItemName VARCHAR(50),
    ItemIcon VARCHAR(200),
	craftingIngredient1 INT REFERENCES Item(id),
	craftingIngredient2 INT REFERENCES Item(id),
	craftingIngredient3 INT REFERENCES Item(id),
	craftingIngredient4 INT REFERENCES Item(id),
	craftingIngredient5 INT REFERENCES Item(id),
	craftingIngredient6 INT REFERENCES Item(id),
	craftingIngredient7 INT REFERENCES Item(id),
	craftingIngredient8 INT REFERENCES Item(id),
	craftingIngredient9 INT REFERENCES Item(id)
);

CREATE TABLE ItemDetails(
    ItemDetailsID INT AUTO_INCREMENT PRIMARY KEY,
	employeeID INT,
	ItemID INT,
	dateCrafted DATETIME,
	dateUsed DATETIME,
	CONSTRAINT fk_employee FOREIGN KEY (employeeID)  
		REFERENCES Employee(employeeID),
	CONSTRAINT fk_item FOREIGN KEY (ItemID)  
		REFERENCES Item(ItemID) 
);

CREATE TABLE Employee(
    employeeID INT AUTO_INCREMENT PRIMARY KEY,
    firstName VARCHAR(100),
    lastName VARCHAR(100),
    employmentDate DATE,
    terminationDate DATE
);

-- Insert employee data into table
INSERT INTO Employee(firstName,lastName,employmentDate,terminationDate) VALUES ('Jaron', 'Lorentz',NOW(), NULL);
INSERT INTO Employee(firstName,LastName,employmentDate,terminationDate) VALUES ('Jesse', 'Pinkman','2019-05-23', '2022-12-12');
INSERT INTO Employee(firstName,LastName,employmentDate,terminationDate) VALUES ('Walter', 'White','2023-3-30', NULL);
INSERT INTO Employee(firstName,LastName,employmentDate,terminationDate) VALUES ('Saul', 'Goodman','2017-02-16', NULL);

-- Insert Item data into table
INSERT INTO Item(ItemName, ItemIcon) VALUES ('Air', '//icons//Air.png');
INSERT INTO Item(ItemName, ItemIcon) VALUES ('Lava Bucket', '//icons//lava_Bucket.png');
INSERT INTO Item(ItemName, ItemIcon) VALUES ('Water Bucket', '//icons//Water_Bucket.png');
INSERT INTO Item(ItemName, ItemIcon,craftingIngredient3,craftingIngredient4) VALUES ('Obsidian', '//icons//Obsidian.png',2,3);
INSERT INTO Item(ItemName, ItemIcon) VALUES ('Paper', '//icons//Paper.png');
INSERT INTO Item(ItemName, ItemIcon) VALUES ('Leather', '//icons//Leather.png');
INSERT INTO Item(ItemName, ItemIcon) VALUES ('Book', '//icons//Book.png');
INSERT INTO Item(ItemName, ItemIcon) VALUES ('Diamond Ore', '//icons//Diamond_ore.png');
INSERT INTO Item(ItemName, ItemIcon,craftingIngredient4) VALUES ('Diamond', '//icons//Diamond.png',7);
INSERT INTO Item(ItemName, ItemIcon,craftingIngredient2,craftingIngredient4,craftingIngredient5,craftingIngredient6,craftingIngredient7
,craftingIngredient8,craftingIngredient9) VALUES ('Enchantment Table', '//icons//Enchantment_Table.png',7,9,4,9,9,9,9);

-- Check tables where created and populated correctly --
SELECT * FROM Item;
SELECT * FROM Employee;
SELECT * FROM ItemDetails;
