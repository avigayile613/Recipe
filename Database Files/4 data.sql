use HeartyHearthDB 
go 
delete CookbookRecipe
delete Cookbook
delete CourseRecipe
delete MealCourse
delete Course 
delete Meal 
delete RecipeIngredient
delete RecipeStep
delete Recipe
delete CuisineType
delete Ingredient 
delete Unit
delete UserAccount
go 

insert UserAccount(UserName, FirstName, LastName)
select 'dpascal@heartyhearth.com', 'Daniella', 'Pascal'
union select 'rneuman@heartyhearth.com', 'Racheli', 'Neuman'
union select 'mkatz@heartyhearth.com', 'Miriam', 'Katz'
go 

insert CuisineType(CuisineTypeName)
select 'American'
union select 'French'
union select 'English'
union select 'Mexican'
union select 'Mediteranean'
go 

insert Unit(UnitName, UnitPluralName, UnitAbbreviation)
select 'teaspoon', 'teaspoons', 'tsp'
union select 'tablespoon', 'tablespoons', 'tbsp'
union select 'cup', 'cups', 'c'
union select 'pinch', 'pinches', null 
union select 'handful', 'handfuls', null 
union select 'clove', 'cloves', null
union select 'stick', 'sticks', null
union select 'ounce', 'ounces', 'oz'
union select 'pound', 'pounds', 'lb'
go 

;
with x as(
select IngredientName = 'sugar', IngredientPluralName = null
union select 'oil', null
union select 'egg', 'eggs'
union select 'flour', null
union select 'vanilla sugar', null
union select 'baking powder', null
union select 'baking soda', null
union select 'chocolate chips', null
union select 'Granny Smith apple', 'Granny Smith apples'
union select 'vanilla yogurt', null
union select 'orange juice', null
union select 'honey', null
union select 'peanut butter', null
union select 'ice cubes', null
union select 'club bread', null
union select 'taco shell', 'taco shells'
union select 'rice crispies', null
union select 'butter', null
union select 'shredded cheese', null
union select 'garlic clove', 'garlic cloves'
union select 'black pepper', null
union select 'salt', null
union select 'garlic powder', null
union select 'onion powder', null
union select 'vanilla pudding', null
union select 'whipped cream cheese', null
union select 'sour cream cheese', null
union select 'sour cream', null
union select 'tomato', 'tomatoes'
union select 'pickle', 'pickles'
union select 'onion', 'onions'
union select 'red onion', 'red onions'
union select 'cucumber', 'cucumbers'
union select '2nd cut brisket', null
union select 'red wine', null
union select 'ketchup', null
)
insert Ingredient(IngredientName, IngredientPluralName)
select x.IngredientName, x.IngredientPluralName
from x 

;
with x as(
select RecipeName = 'Chocolate Chip Cookies', UserName = 'dpascal@heartyhearth.com', CuisineTypeName = 'American', CalorieCount = 1000, DraftedDate = '2025-11-05', PublishedDate = null, ArchivedDate = null
union select 'Apple Yogurt Smoothie', 'dpascal@heartyhearth.com', 'French', 250, '2025-11-27', '2025-12-04 10:59', null
union select 'Cheese Bread', 'rneuman@heartyhearth.com', 'English', 500, '2025-12-27', '2026-01-01 02:33', null
union select 'Butter Muffins', 'dpascal@heartyhearth.com', 'American', 300, '2025-12-14', null, '2026-01-03'
union select 'Israeli Salad', 'mkatz@heartyhearth.com', 'Mediteranean', 800, '2026-04-26', '2026-05-01', null
union select 'Peanut Chews', 'rneuman@heartyhearth.com', 'French', 200, '2026-03-17', '2026-04-19', null
union select 'Pulled Beef Tacos', 'mkatz@heartyhearth.com', 'American', 750, '2026-05-01', null, null
)
insert Recipe(RecipeName, UserId, CuisineTypeId, CalorieCount, DraftedDate, PublishedDate, ArchivedDate)
select x.RecipeName, ua.UserId, ct.CuisineTypeId, x.CalorieCount, x.DraftedDate, x.PublishedDate, x.ArchivedDate
from x 
join UserAccount ua 
on ua.UserName = x.UserName
join CuisineType ct 
on x.CuisineTypeName = ct.CuisineTypeName

