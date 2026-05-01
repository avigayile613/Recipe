use HeartyHearthDB
go 
drop table if exists CookbookRecipe
drop table if exists Cookbook
drop table if exists CourseRecipe
drop table if exists MealCourse
drop table if exists Course 
drop table if exists Meal 
drop table if exists RecipeIngredient
drop table if exists RecipeStep
drop table if exists Recipe
drop table if exists CuisineType
drop table if exists Ingredient
drop table if exists Unit
drop table if exists UserAccount
go 

--User 
create table dbo.UserAccount(
    UserId int not null identity primary key,
    FirstName varchar(35) not null 
        constraint c_UserAccount_FirstName_cannot_be_blank check(FirstName <> ''),
    LastName varchar(35) not null 
        constraint c_UserAccount_LastName_cannot_be_blank check(LastName <> ''),
    UserName varchar(40) not null 
        constraint c_UserAccount_UserName_cannot_be_blank check(UserName <> '')
        constraint u_UserAccount_UserName unique
)
go 

--CuisineType 
create table dbo.CuisineType(
    CuisineTypeId int not null identity primary key,
    CuisineTypeName varchar(50) not null 
        constraint c_CuisineType_Name_cannot_be_blank check(CuisineTypeName <> '')
        constraint u_CuisineType_Name unique
)
go 

--Ingredient 
create table dbo.Ingredient(
    IngredientId int not null identity primary key,
    IngredientName varchar(35) not null 
        constraint c_Ingredient_SingularName_cannot_be_blank check(IngredientName <> '')
        constraint u_Ingredient_SingularName unique,
    IngredientPluralName varchar(35) null 
        constraint c_Ingredient_PluralName_cannot_be_blank check(IngredientPluralName <> ''),
    ImageName as concat('Ingredient_', replace(IngredientName,' ','_'), '.jpg') persisted
)
go 
--Unit
create table dbo.Unit(
    UnitId int not null identity primary key,
    UnitName varchar(35) not null 
        constraint c_Unit_SingularName_cannot_be_blank check(UnitName <> '')
        constraint u_Unit_SingularName unique,
    UnitPluralName varchar(35) null 
        constraint c_Unit_PluralName_cannot_be_blank check(UnitPluralName <> '')
        constraint u_Unit_PluralName unique,
    UnitAbbreviation varchar(35) null
        constraint c_Unit_Abbreviation_cannot_be_blank check(UnitAbbreviation <> '')
)
go 

