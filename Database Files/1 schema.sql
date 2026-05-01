HEARTY HEALTH 

/*
-CuisineType 
    CuisineTypeId
        int not null identity primary key 
    CuisineTypeName
        varchar (50) 
        not null, not blank, unique

-Ingredient
    IngredientId
        int not null identity primary key 
    IngredientName
        varchar(35)
        not null, not blank, unique 

-UnitOfMeasure 
    UnitOfMeasureId
        int not null identity primary key 
    UnitOfMeasureName
        varchar (35)
        not null, not blank, unique 
    UnitOfMeasureAbbreviation 
        varchar (35)
        not null, not blank, unique  

-RecipeStatus 
    RecipeStatusId
        int not null identity primary key 
    RecipeStatusDesc
        varchar (10)
        not null, not blank, unique 
            Constraints
                RecipeStatusDesc must be Draft, Published, or Archive

-Recipe 
    RecipeId
        int not null identity primary key 
    RecipeName
        varchar (75) 
        not null, not blank, unique 
    CuisineTypeId
        fk to Cuisine(CuisineTypeId) not null 
    CalorieCount
        int 
        not null, not negative 
    RecipeStatusId 
        fk to RecipeStatus(RecipeStatusId) not null 
    DraftDate 
        date, not null, default getdate()
    PublishedDate 
        datetime, null, default null 
    ArchiveDate
        date, null, default null 
            Constraints 
                DraftDate, PublishedDate, and ArchiveDate cannot be in the future 

-RecipeStep
    RecipeStepId
        int not null identity primary key 
    RecipeId 
        fk to Recipe(RecipeId) not null 
    StepSequence
        int 
        not null, not negative
    StepDesc 
        varchar (200)
        not null, not blank 
            Constraints 
                RecipeId and StepSequence must be unique 

-RecipeIngredient
    RecipeIngredientId
        int not null identity primary key 
    RecipeId
        fk to Recipe(RecipeId)
    IngredientSequence
        int
        not null, not negative, unique 
    IngredientId 
        fk to Ingredient(IngredientId)
    UnitOfMeasureId 
        fk to UnitOfMeasure(UnitOfMeasureId)
    Quantity
        decimal (5,2)
        not null, not negative 
            Constraints 
                RecipeId, IngredientId, and IngredientSequence must be unique 

-Meal 
    MealId
        int not null identity primary key 
    DateCreated 
        date 
        not null 
        default getdate()
        constraint DateCreated cannot be in the future 
    IsActive 
        bit not null default 1

-Course
    CourseId
        int not null identity primary key 
    CourseName
        varchar (20)
        not null, not blank, unique 
    CourseSequence
        int 
        not null, not negative, unique 

-MealCourse
    MealCourseId
       int not null identity primary key  
    MealId 
        fk to Meal(MealId) not null 
    CourseId 
        fk to Course(CourseId) not null 

-CourseRecipe
    CourseRecipeId
        int not null identity primary key 
    MealCourseId 
        fk to MealCourse(MealCourseId) not null 
    RecipeId 
        fk to Recipe(RecipeId) not null 
            Constraints 
                MealCourseId and RecipeId must be unique 

-Cookbook 
    CookbookId
        int not null identity primary key 
    CookbookName
        varchar(50)
        not null, not blank, unique 
    CookbookPrice
        decimal (4,2) 
        not null, not negative 
    DateCreated 
        date 
        not null, default getdate()
        constraint DateCreated cannot be in the future 
    IsActive 
        bit not null default 1
        

-CookbookRecipe
    CookbookRecipeId
        int not null identity primary key 
    CookbookRecipeSequence
        int 
        not null, not negative
    CookbookId
        fk to Cookbook(CookbookId)
    RecipeId 
        fk to Recipe(RecipeId)

-User
    UserId 
        int not null identity primary key 
    FirstName 
        varchar (35)
        not null, not blank 
    LastName 
        varchar (35)
        not null, not blank 
    UserName 
        varchar (40)
        not null, not blank, unique 

-Picture 
    PictureId 
        int not null identity primary key 
    PictureName
        varchar (50)
        not null, not blank 
        check constraint format must be like '%_%.jpg'
*/