;
with x as(
   select RecipeName = 'Chocolate Chip Cookies', IngredientSequence = 1, Quantity = 1, QuantityDesc = null, UnitName = 'cup', IngredientName = 'sugar', PrepNote = null 
   union select 'Chocolate Chip Cookies', 2, .5, null, 'cup', 'oil', null 
   union select 'Chocolate Chip Cookies', 3, 3, null, null, 'egg', null 
   union select 'Chocolate Chip Cookies', 4, 2, null, 'cup', 'flour', null 
   union select 'Chocolate Chip Cookies', 5, 1, null, 'teaspoon', 'vanilla sugar', null 
   union select 'Chocolate Chip Cookies', 6, 2, null, 'teaspoon', 'baking powder', null 
   union select 'Chocolate Chip Cookies', 7, .5, null, 'teaspoon', 'baking soda', null 
   union select 'Chocolate Chip Cookies', 8, 1, null, 'cup', 'chocolate chips', null
   union select 'Apple Yogurt Smoothie', 1, 3, null, null, 'Granny Smith apple', null 
   union select 'Apple Yogurt Smoothie', 2, 2, null, 'cup', 'vanilla yogurt', null
   union select 'Apple Yogurt Smoothie', 3, 2, null, 'teaspoon', 'sugar', null 
   union select 'Apple Yogurt Smoothie', 4, .5, null, 'cup', 'orange juice', null 
   union select 'Apple Yogurt Smoothie', 5, 2, null, 'tablespoon', 'honey', null 
   union select 'Apple Yogurt Smoothie', 6, null, '5-6', null, 'ice cubes', null 
   union select 'Cheese Bread', 1, 1, null, null, 'club bread', null
   union select 'Cheese Bread', 2, 4, null, 'ounce', 'butter', null
   union select 'Cheese Bread', 3, 8, null, 'ounce', 'shredded cheese', null 
   union select 'Cheese Bread', 4, 2, null, null, 'garlic clove', '(crushed)'
   union select 'Cheese Bread', 5, .25, null, 'teaspoon', 'black pepper', null 
   union select 'Cheese Bread', 6, null, null, 'pinch', 'salt', null 
   union select 'Butter Muffins', 1, 1, null, 'stick', 'butter', null 
   union select 'Butter Muffins', 2, 3, null, 'cup', 'sugar', null 
   union select 'Butter Muffins', 3, 2, null, 'tablespoon', 'vanilla pudding', null 
   union select 'Butter Muffins', 4, 4, null, null, 'egg', null 
   union select 'Butter Muffins', 5, 8, null, 'ounce', 'whipped cream cheese', null 
   union select 'Butter Muffins', 6, 8, null, 'ounce', 'sour cream cheese', null 
   union select 'Butter Muffins', 7, 1, null, 'cup', 'flour', null 
   union select 'Butter Muffins', 8, 2, null, 'teaspoon', 'baking powder', null 
   union select 'Israeli Salad', 1, 2, null, null, 'tomato', null
   union select 'Israli Salad', 2, 2, null, null, 'cucumber', null
   union select 'Israli Salad', 3, 1, 'small', null, 'red onion', null
   union select 'Israli Salad', 4, 2, 'small', null, 'pickle', null
   union select 'Israli Salad', 5, 1, null, 'teaspoon', 'salt', null
   union select 'Israli Salad', 6, .5, null, 'teaspoon', 'black pepper', null
   union select 'Israli Salad', 7, .5, null, 'teaspoon', 'garlic powder', null
   union select 'Israli Salad', 8, .5, null, 'cup', 'oil', null
   union select 'Peanut Chews', 1, 4, null, 'cup', 'rice crispies', null
   union select 'Peanut Chews', 2, 1, null, 'cup', 'peanut butter', null
   union select 'Peanut Chews', 3, 1, null, 'cup', 'oil', '(seperated)'
   union select 'Peanut Chews', 4, .25, null, 'cup', 'honey', null
   union select 'Peanut Chews', 5, 3, null, 'tablespoon', 'sugar', null
   union select 'Peanut Chews', 6, 8, null, 'ounce', 'chocolate chips', null
   union select 'Pulled Beef Tacos', 1, 8, null, null, 'taco shells', null
   union select 'Pulled Beef Tacos', 2, 2, null, 'pound', '2nd cut brisket', null
   union select 'Pulled Beef Tacos', 3, 1, null, 'cup', 'red wine', null
   union select 'Pulled Beef Tacos', 4, .5, null, 'cup', 'ketchup', null
   union select 'Pulled Beef Tacos', 5, 2, 'heaping', 'tablespoon', 'thyme', null
   union select 'Pulled Beef Tacos', 6, 1, null, 'teaspoon', 'black pepper', null
)
insert RecipeIngredient(RecipeId, IngredientSequence, Quantity, QuantityDesc, UnitId, IngredientId, PrepNote)
select r.RecipeId, x.IngredientSequence, x.Quantity, x.QuantityDesc, u.UnitId, i.IngredientId, x.PrepNote
from x 
join Recipe r 
on x.RecipeName = r.RecipeName
join Ingredient i 
on i.IngredientName = x.IngredientName
left join Unit u 
on u.UnitName = x.UnitName
go 