--Recipe 
create table dbo.Recipe(
    RecipeId int not null identity primary key,
    RecipeName varchar(75) not null 
        constraint c_Recipe_Name_cannot_be_blank check(RecipeName <> '')
        constraint u_Recipe_Name unique,
    UserId int not null constraint f_UserAccount_Recipe foreign key references UserAccount(UserId),
    CuisineTypeId int not null constraint fk_Cuisine_Recipe foreign key references CuisineType(CuisineTypeId),
    CalorieCount int not null 
        constraint c_Recipe_CalorieCount_cannot_be_negative check(CalorieCount > 0),
    DraftedDate date not null default getdate(),
    PublishedDate datetime null default null,
    ArchivedDate date null default null,
    ImageName as concat('Recipe_',replace(RecipeName,' ','_'),'.jpg') persisted,
    RecipeStatus as 
        case 
            when ArchivedDate is not null then 'Archived' 
            when PublishedDate is not null then 'Published' 
            else 'Drafted' 
        end persisted,
    --PublishedDate Constraints 
    constraint c_Recipe_PublishedDate_is_required
    check((RecipeStatus = 'Drafted' and PublishedDate is null ) or --status is Draft, so no published date 
        (RecipeStatus = 'Published' and PublishedDate is not null ) or --statis is Published, so yes published date
        (RecipeStatus = 'Archived' and PublishedDate is not null) or --status is Archive, so yes published date (was once published)
        (RecipeStatus = 'Archived' and PublishedDate is null)), --status is Archive, so no published date (was never published)
    --ArchiveDate Constraints 
    constraint c_Recipe_ArchiveDate_is_required
    check((RecipeStatus = 'Drafted' and ArchivedDate is null ) or --status is Draft, so no archive date 
        (RecipeStatus = 'Published' and ArchivedDate is null ) or --status is Published, so no archive date 
        (RecipeStatus = 'Archived' and ArchivedDate is not null) ), --status is Archive, so yes archive date 
    --Date Constraints 
    constraint c_PublishedDate_cannot_be_before_the_DraftDate
    check((PublishedDate >= DraftedDate) or (PublishedDate is null)),
    constraint c_DraftDate_PublishedDate_and_ArchiveDate_cannot_be_in_the_future
    check((PublishedDate <= getdate() or PublishedDate is null) and 
        (DraftedDate <= getdate() or DraftedDate is null) and 
        (ArchivedDate <= getdate() or ArchivedDate is null))
)
go 
--RecipeStep 
create table dbo.RecipeStep(
    RecipeStepId int not null identity primary key, 
    RecipeId int not null constraint fk_Recipe_RecipeStep foreign key references Recipe(RecipeId),
    StepSequence int not null 
        constraint c_RecipeStep_Sequence_cannot_be_negative check(StepSequence > 0),
    StepDesc varchar(200) not null 
        constraint c_RecipeStep_Desc_cannot_be_blank check(StepDesc <> ''),
    --constraint to prevent steps in a recipe from having the same sequence:
    constraint u_RecipeStep_RecipeId_StepSequence unique(RecipeId, StepSequence)
)
go 
--RecipeIngredient 
create table dbo.RecipeIngredient(
    RecipeIngredientId int not null identity primary key,
    RecipeId int not null constraint fk_Recipe_RecipeIngredient foreign key references Recipe(RecipeId),
    IngredientSequence int not null 
        constraint c_RecipeIngredient_Sequence_cannot_be_negative check(IngredientSequence > 0),
    Quantity decimal(5,2) null,
    QuantityDesc varchar(10) null default null,
    UnitId int null constraint fk_Unit_RecipeIngredient foreign key references Unit(UnitId),
    IngredientId int not null constraint fk_Ingredient_RecipeIngredient foreign key references Ingredient(IngredientId),
    PrepNote varchar(75) null default null
        constraint c_RecipeIngredient_PrepNote_cannot_be_blank check(PrepNote <> ''),
        constraint c_RecipeIngredient_Quantity_cannot_be_negative check(Quantity > 0),
    --constraint to prevent repetition of ingredients in recipes:
    constraint u_RecipeIngredient_RecipeId_IngredientId unique(RecipeId, IngredientId),
    --constraint to prevent ingredients in a recipe from having the same sequence:
    constraint u_RecipeIngredient_RecipeId_IngredientSequence unique(RecipeId, IngredientSequence)
)
go 
--Meal
create table dbo.Meal(
    MealId int not null identity primary key,
    MealName varchar(50) not null 
        constraint c_Meal_Name_cannot_be_blank check(MealName <> '')
        constraint u_Meal_Name unique,
    UserId int not null constraint f_UserAccount_Meal foreign key references UserAccount(UserId),
    DateCreated date not null default getdate()
        constraint c_DateCreated_cannot_be_in_the_future check(DateCreated <= getdate()),
    IsActive bit not null default 1,
    ImageName as concat('Meal_',replace(MealName,' ','_'),'.jpg') persisted
)
go 
--Course 
create table dbo.Course(
    CourseId int not null identity primary key,
    CourseName varchar(20) not null 
        constraint c_Course_Name_cannot_be_blank check(CourseName <> '')
        constraint u_Course_Name unique
)
go 
--MealCourse
create table dbo.MealCourse(
    MealCourseId int not null identity primary key,
    MealId int not null constraint fk_Meal_MealCourse foreign key references Meal(MealId),
    CourseId int not null constraint fk_Course_MealCourse foreign key references Course(CourseId),
    CourseSequence int not null 
        constraint c_Course_Sequence_cannot_be_negative check(CourseSequence > 0),
    --prevent courses in a meal from having the same sequence:
    constraint u_MealCourse_MealId_CourseId_CourseSequence unique(MealId, CourseId, CourseSequence),
    --prevent a meal from having 2 of the same courses:
    constraint u_MealCourse_MealId_CourseId unique(MealId, CourseId)
)
go 
--CourseRecipe
create table dbo.CourseRecipe(
    CourseRecipeId int not null identity primary key,
    MealCourseId int not null constraint fk_MealCourse_CourseRecipe foreign key references MealCourse(MealCourseId), 
    RecipeId int not null constraint fk_Recipe_CourseRecipe foreign key references Recipe(RecipeId),
    CourseRecipeSequence int not null 
        constraint c_CourseRecipe_Sequence_cannot_be_negative check(CourseRecipeSequence > 0),
    IsMainDish bit not null,
    --prevent a course from having 2 of the same recipe.
    constraint u_CourseRecipe_MealCourseId_RecipeId unique(MealCourseId, RecipeId),
    --prevent 2 recipes in a course from having the same sequence.
    constraint u_CourseRecipe_CourseRecipeSequence_MealCourseid unique(CourseRecipeSequence, MealCourseId)
)
go 
--Cookbook 
create table dbo.Cookbook(
    CookbookId int not null identity primary key,
    CookbookName varchar(50) not null 
        constraint c_Cookbook_Name_cannot_be_blank check (CookbookName <> '') 
        constraint u_Cookbook_Name unique,
    UserId int not null constraint f_UserAccount_Cookbook foreign key references UserAccount(UserId),
    CookbookPrice decimal (4,2) not null 
        constraint c_Cookbook_Price_cannot_be_negative check(CookbookPrice > 0),
    DateCreated date not null default getdate()
        constraint c_Cookbook_DateCreated_cannot_be_in_the_future check(DateCreated <= getdate()),
    IsActive bit not null default 1
)
go 
--CookbookRecipe
create table dbo.CookbookRecipe(
    CookbookRecipeId int not null identity primary key,
    CookbookRecipeSequence int not null 
        constraint c_CookbookRecipe_Sequence_cannot_be_negative check(CookbookRecipeSequence > 0),
    CookbookId int not null constraint fk_Cookbook_CookbookRecipe foreign key references Cookbook(CookbookId),
    RecipeId int not null constraint fk_Recipe_CookbookRecipe foreign key references Recipe(RecipeId),
    constraint u_CookbookRecipe_CookbookId_RecipeId unique(CookbookId, RecipeId),
    constraint u_CookbookRecipe_CookbookRecipeSequence_CookbookId unique(CookbookRecipeSequence, CookbookId)
)
go 

