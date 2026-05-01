/*
Hearty Hearth

Cooking website
recipes, meals, cookbooks...

recipes are duplicated on many pages.
nothing should be duplicated, if changed in one place, it'll show everywhere.

-Recipes (unique)
-Calories
-Cuisine type (Chinese, Meditiranean...)  There is a master list.
-Ingredients (unique)
    measurement type (tblsp, lb...)
    amount 
    Ingredients have a specific order/sequence
-Directions
    Steps (has a number/order)
-Status 
    Draft (Staff is working on it - date)
    Published (date and time)
    Archive (Taken Off - date) Not deleted.

-Meals 
    Name (unique)
    Date Created 
    Courses (appetizer, main) has a sequence in the meal 
        no max amount of courses, but cant repeat a course in the same meal.
    Each course can have multiple recipes 

-cookbooks
    Name 
    Price 
    Date Created 
    Recipes (sequence how presented in cookbook)

Meals and Cookbooks - active or inactive 

-Pictures 
    Name (Name of type, name of picture (ingredient-baby-carrot))
Entity_Entity_Name.jpg like Recipe_French_Toast.jpg

-Users (Staff)
    First Name 
    Last Name 
    User Name 
*/