;
with x as(
   select RecipeName = 'Chocolate Chip Cookies', StepSequence = 1, StepDesc = 'Combine sugar, oil and eggs in a bowl.'
   union select 'Chocolate Chip Cookies', 2, 'mix well.'
   union select 'Chocolate Chip Cookies', 3, 'Add flour, vanilla sugar, baking powder and baking soda.'
   union select 'Chocolate Chip Cookies', 4, 'Beat for 5 minutes.'
   union select 'Chocolate Chip Cookies', 5, 'Add chocolate chips.'
   union select 'Chocolate Chip Cookies', 6, 'Freeze for 1-2 hours.'
   union select 'Chocolate Chip Cookies', 7, 'Roll into balls and place spread out on a cookie sheet.'
   union select 'Chocolate Chip Cookies', 8, 'Bake on 350 for 10 min.'
   union select 'Apple Yogurt Smoothie', 1, 'Peel the apples and dice.'
   union select 'Apple Yogurt Smoothie', 2, 'Combine all ingredients in bowl except for apples and ice cubes.'
   union select 'Apple Yogurt Smoothie', 3, 'Mix until smooth.'
   union select 'Apple Yogurt Smoothie', 4, 'Add apples and ice cubes.'
   union select 'Apple Yogurt Smoothie', 5, 'Pour into glasses.'
   union select 'Cheese Bread', 1, 'Slit bread every 3/4 inch.'
   union select 'Cheese Bread', 2, 'Combine all ingredients in bowl.'
   union select 'Cheese Bread', 3, 'Fill slits with cheese mixture.'
   union select 'Cheese Bread', 4, 'Wrap bread into a foil and bake for 30 minutes.'
   union select 'Butter Muffins', 1, 'Cream butter with sugars.'
   union select 'Butter Muffins', 2, 'Add eggs and mix well.'
   union select 'Butter Muffins', 3, 'Slowly add rest of ingredients and mix well.'
   union select 'Butter Muffins', 4, 'Fill muffin pans 3/4 full and bake for 30 minutes.'
   union select 'Israeli Salad', 1, 'Dice the tomatoes, pickles, cucumbers, and red onion into small pieces.'
   union select 'Isralei Salad', 2, 'Toss with the oil, salt, black pepper, and garlic powder.'
   union select 'Peanut Chews', 1, 'In a pot, add peanut butter, sugar, honey, and a 1/5 cup oil.'
   union select 'Peanut Chews', 2, 'Stir over medium flame until fully melted.'
   union select 'Peanut Chews', 3, 'Slowly add in the rice crispies while mixing.'
   union select 'Peanut Chews', 4, 'Leave mixture to cool.'
   union select 'Peanut Chews', 5, 'Combine chocolate chips and oil. Melt in microwave, stirring at 30 second intervals, until completely melted.'
   union select 'Peanut Chews', 6, 'Spread rice crispy mixture evenly in a 9x13 pan. Top with chocolate.'
   union select 'Pulled Beef Tacos', 1, 'Put brisket, ketchup, red wine, thyme, and black pepper into a ziplock bag. Let marinate overnight.'
   union select 'Pulled Beef Tacos', 2, 'Transfer meat to a 9x13 pan and cover tightly. Bake on 300 for 3 hours.'
   union select 'Pulled Beef Tacos', 3, 'While the meat is stil hot, pull apart with 2 forks until shredded.'
   union select 'Pulled Beef Tacos', 4, 'Fill taco shells with meat. Serve while hot.'
)
insert RecipeStep(RecipeId, StepSequence, StepDesc)
select r.RecipeId, x.StepSequence, x.StepDesc
from x 
join Recipe r 
on x.RecipeName = r.RecipeName
go 

