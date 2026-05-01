use HeartyHearthDB
go 
/*
Our website development is underway! 
Below is the layout of the pages on our website, please provide the SQL to produce the necessary result sets.

Note: 
a) When the word 'specific' is used, pick one record (of the appropriate type, recipe, meal, etc.) for the query. 
    The way the website works is that a list of items are displayed and then the user picks one and navigates to the "details" page.
b) Whenever you have a record for a specific item include the name of the picture for that item. That is because the website will always show a picture of the item.
*/

/*
Home Page
    One result set with the number of recipes, meals, and cookbooks. Each row should have a column with the item name (Ex: Recipes) and a column with the count.
*/

select ItemName = 'Recipes', Count = count(RecipeId) from Recipe
union select 'Meals', count(MealId) from Meal 
union select 'Cookbooks', count(CookbookId) from Cookbook
/*
Recipe list page:
    List of all Recipes that are either published or archived, published recipes should appear at the top. Archived recipes should appear gray on the website.
	In order for the recipe name to be gray on the website, surround the archived recipe names with: <span style="color:gray">recipe name</span>
    In the resultset show the Recipe with its status, dates it was published and archived in mm/dd/yyyy format (blank if not archived), user, number of calories and number of ingredients.
    Tip: You'll need to use the convert function for the dates
*/
select 
    RecipeName = case when r.RecipeStatus = 'Archived' then concat('<span style="color:gray">', r.RecipeName, '</span>') else r.RecipeName end, 
    r.RecipeStatus, 
    PublishedDate = isnull(convert(varchar, r.PublishedDate, 101), ''), 
    ArchivedDate = isnull(convert(varchar, r.ArchivedDate, 101), ''), 
    UserName = concat(ua.FirstName, ' ', ua.LastName),
    r.CalorieCount, 
    NumIngredients = count(ri.IngredientId)
from Recipe r 
join UserAccount ua 
on r.UserId = ua.UserId
join RecipeIngredient ri 
on r.RecipeId = ri.RecipeId
where r.RecipeStatus in ('Published', 'Archived')
group by ri.RecipeId, r.RecipeName, r.PublishedDate, r.ArchivedDate, ua.FirstName, ua.LastName, r.CalorieCount, r.RecipeStatus
order by r.RecipeStatus desc 

/*
Recipe details page:
    Show for a specific recipe (three result sets):
        a) Recipe header: recipe name, number of calories, number of ingredients and number of steps.
        b) List of ingredients: show the measurement quantity, measurement type and ingredient in one column, sorted by sequence. Ex. 1 Teaspoon Salt  
        c) List of prep steps sorted by sequence.
*/
--Peanut Chews 
    --a)Recipe Header
    select r.RecipeName, r.CalorieCount, NumIngredients = count(distinct ri.IngredientId), NumSteps = count(distinct rs.StepDesc), r.ImageName
    from Recipe r 
    join RecipeIngredient ri 
    on r.RecipeId = ri.RecipeId
    join RecipeStep rs 
    on r.RecipeId = rs.RecipeId
    where r.RecipeName = 'Peanut Chews'
    group by r.RecipeId, r.RecipeName, r.CalorieCount, r.ImageName
    --b)List of Ingredients 
    select ListOfIngredients = trim(
        concat(
            isnull(convert(varchar, ri.Quantity), ''), 
            isnull(ri.QuantityDesc, ''), 
            ' ', 
            case 
                when ri.Quantity <= 1 then u.UnitName 
                when ri.Quantity is null then u.UnitName 
                else u.UnitPluralName end, 
            ' ', 
            i.IngredientName
            )
        ),
        i.ImageName
    from RecipeIngredient ri
    join Ingredient i 
    on ri.IngredientId = i.IngredientId
    join Unit u 
    on u.UnitId = ri.UnitId
    join Recipe r 
    on r.RecipeId = ri.RecipeId
    where r.RecipeName = 'Peanut Chews'
    order by ri.IngredientSequence asc 
    --c) List of Prep Steps 
    select rs.StepSequence, rs.StepDesc
    from Recipe r 
    join RecipeStep rs 
    on r.RecipeId = rs.RecipeId
    where r.RecipeName = 'Peanut Chews'
    order by rs.StepSequence asc 
    
