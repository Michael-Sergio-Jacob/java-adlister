USE adlister_db;
DROP TABLE IF EXISTS dishes;
CREATE TABLE dishes (
                        `id` INT unsigned NOT NULL AUTO_INCREMENT,
                        `user_id` INT unsigned NOT NULL,
                        `dish_name` VARCHAR(250) NOT NULL,
                        `ingredients` VARCHAR(250) NOT NULL,
                        `diet_type` VARCHAR(250) NOT NULL,
                        `caloric_content` INT NOT NULL,
                        `description` VARCHAR(250) NOT NULL,
                        PRIMARY KEY (`id`),
                        FOREIGN KEY (`user_id`) REFERENCES users(id)
                            ON DELETE CASCADE
);

# INSERT INTO dishes (user_id, dish_Name, ingredients, diet_type, caloric_content, description)
# VALUES
# (1, 'Paprika Chicken', 'Chicken breast, Paprika, Poultry Seasoning, Salt, Pepper, Lemon Juice', 'Paleo', 318, 'Carbs 7g, Fat 12g, Protein 46g'),
# (2, 'Lemon Cous-Cous Salad', 'Couscous, Lemon Juice, Cherry Tomatoes, Cucumber, Pine nuts, Scallions, Lemon Zest', 'Vegan', 340, 'Carbs 25g, Fat 25g, Protein 6g');