;
with x as(
select MealName = 'Breakfast Bash', UserName = 'dpascal@heartyhearth.com', IsActive = 1
union select 'After the Fast', 'dpascal@heartyhearth.com', 0
union select 'Nine Days Dinner', 'rneuman@heartyhearth.com', 0)
insert Meal(UserId, MealName, IsActive)
select ua.UserId, x.MealName, x.IsActive
from x 
join UserAccount ua 
on x.UserName = ua.UserName
go 

insert Course(CourseName)
select 'Appetizer'
union select 'Main'
union select 'Side'
union select 'Dessert'
go 

;
with x as(
   select MealName = 'Breakfast Bash', CourseName = 'Main', CourseSequence = 1
   union select 'Breakfast Bash', 'Appetizer', 2 
   union select 'After the Fast', 'Main', 1 
   union select 'After the Fast', 'Side', 2 
   union select 'Nine Days Dinner', 'Appetizer', 1 
   union select 'Nine Days Dinner', 'Main', 2 
   union select 'Nine Days Dinner', 'Dessert', 3
)
insert MealCourse(MealId, CourseId, CourseSequence)
select m.MealId, c.CourseId, x.CourseSequence
from x 
join Meal m 
on x.MealName = m.MealName
join Course c 
on c.CourseName = x.CourseName
go 
/*
Meal: Breakfast bash
   Main course: Cheese Bread as the main dish and Butter Muffins as side dish.
   Appetizer: Apple Yogurt Smoothie.*/
;
with x as(
   select MealName = 'Nine Days Dinner',  CourseName = 'Main', RecipeName = 'Cheese Bread', CourseRecipeSequence = 1, IsMainDish = 1
   union select 'Nine Days Dinner', 'Dessert', 'Chocolate Chip Cookies', 2, 0
   union select 'Nine Days Dinner', 'Dessert', 'Butter Muffins', 3, 0
   union select 'After the Fast', 'Main', 'Pulled Beef Tacos', 1, 1
   union select 'After the Fast', 'Side', 'Israeli Salad', 2, 0
   union select 'Breakfast Bash', 'Main', 'Cheese Bread', 1, 1
   union select 'Breakfast Bash', 'Main', 'Butter Muffins', 2, 0
   union select 'Breakfast Bash', 'Appetizer', 'Apple Yogurt Smoothie', 3, 0
)
insert CourseRecipe(MealCourseId, RecipeId, CourseRecipeSequence, IsMainDish)
select mc.MealCourseId, r.RecipeId, x.CourseRecipeSequence, x.IsMainDish
from x 
join recipe r 
on r.RecipeName = x.RecipeName
join Course c 
on c.CourseName = x.CourseName
join Meal m 
on m.MealName = x.MealName
join MealCourse mc 
on mc.CourseId = c.CourseId
and mc.MealId = m.MealId

;
with x as(
select CookbookName = 'Treats for Two', UserName = 'dpascal@heartyhearth.com', CookbookPrice = 30, IsActive = 1
union select 'Newlywed Dinner', 'dpascal@heartyhearth.com', 25, 0
union select 'Pastry Delight', 'rneuman@heartyhearth.com', 15, 1
union select 'Heaven Delectables', 'mkatz@heartyhearth.com', 18, 1)
insert Cookbook(CookbookName, UserId, CookbookPrice, IsActive)
select x.CookbookName, ua.UserId, x.CookbookPrice, x.IsActive
from x 
join UserAccount ua 
on x.UserName = ua.UserName
go 