/*
Meal list page:
    For all active meals, show the meal name, user that created the meal, number of calories for the meal, number of courses, and number of recipes per each meal, sorted by name of meal
*/
select m.MealName, ua.FirstName, ua.LastName, NumCalories = sum(r.CalorieCount), NumCourses = count(mc.MealCourseId), NumRecipes = count(cr.CourseRecipeId)
from Meal m 
join MealCourse mc 
on m.MealId = mc.MealId
join CourseRecipe cr 
on cr.MealCourseId = mc.MealCourseId
join Recipe r 
on r.RecipeId = cr.RecipeId
join UserAccount ua 
on ua.UserId = m.UserId
where m.IsActive = 1
group by m.MealId, m.MealName, ua.FirstName, ua.LastName
order by m.MealName


/*
Meal details page:
    Show for a specific meal:
        a) Meal header: meal name, user, date created.
        b) List of all recipes: Result set should have one column, including the course type, whether the dish is serverd as main/side (if it's the main course), and recipe name. 
			Format for main course: CourseType: Main/Side dish - Recipe Name. 
            Format for non-main course: CourseType: Recipe Name
            Main dishes of the main course should be bold, using the bold tags as shown below
                ex: 
                    Appetizer: Mixed Greens
                    <b>Main: Main dish - Onion Pastrami Chicken</b>
					Main: Side dish - Roasted cucumbers with mustard
*/
--a) Meal Header
select m.MealName, ua.FirstName, ua.LastName, m.DateCreated, m.ImageName
from Meal m 
join UserAccount ua 
on ua.UserId = m.UserId
where m.MealName = 'Breakfast Bash'
--b) List of All Recipes 
select RecipeList = 
    case when c.CourseName = 'Main' and cr.IsMainDish = 1 
    then concat('<b>Main: Main dish - ', r.RecipeName, '</b>')
    when c.CourseName = 'Main' and cr.IsMainDish = 0
    then concat('Main: Side dish - ', r.RecipeName)
    else concat(c.CourseName, ': ', r.RecipeName) end 
from CourseRecipe cr 
join Recipe r 
on r.RecipeId = cr.RecipeId
join MealCourse mc 
on mc.MealCourseId = cr.MealCourseId
join Course c 
on c.CourseId = mc.CourseId
join Meal m 
on m.MealId = mc.MealId
where m.MealName = 'Breakfast Bash'
order by cr.CourseRecipeSequence asc 
/*
Cookbook list page:
    Show all active cookbooks with author and number of recipes per book. Sorted by book name.
*/
select c.CookbookName, ua.FirstName, ua.LastName, NumRecipes = count(cr.RecipeId)
from Cookbook c 
join CookbookRecipe cr 
on cr.CookbookId = c.CookbookId
join UserAccount ua 
on ua.UserId = c.UserId
where c.IsActive = 1
group by c.CookbookName, ua.FirstName, ua.LastName
order by c.CookbookName
/*
Cookbook details page:
    Show for specific cookbook:
    a) Cookbook header: cookbook name, user, date created, price, number of recipes.
    b) List of all recipes in the correct order. Include recipe name, cuisine and number of ingredients and steps.  
        Note: User will click on recipe to see all ingredients and steps.
*/
--a) Cookbook Header
select c.CookbookName, ua.FirstName, ua.LastName, c.DateCreated, c.CookbookPrice, NumRecipes = count(cr.RecipeId)
from Cookbook c 
join CookbookRecipe cr 
on c.CookbookId = cr.CookbookId
join UserAccount ua 
on ua.UserId = c.UserId
where c.CookbookName = 'Treats for Two'
group by c.CookbookName, ua.FirstName, ua.LastName, c.DateCreated, c.CookbookPrice
--b) Recipe List 
;
  with x as(
    select r.RecipeName, NumSteps = count(rs.RecipeStepId)
    from RecipeStep rs 
    join Recipe r 
    on r.RecipeId = rs.RecipeId
    group by r.RecipeName
  )
  select r.RecipeName , ct.CuisineTypeName, NumIngredients = count(ri.IngredientId), x.NumSteps
  from Cookbook c 
  join CookbookRecipe cr 
  on c.CookbookId = cr.CookbookId
  join Recipe r 
  on r.RecipeId = cr.RecipeId
  join CuisineType ct 
  on ct.CuisineTypeId = r.CuisineTypeId
  join RecipeIngredient ri 
  on ri.RecipeId = r.RecipeId
  join x 
  on x.RecipeName = r.RecipeName
  where c.CookbookName = 'Treats for Two'
  group by r.RecipeName, ct.CuisineTypeName, x.NumSteps, cr.CookbookRecipeSequence
  order by cr.CookbookRecipeSequence asc 
