using CPUFramework;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace RecipeWinForms
{
    public partial class frmRecipe : Form
    {
        List<Label> lstrecipeinfolabels;
        public frmRecipe()
        {
            InitializeComponent();
            lstrecipeinfolabels = new() {lblRecipeName, lblAuthor, lblRecipeStatus, lblCuisineType, lblCalories, lblDateDrafted, lblDatePublished, lblDateArchived};
        }

        public void ShowRecipeInfo(int recipeid)
        {
            string sql = "select r.RecipeId, r.RecipeName, Author = concat(ua.FirstName, ' ', ua.LastName), r.RecipeStatus, ct.CuisineTypeName, r.CalorieCount, r.DraftedDate, r.PublishedDate, r.ArchivedDate from Recipe r join UserAccount ua on r.UserId = ua.UserId join CuisineType ct on ct.CuisineTypeId = r.CuisineTypeId where r.RecipeId = " + recipeid.ToString();
            DataTable dt = SQLUtility.GetDataTable(sql);
            ClearBindings();
            lblRecipeName.DataBindings.Add("Text", dt, "RecipeName");
            lblAuthor.DataBindings.Add("Text", dt, "Author");
            lblRecipeStatus.DataBindings.Add("Text", dt, "RecipeStatus");
            lblCuisineType.DataBindings.Add("Text", dt, "CuisineTypeName");
            lblCalories.DataBindings.Add("Text", dt, "CalorieCount");
            lblDateDrafted.DataBindings.Add("Text", dt, "DraftedDate");
            lblDatePublished.DataBindings.Add("Text", dt, "PublishedDate");
            lblDateArchived.DataBindings.Add("Text", dt, "ArchivedDate");
        }

        private void ClearBindings()
        {
            lstrecipeinfolabels.ForEach(l => l.DataBindings.Clear());
        }

        public void ShowRecipeIngredients(int recipeid)
        {
            string sql = "select ri.IngredientSequence, Ingredients = concat(case when ri.Quantity is null then '' else case when ri.Quantity = FLOOR(ri.Quantity) then cast(cast(ri.Quantity as int) as varchar) + ' ' when ri.Quantity < 1 and ri.Quantity > 0 then stuff(rtrim(rtrim(format(ri.Quantity, '0.####'), '0'), '.') ,1,1,'') + ' ' else rtrim(rtrim(format(ri.Quantity, '0.####'), '0'), '.') + ' ' end end, isnull(ri.QuantityDesc + ' ', ''), isnull(case when ri.Quantity > 1 then u.UnitPluralName else u.UnitName end + ' ', ''), case when ri.Quantity > 1 and i.IngredientPluralName is not null then i.IngredientPluralName else i.IngredientName end, isnull(' ' + ri.PrepNote, '')) from Recipe r join RecipeIngredient ri on r.RecipeId = ri.RecipeId join Ingredient i on i.IngredientId = ri.IngredientId left join Unit u on u.UnitId = ri.UnitId where r.RecipeId = " + recipeid.ToString();
            DataTable dt = SQLUtility.GetDataTable(sql);
            gIngredients.DataSource = dt;
        }

        public void ShowRecipeSteps(int recipeid)
        {
            string sql = "select rs.StepSequence, rs.StepDesc from Recipe r join RecipeStep rs on r.RecipeId = rs.RecipeId where r.RecipeId = " + recipeid;
            DataTable dt = SQLUtility.GetDataTable(sql);
            gSteps.DataSource = dt;
        }
    }
}