;
with x as(
   select CookbookName = 'Treats for Two', CookbookRecipeSequence = 1, RecipeName = 'Chocolate Chip Cookies'
   union select 'Treats for Two', 2, 'Apple Yogurt Smoothie'
   union select 'Treats for Two', 3, 'Cheese Bread'
   union select 'Treats for Two', 4, 'Butter Muffins'
   union select 'Newlywed Dinner', 1, 'Cheese Bread'
   union select 'Newlywed Dinner', 2, 'Apple Yogurt Smoothie'
   union select 'Pastry Delight', 1, 'Chocolate Chip Cookies'
   union select 'Pastry Delight', 2, 'Butter Muffins'
   union select 'Heaven Delectables', 1, 'Pulled Beef Tacos'
   union select 'Heaven Delectables', 2, 'Israeli Salad'
   union select 'Heaven Delectables', 3, 'Peanut Chews'
)
insert CookbookRecipe(CookbookId, RecipeId, CookbookRecipeSequence)
select c.CookbookId, r.RecipeId, x.CookbookRecipeSequence
from x 
join Cookbook c 
on x.CookbookName = c.CookbookName
join Recipe r 
on x.RecipeName = r.RecipeName
go 

insert Ingredient(IngredientName, IngredientPluralName)
select 'canned black beans', null
union select 'olive oil', null
union select 'taco seasoning', null
union select 'corn tortillas', null 
union select 'shredded cabbage', null 
union select 'lime', 'limes'

--Sample Data for you. Add at least 3 recipes, 3 meals, and 3 books
/*
Recipe 1: Chocolate Chip Cookies
   Ingredients: 1 cup sugar, 1/2 cup oil, 3 eggs, 2 cups Flour, 1 tsp vanilla sugar, 2 tsp baking powder, 1/2 tsp baking soda, 1 cup chocolate chips
   Cuisine: American
   Instructions: First combine sugar, oil and eggs in a bowl
                 mix well
                 add flour, vanilla sugar, baking powder and baking soda
                 beat for 5 minutes
                 add chocolate chips
                 freeze for 1-2 hours
                 roll into balls and place spread out on a cookie sheet
                 bake on 350 for 10 min.*/


/*Recipe 2: Apple Yogurt Smoothie
   Ingredients: 3 granny smith apples, 2 cups vanilla yogurt, 2 tsp sugar, 1/2 cup orange juice, 2 tbsp honey, 5-6 ice cubes.
   Cuisine: French
   Instructions: Peel the apples and dice
                 Combine all ingredients in bowl except for apples and ice cubes.
                 Mix until smooth.
                 Add apples and ice cubes.
                 Pour into glasses. */

/*Recipe 3: Cheese Bread
   Ingredients: 1 club bread, 4 oz butter, 8 oz shredded cheese, 2 cloves garlic (crushed), 1/4 tsp black pepper and a pinch of salt.
   Cuisine: English
   Instructions: Slit bread every 3/4 inch.
                 Combine all ingredients in bowl.
                 Fill slits with cheese mixture.
                 Wrap bread into a foil and bake for 30 minutes.

Recipe 4: Butter Muffins
   Ingredients: 1 stick butter, 3 cups sugar, 2 tbsp vanilla pudding, 4 eggs, 8 oz whipped cream cheese, 8 oz sour cream cheese, 1 cups flour and 2 tsp baking powder.
   Cuisine: American
   Instructions: Cream butter with sugars.
                 Add eggs and mix well.
                 Slowly add rest of ingredients and mix well.
                 Fill muffin pans 3/4 full and bake for 30 minutes.

Meal: Breakfast bash
   Main course: Cheese Bread as the main dish and Butter Muffins as side dish.
   Appetizer: Apple Yogurt Smoothie.



Cookbook: Treats for two, price: 30
   Recipes:  Chocolate Chip Cookies, Apple Yogurt Smoothie, Cheese Bread, Butter Muffins
*/