/*
April Fools Page:
    On April 1st we have a page with a joke cookbook. For that page provide the following.
    a) A list of all the recipes that are in all cookbooks. The recipe name should be the reverse of the real name with the first letter capitalized and all others lower case.
        There are matching pictures for those names, include the reversed picture names so that we can show the joke pictures.
        Note: ".jpg" file extension must be at the end of the reversed picture name EX: Recipe_Seikooc_pihc_etalocohc.jpg
    b) When the user clicks on any recipe they should see a spoof steps lists showing the step instructions for the LAST step of EACH recipe in the system. No sequence required.
        Hint: Use CTE
*/
--a) Reversed List of Recipes
select distinct RecipeName = concat(
    upper(
        substring(reverse(r.RecipeName), 1, 1)
        ),
    lower(
        substring(reverse(r.RecipeName), 2, len(r.RecipeName))
        )   
    ),
    ImageName = replace(
        concat(
        'Recipe_',
    upper(
        substring(reverse(r.RecipeName), 1, 1)
        ),
    lower(
        substring(reverse(r.RecipeName), 2, len(r.RecipeName))
        ),
        '.jpg'
    ), ' ', '_'
    )
from Cookbook c 
join CookbookRecipe cr 
on c.CookbookId = cr.CookbookId
join Recipe r 
on r.RecipeId = cr.RecipeId

--b)Spoof Step List 
;
with x as(
    select r.RecipeId, LastStep =  max(rs.StepSequence)
    from RecipeStep rs 
    join Recipe r 
    on r.RecipeId = rs.RecipeId
    group by r.RecipeId
)
select rs.StepDesc
from Recipe r 
join RecipeStep rs 
on rs.RecipeId = r.RecipeId
join x 
on x.RecipeId = r.RecipeId
and x.LastStep = rs.StepSequence
/*
For site administration page:
5 seperate reports
    a) List of how many recipes each user created per status. Show 0 if user has no recipes at all.
    b) List of how many recipes each user created and average amount of days that it took for the user's recipes to be published.
    c) For each user, show three columns: Total number of meals, Total Active meals, Total Inactive meals. Show 0 if none
        Hint: For active/inactive columns, use SUM function with CASE to only include in sum if active/inactive 
    d) For each user, show three columns: Total number of cookbooks, Total Active cookbooks, Total Inactive cookbooks. Show 0 if none
        Hint: For active/inactive columns, use SUM function with CASE to only include in sum if active/inactive 
    e) List of archived recipes that were never published, and how long it took for them to be archived.
*/
--a) List of how many recipes each user created per status.
;
with x as(
    select ua.UserId, r.RecipeStatus, NumRecipes = count(r.RecipeId) 
    from UserAccount ua 
    left join Recipe r 
    on r.UserId = ua.UserId
    group by ua.UserId, r.RecipeStatus
)
select ua.FirstName, ua.LastName,
    Drafted = sum(case when x.RecipeStatus = 'Drafted' then NumRecipes else 0 end),
    Published = sum(case when x.RecipeStatus = 'Published' then NumRecipes else 0 end),
    Archived = sum(case when x.RecipeStatus = 'Archived' then NumRecipes else 0 end)
