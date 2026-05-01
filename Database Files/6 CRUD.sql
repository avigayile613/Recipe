use HeartyHearthDB
go 
--Note: some of these scripts are needed for specific items, when the instructions say "specific" pick one item in your data and specify it in the where clause using a unique value that identifies it, do not use the primary key.

--1) Sometimes when a staff member is fired. We need to eradicate everything from that user in our system. Write the SQL to delete a specific user and all the user's related records.

	--COURSE RECIPE 
--select *
delete cr 
from UserAccount ua 
join Meal m 
on m.UserId = ua.UserId
join MealCourse mc 
on mc.MealId = m.MealId
join CourseRecipe cr 
on cr.MealCourseId = mc.MealCourseId
where ua.UserName = 'rneuman@heartyhearth.com'
go 
	--DELETING THIS USERS RECIPES FROM OTHER USERS COURSES 
--select ua.FirstName, ua.LastName, r.RecipeId
delete cr 
from CourseRecipe cr 
join Recipe r 
on r.RecipeId = cr.RecipeId
join UserAccount ua 
on ua.UserId = r.UserId
join MealCourse mc 
on mc.MealCourseId = cr.MealCourseId
where ua.UserName = 'rneuman@heartyhearth.com'
go 
	--MEAL COURSE
--select *
delete mc 
from MealCourse mc 
join Meal m 
on m.MealId = mc.MealId
join UserAccount ua 
on ua.UserId = m.UserId
where ua.UserName = 'rneuman@heartyhearth.com'
go 
	--MEAL 
--select *
delete m 
from Meal m 
join UserAccount ua 
on ua.UserId = m.UserId
where ua.UserName = 'rneuman@heartyhearth.com'
go 
	--COOKBOOK RECIPE 
delete cr 
--select c.CookbookName, r.RecipeName, ua.FirstName
from Cookbook c 
join CookbookRecipe cr 
on c.CookbookId = cr.CookbookId
join Recipe r 
on r.RecipeId = cr.RecipeId
join UserAccount ua 
on ua.UserId = r.UserId
where ua.UserName = 'rneuman@heartyhearth.com'
go 
	--DELETING THIS USERS RECIPES FROM OTHER USERS COOKBOOKS 
delete cr 
--select c.CookbookName, c.UserId, r.RecipeId, r.UserId, ua.FirstName, ua.LastName
from Cookbook c 
join CookbookRecipe cr 
on cr.CookbookId = c.CookbookId
join UserAccount ua 
on ua.UserId = c.UserId
join Recipe r 
on r.RecipeId = cr.RecipeId
where ua.UserName = 'rneuman@heartyhearth.com'
go 
	--COOKBOOK 
--select *
delete c 
from Cookbook c 
join UserAccount ua 
on c.UserId = ua.UserId
where ua.UserName = 'rneuman@heartyhearth.com'
go 
	--RECIPE INGREDIENT 
delete ri 
--select *
from RecipeIngredient ri 
join Recipe r 
on r.RecipeId = ri.RecipeId
join UserAccount ua 
on ua.UserId = r.UserId
where ua.UserName = 'rneuman@heartyhearth.com'
go 
	--RECIPE STEP 
delete rs 
--select *
from RecipeStep rs 
join Recipe r 
on r.RecipeId = rs.RecipeId
join UserAccount ua 
on ua.UserId = r.UserId
where ua.UserName = 'rneuman@heartyhearth.com'
go 
	--RECIPE 
--select * 
delete r 
from Recipe r 
join UserAccount ua 
on ua.UserId = r.UserId
where ua.UserName = 'rneuman@heartyhearth.com'
go 
	--USER ACCOUNT 
delete ua 
--select *
from UserAccount ua 
where ua.UserName = 'rneuman@heartyhearth.com'
go 

--2) Sometimes we want to clone a recipe as a starting point and then edit it. For example we have a complex recipe (steps and ingredients) and want to make a modified version. Write the SQL that clones a specific recipe, add " - clone" to its name.

--RECIPE 
;
with x as(
	select *
	from Recipe r 
	where r.RecipeName = 'Cheese Bread'
)
insert Recipe(RecipeName, UserId, CuisineTypeId, CalorieCount)
select concat(x.RecipeName, '-clone'), x.UserId, x.CuisineTypeId, x.CalorieCount
from x 
go 
select * from Recipe 
--RECIPE INGREDIENT 
;
with x as(
	select ri.RecipeId, ri.IngredientSequence, ri.Quantity, ri.QuantityDesc, ri.UnitId, ri.IngredientId, ri.PrepNote
	from Recipe r 
	join RecipeIngredient ri 
	on r.RecipeId = ri.RecipeId
	where r.RecipeName = 'Cheese Bread'
)
insert RecipeIngredient(RecipeId, IngredientSequence, Quantity, QuantityDesc, UnitId, IngredientId, PrepNote)
select (select r.RecipeId from Recipe r where r.RecipeName = 'Cheese Bread-clone'),
x.IngredientSequence, x.Quantity, x.QuantityDesc, x.UnitId, x.IngredientId, x.PrepNote
from x 
go 
--RECIPE STEP 
;
with x as(
	select rs.RecipeId, rs.StepSequence, rs.StepDesc
	from RecipeStep rs 
	join Recipe r 
	on r.RecipeId = rs.RecipeId
	where r.RecipeName = 'Cheese Bread'
)
insert RecipeStep(RecipeId, StepSequence, StepDesc)
select (select r.RecipeId from Recipe r where r.RecipeName = 'Cheese Bread-clone'),
x.StepSequence, x.StepDesc
from x 
go 
/*
3) We offer users an option to auto-create a recipe book containing all of their recipes. 
Write a SQL script that creates the book for a specific user and fills it with their recipes.
The name of the book should be Recipes by Firstname Lastname. 
The price should be the number of recipes multiplied by $1.33
Sequence the book by recipe name.
Tip: To get a unique sequential number for each row in the result set use the ROW_NUMBER() function. See Microsoft Docs.
	 The following can be a column in your select statement: Sequence = ROW_NUMBER() over (order by colum name) , replace column name with the name of the column that the row number should be sorted
*/

