USE adlister_db;

DROP TABLE IF EXISTS dishes;

CREATE TABLE dishes (
                          `ID` INT unsigned NOT NULL AUTO_INCREMENT,
                          `Dish_Name` VARCHAR(250) NOT NULL,
                          `Ingredients` VARCHAR(250) NOT NULL,
                          `Diet_Type` VARCHAR(250) NOT NULL,
                          `Caloric_Content` VARCHAR(250) NOT NULL,
                          `Description` VARCHAR(250) NOT NULL,
                          PRIMARY KEY (`ID`)
);


USE adlister_db;
INSERT INTO dishes (Dish_Name, Ingredients, Diet_Type, Caloric_Content, Description)
VALUES
('Paprika Chicken', 'Chicken breast, Paprika, Poultry Seasoning, Salt, Pepper, Lemon Juice', 'Paleo', '318 cal', 'Carbs 7g, Fat 12g, Protein 46g'),
('Lemon Cous-Cous Salad', 'Couscous, Lemon Juice, Cherry Tomatoes, Cucumber, Pine nuts, Scallions, Lemon Zest', 'Vegan', '340 cal', 'Carbs 25g, Fat 25g, Protein 6g');