from x 
left join UserAccount ua 
on x.UserId = ua.UserId
group by ua.FirstName, ua.LastName
--b) List of how many recipes each user created and average amount of days that it took for the user's recipes to be published.
select ua.UserId, ua.FirstName, ua.LastName, NumRecipes = count(r.RecipeId), AvgDaysToPublish = avg(datediff(day, r.DraftedDate, r.PublishedDate))
from UserAccount ua 
join Recipe r 
on ua.UserId = r.UserId
group by ua.UserId, ua.FirstName, ua.LastName
--c)Total number of meals, Total Active meals, Total Inactive meals per user.
select ua.UserId, ua.FirstName, ua.LastName,  
TotalActiveMeals = sum(case when m.IsActive = 1 then 1 else 0 end),
TotalInactiveMeals = sum(case when m.IsActive = 0 then 1 else 0 end),
TotalMeals = count(m.MealId)
from UserAccount ua 
join Meal m 
on m.UserId = ua.UserId
group by ua.UserId, ua.FirstName, ua.LastName
--d) Total number of cookbooks, Total Active cookbooks, Total Inactive cookbooks per user.
select ua.UserId, ua.FirstName, ua.LastName,  
TotalActiveCookbooks = sum(case when c.IsActive = 1 then 1 else 0 end),
TotalInactiveCookbooks = sum(case when c.IsActive = 0 then 1 else 0 end),
TotalCookbooks = count(c.CookbookId)
from UserAccount ua 
join Cookbook c 
on ua.UserId = c.UserId
group by ua.UserId, ua.FirstName, ua.LastName
--e) List of archived recipes that were never published, and how long it took for them to be archived.
select r.RecipeId, r.RecipeName, DaysToArchive = datediff(day, r.DraftedDate, r.ArchivedDate) 
from Recipe r 
where r.DraftedDate is not null 
and r.PublishedDate is null 
and r.ArchivedDate is not null 
/*
For user dashboard page:
    a) For a specific user, show one result set with the number of recipes, meals, and cookbooks. Each row should have a column with the item name (Ex: Recipes) and a column with the count.
        Tip: If you would like, you can use a CTE to get the User Id once instead of in each union select
*/
;
with x as(
    select ua.UserId
    from UserAccount ua 
    where ua.UserName = 'dpascal@heartyhearth.com'
)
select ItemName = 'Recipes', Amount = count(r.RecipeId) from Recipe r join x on r.UserId = x.UserId 
union select 'Meals', count(m.MealId) from Meal m join x on m.UserId = x.UserId
union select 'Cookbooks', count(c.CookbookId) from Cookbook c join x on c.UserId = x.UserId
/*
    b) List of the user's recipes, display the status and the number of hours between the status it's in and the one before that. Omit recipes in drafted status.
*/
;
with x as(
    select ua.UserId
    from UserAccount ua 
    where ua.UserName = 'dpascal@heartyhearth.com'
)
select r.RecipeName, r.RecipeStatus, 
NumHours = datediff(hour, 
case when r.RecipeStatus = 'Published' then r.DraftedDate when r.RecipeStatus = 'Archived' and r.PublishedDate is not null then r.PublishedDate when r.RecipeStatus = 'Archived' and r.PublishedDate is null then r.DraftedDate end,
case r.RecipeStatus when 'Published' then r.PublishedDate when 'Archived' then r.ArchivedDate end)
from Recipe r 
join x 
on x.UserId = r.UserId
where r.RecipeStatus <> 'Drafted'
order by r.RecipeName
/*
    OPTIONAL CHALLENGE QUESTION
    c) Show a list of cuisines and the count of recipes the user has per cuisine, 0 if none
        Hint: Start by writing a CTE to give you cuisines for which the user does have recipes. 
*/

;
with x as(
    select ct.CuisineTypeId, ct.CuisineTypeName, r.RecipeId
    from UserAccount ua 
    join Recipe r 
    on r.UserId = ua.UserId
    join CuisineType ct 
    on ct.CuisineTypeId = r.CuisineTypeId
    where ua.UserName = 'dpascal@heartyhearth.com'
)
select ct.CuisineTypeName, NumRecipes = count(r.RecipeId)
from CuisineType ct 
left join x 
on x.CuisineTypeId = ct.CuisineTypeId
left join Recipe r 
on r.RecipeId = x.RecipeId
group by ct.CuisineTypeName
order by NumRecipes desc 