--COOKBOOK 
;
with x as(
	select r.UserId, ua.FirstName, ua.LastName, NumRecipes = count(r.RecipeId)
	from Recipe r 
	join UserAccount ua 
	on r.UserId = ua.UserId
	where ua.UserName = 'dpascal@heartyhearth.com'
	group by r.UserId, ua.FirstName, ua.LastName
)
insert Cookbook(CookbookName, CookbookPrice, UserId, IsActive)
select concat('Recipes by ', x.FirstName, ' ', x.LastName),
	x.NumRecipes * 1.33,
	x.UserId,
	1
from x 
go 
--COOKBOOK RECIPE 
;
with x as(
	select r.RecipeId, r.RecipeName
	from Recipe r 
	join UserAccount ua 
	on r.UserId = ua.UserId
	where ua.UserName = 'dpascal@heartyhearth.com'
)
insert CookbookRecipe(CookbookId, RecipeId, CookbookRecipeSequence)
select (select CookbookId from Cookbook c where c.CookbookName = 'Recipes by Daniella Pascal'),
	x.RecipeId,
	row_number() over (order by x.RecipeName)
from x 
go 
/*
4) Sometimes the calorie count of of an ingredient changes and we need to change the calorie total for all recipes that use that ingredient.
Our staff nutritionist will specify the amount to change per measurement type, and of course multiply the amount by the quantity of the ingredient.
For example, the calorie count for butter went down by 2 per ounce, and 10 per stick of butter. 
Write an update statement that changes the number of calories of a recipe for a specific ingredient. 
The statement should include at least two measurement types, like the example above. 
*/
update r
set r.CalorieCount =  r.CalorieCount - (case u.UnitName when 'ounce' then 2 when 'stick' then 10 else 0 end * ri.Quantity)
--select r.RecipeId, r.RecipeName, r.CalorieCount, NewCalorieCount = r.CalorieCount + (case u.UnitNamewhen 'ounce' then 2when 'stick' then 10 end * ri.quantity), ri.IngredientId, ri.UnitId, u.UnitName
from Recipe r 
join RecipeIngredient ri 
on r.RecipeId = ri.RecipeId
join Ingredient i 
on i.IngredientId = ri.IngredientId
join Unit u 
on u.UnitId = ri.UnitId
where i.IngredientName = 'butter'

/*
5) We need to send out alerts to users that have recipes sitting in draft longer the average amount of time that recipes have taken to be published.
Produce a result set that has 4 columns (Data values in brackets should be replaced with actual data)
	User First Name, 
	User Last Name, 
	email address (first initial + lastname@heartyhearth.com),
	Alert: 
		Your recipe [recipe name] is sitting in draft for [X] hours.
		That is [Z] hours more than the average [Y] hours all other recipes took to be published.
*/
;
with x as(
  select AvgTimeInDraft = avg(datediff(hour, r.DraftedDate, r.PublishedDate))
  from Recipe r 
  where r.PublishedDate is not null 
  )
  select ua.FirstName, ua.lastname, EmailAddress = ua.UserName, 
    Alert = concat('Your recipe ', r.RecipeName, ' is sitting in draft for ', datediff(hour, r.DraftedDate, getdate()), ' hours. ', 
    'That is ', datediff(hour, r.DraftedDate, getdate()) - x.AvgTimeInDraft, ' hours more than the average ', x.AvgTimeInDraft, ' hours all other recipes took to be published.')
 from Recipe r 
 cross join x 
 join UserAccount ua 
 on ua.UserId = r.UserId 
 where r.PublishedDate is null and r.ArchivedDate is null 
 and datediff(hour, r.DraftedDate, getdate()) > x.AvgTimeInDraft
  
/*
6) We want to send out marketing emails for books. Produce a result set with one row and one column "Email Body" as specified below.
The email should have a unique guid link to follow, which should be shown in the format specified. 

Email Body:
Order cookbooks from HeartyHearth.com! We have [X] books for sale, average price is [Y]. You can order them all and receive a 25% discount, for a total of [Z].
Click <a href = "www.heartyhearth.com/order/[GUID]">here</a> to order.
*/
select EmailBody = concat(
  'Order cookbooks from HeartyHearth.com! We have ', count(c.CookbookId), ' books for sale, average price is $', convert(decimal(4, 2), avg(c.CookbookPrice)), '. ',
  'You can order them all and receive a 25% discount, for a total of $', convert(decimal(4, 2), (sum(c.CookbookPrice)) * .75), '. ',
  'Click ', '<a href = "www.heartyhearth.com/order/', newId(), '">here</a> to order.'
)
from Cookbook c 
where c.IsActive = 1 





