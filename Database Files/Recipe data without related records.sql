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
go 

insert Recipe(RecipeName, UserId, CuisineTypeId, CalorieCount, DraftedDate, PublishedDate, ArchivedDate)
select 'Cholent', 4, 6, 600, '2026-04-25', '2026-05-05', null
union select 'Gefilte Fish', 5, 7, 300, '2026-03-19', null, null 
union select 'Franks N Blanks', 6, 8, 700, '2026-02-11', '2026-02-28', '2026-04-28'
union select 'Yogurt Pops', 5, 8, 90, '2026-01-13', '2026-01-19', null
union select 'Crispy Chicken Fingers', 4, 10, 700, '2026-04-11', null, null 
union select 'Onion Soup', 6, 9, 500, '2026-02-16', '2026-02-28', null
union select 'Corn Dogs', 6, 8, 700, '2025-11-14', '2026-01-01', null
union select 'Mango Sorbet', 4, 8, 700, '2026-03-14', '2026-03-29', null