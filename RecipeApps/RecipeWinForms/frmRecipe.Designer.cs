namespace RecipeWinForms
{
    partial class frmRecipe
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            tblMain = new TableLayoutPanel();
            tblTitle = new TableLayoutPanel();
            label1 = new Label();
            lblRecipeName = new Label();
            lblAuthor = new Label();
            tblRecipeInfo = new TableLayoutPanel();
            lblCaptionRecipeStatus = new Label();
            lblCaptionCuisineType = new Label();
            lblCaptionCalories = new Label();
            lblCaptionDateDrafted = new Label();
            lblCaptionDatePublished = new Label();
            lblCaptionDateArchived = new Label();
            lblRecipeStatus = new Label();
            lblCuisineType = new Label();
            lblCalories = new Label();
            lblDateDrafted = new Label();
            lblDatePublished = new Label();
            lblDateArchived = new Label();
            tblIngredients = new TableLayoutPanel();
            lblCaptionIngredients = new Label();
            gIngredients = new DataGridView();
            tblSteps = new TableLayoutPanel();
            lblCaptionSteps = new Label();
            gSteps = new DataGridView();
            tblMain.SuspendLayout();
            tblTitle.SuspendLayout();
            tblRecipeInfo.SuspendLayout();
            tblIngredients.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)gIngredients).BeginInit();
            tblSteps.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)gSteps).BeginInit();
            SuspendLayout();
            // 
            // tblMain
            // 
            tblMain.ColumnCount = 1;
            tblMain.ColumnStyles.Add(new ColumnStyle(SizeType.Percent, 100F));
            tblMain.Controls.Add(tblTitle, 0, 0);
            tblMain.Controls.Add(tblRecipeInfo, 0, 1);
            tblMain.Controls.Add(tblIngredients, 0, 2);
            tblMain.Controls.Add(tblSteps, 0, 3);
            tblMain.Dock = DockStyle.Fill;
            tblMain.Location = new Point(0, 0);
            tblMain.Margin = new Padding(4);
            tblMain.Name = "tblMain";
            tblMain.RowCount = 4;
            tblMain.RowStyles.Add(new RowStyle(SizeType.Percent, 5F));
            tblMain.RowStyles.Add(new RowStyle(SizeType.Percent, 25F));
            tblMain.RowStyles.Add(new RowStyle(SizeType.Percent, 35F));
            tblMain.RowStyles.Add(new RowStyle(SizeType.Percent, 35F));
            tblMain.Size = new Size(1251, 718);
            tblMain.TabIndex = 0;
            // 
            // tblTitle
            // 
            tblTitle.ColumnCount = 3;
            tblTitle.ColumnStyles.Add(new ColumnStyle(SizeType.Percent, 47F));
            tblTitle.ColumnStyles.Add(new ColumnStyle(SizeType.Percent, 6F));
            tblTitle.ColumnStyles.Add(new ColumnStyle(SizeType.Percent, 47F));
            tblTitle.Controls.Add(label1, 1, 0);
            tblTitle.Controls.Add(lblRecipeName, 0, 0);
            tblTitle.Controls.Add(lblAuthor, 2, 0);
            tblTitle.Dock = DockStyle.Fill;
            tblTitle.Location = new Point(4, 4);
            tblTitle.Margin = new Padding(4);
            tblTitle.Name = "tblTitle";
            tblTitle.RowCount = 1;
            tblTitle.RowStyles.Add(new RowStyle(SizeType.Percent, 100F));
            tblTitle.Size = new Size(1243, 27);
            tblTitle.TabIndex = 0;
            // 
            // label1
            // 
            label1.AutoSize = true;
            label1.Dock = DockStyle.Fill;
            label1.Location = new Point(588, 0);
            label1.Margin = new Padding(4, 0, 4, 0);
            label1.Name = "label1";
            label1.Size = new Size(66, 27);
            label1.TabIndex = 0;
            label1.Text = "by";
            label1.TextAlign = ContentAlignment.MiddleCenter;
            // 
            // lblRecipeName
            // 
            lblRecipeName.AutoSize = true;
            lblRecipeName.Dock = DockStyle.Fill;
            lblRecipeName.Location = new Point(3, 0);
            lblRecipeName.Name = "lblRecipeName";
            lblRecipeName.Size = new Size(578, 27);
            lblRecipeName.TabIndex = 1;
            lblRecipeName.Text = "Recipe Name";
            lblRecipeName.TextAlign = ContentAlignment.MiddleRight;
            // 
            // lblAuthor
            // 
            lblAuthor.AutoSize = true;
            lblAuthor.Dock = DockStyle.Fill;
            lblAuthor.Location = new Point(661, 0);
            lblAuthor.Name = "lblAuthor";
            lblAuthor.Size = new Size(579, 27);
            lblAuthor.TabIndex = 2;
            lblAuthor.Text = "Name";
            lblAuthor.TextAlign = ContentAlignment.MiddleLeft;
            // 
            // tblRecipeInfo
            // 
            tblRecipeInfo.ColumnCount = 2;
            tblRecipeInfo.ColumnStyles.Add(new ColumnStyle(SizeType.Percent, 30F));
            tblRecipeInfo.ColumnStyles.Add(new ColumnStyle(SizeType.Percent, 70F));
            tblRecipeInfo.Controls.Add(lblCaptionRecipeStatus, 0, 0);
            tblRecipeInfo.Controls.Add(lblCaptionCuisineType, 0, 1);
            tblRecipeInfo.Controls.Add(lblCaptionCalories, 0, 2);
            tblRecipeInfo.Controls.Add(lblCaptionDateDrafted, 0, 3);
            tblRecipeInfo.Controls.Add(lblCaptionDatePublished, 0, 4);
            tblRecipeInfo.Controls.Add(lblCaptionDateArchived, 0, 5);
            tblRecipeInfo.Controls.Add(lblRecipeStatus, 1, 0);
            tblRecipeInfo.Controls.Add(lblCuisineType, 1, 1);
            tblRecipeInfo.Controls.Add(lblCalories, 1, 2);
            tblRecipeInfo.Controls.Add(lblDateDrafted, 1, 3);
            tblRecipeInfo.Controls.Add(lblDatePublished, 1, 4);
            tblRecipeInfo.Controls.Add(lblDateArchived, 1, 5);
            tblRecipeInfo.Dock = DockStyle.Fill;
            tblRecipeInfo.Location = new Point(3, 38);
            tblRecipeInfo.Name = "tblRecipeInfo";
            tblRecipeInfo.RowCount = 6;
            tblRecipeInfo.RowStyles.Add(new RowStyle(SizeType.Percent, 16.666666F));
            tblRecipeInfo.RowStyles.Add(new RowStyle(SizeType.Percent, 16.666666F));
            tblRecipeInfo.RowStyles.Add(new RowStyle(SizeType.Percent, 16.666666F));
            tblRecipeInfo.RowStyles.Add(new RowStyle(SizeType.Percent, 16.666666F));
            tblRecipeInfo.RowStyles.Add(new RowStyle(SizeType.Percent, 16.666666F));
            tblRecipeInfo.RowStyles.Add(new RowStyle(SizeType.Percent, 16.666666F));
            tblRecipeInfo.Size = new Size(1245, 173);
            tblRecipeInfo.TabIndex = 1;
            // 
            // lblCaptionRecipeStatus
            // 
            lblCaptionRecipeStatus.AutoSize = true;
            lblCaptionRecipeStatus.Dock = DockStyle.Fill;
            lblCaptionRecipeStatus.Location = new Point(3, 0);
            lblCaptionRecipeStatus.Name = "lblCaptionRecipeStatus";
            lblCaptionRecipeStatus.Size = new Size(367, 28);
            lblCaptionRecipeStatus.TabIndex = 0;
            lblCaptionRecipeStatus.Text = "Recipe Status:";
            lblCaptionRecipeStatus.TextAlign = ContentAlignment.MiddleRight;
            // 
            // lblCaptionCuisineType
            // 
            lblCaptionCuisineType.AutoSize = true;
            lblCaptionCuisineType.Dock = DockStyle.Fill;
            lblCaptionCuisineType.Location = new Point(3, 28);
            lblCaptionCuisineType.Name = "lblCaptionCuisineType";
            lblCaptionCuisineType.Size = new Size(367, 28);
            lblCaptionCuisineType.TabIndex = 1;
            lblCaptionCuisineType.Text = "Cuisine Type:";
            lblCaptionCuisineType.TextAlign = ContentAlignment.MiddleRight;
            // 
            // lblCaptionCalories
            // 
            lblCaptionCalories.AutoSize = true;
            lblCaptionCalories.Dock = DockStyle.Fill;
            lblCaptionCalories.Location = new Point(3, 56);
            lblCaptionCalories.Name = "lblCaptionCalories";
            lblCaptionCalories.Size = new Size(367, 28);
            lblCaptionCalories.TabIndex = 2;
            lblCaptionCalories.Text = "Calories:";
            lblCaptionCalories.TextAlign = ContentAlignment.MiddleRight;
            // 
            // lblCaptionDateDrafted
            // 
            lblCaptionDateDrafted.AutoSize = true;
            lblCaptionDateDrafted.Dock = DockStyle.Fill;
            lblCaptionDateDrafted.Location = new Point(3, 84);
            lblCaptionDateDrafted.Name = "lblCaptionDateDrafted";
            lblCaptionDateDrafted.Size = new Size(367, 28);
            lblCaptionDateDrafted.TabIndex = 3;
            lblCaptionDateDrafted.Text = "Date Drafted:";
            lblCaptionDateDrafted.TextAlign = ContentAlignment.MiddleRight;
            // 
            // lblCaptionDatePublished
            // 
            lblCaptionDatePublished.AutoSize = true;
            lblCaptionDatePublished.Dock = DockStyle.Fill;
            lblCaptionDatePublished.Location = new Point(3, 112);
            lblCaptionDatePublished.Name = "lblCaptionDatePublished";
            lblCaptionDatePublished.Size = new Size(367, 28);
            lblCaptionDatePublished.TabIndex = 4;
            lblCaptionDatePublished.Text = "Date Published:";
            lblCaptionDatePublished.TextAlign = ContentAlignment.MiddleRight;
            // 
            // lblCaptionDateArchived
            // 
            lblCaptionDateArchived.AutoSize = true;
            lblCaptionDateArchived.Dock = DockStyle.Fill;
            lblCaptionDateArchived.Location = new Point(3, 140);
            lblCaptionDateArchived.Name = "lblCaptionDateArchived";
            lblCaptionDateArchived.Size = new Size(367, 33);
            lblCaptionDateArchived.TabIndex = 5;
            lblCaptionDateArchived.Text = "Date Archived:";
            lblCaptionDateArchived.TextAlign = ContentAlignment.MiddleRight;
            // 
            // lblRecipeStatus
            // 
            lblRecipeStatus.AutoSize = true;
            lblRecipeStatus.Dock = DockStyle.Fill;
            lblRecipeStatus.Location = new Point(376, 0);
            lblRecipeStatus.Name = "lblRecipeStatus";
            lblRecipeStatus.Size = new Size(866, 28);
            lblRecipeStatus.TabIndex = 6;
            lblRecipeStatus.Text = " ";
            lblRecipeStatus.TextAlign = ContentAlignment.MiddleLeft;
            // 
            // lblCuisineType
            // 
            lblCuisineType.AutoSize = true;
            lblCuisineType.Dock = DockStyle.Fill;
            lblCuisineType.Location = new Point(376, 28);
            lblCuisineType.Name = "lblCuisineType";
            lblCuisineType.Size = new Size(866, 28);
            lblCuisineType.TabIndex = 7;
            lblCuisineType.Text = " ";
            lblCuisineType.TextAlign = ContentAlignment.MiddleLeft;
            // 
            // lblCalories
            // 
            lblCalories.AutoSize = true;
            lblCalories.Dock = DockStyle.Fill;
            lblCalories.Location = new Point(376, 56);
            lblCalories.Name = "lblCalories";
            lblCalories.Size = new Size(866, 28);
            lblCalories.TabIndex = 8;
            lblCalories.Text = " ";
            lblCalories.TextAlign = ContentAlignment.MiddleLeft;
            // 
            // lblDateDrafted
            // 
            lblDateDrafted.AutoSize = true;
            lblDateDrafted.Dock = DockStyle.Fill;
            lblDateDrafted.Location = new Point(376, 84);
            lblDateDrafted.Name = "lblDateDrafted";
            lblDateDrafted.Size = new Size(866, 28);
            lblDateDrafted.TabIndex = 9;
            lblDateDrafted.Text = " ";
            lblDateDrafted.TextAlign = ContentAlignment.MiddleLeft;
            // 
            // lblDatePublished
            // 
            lblDatePublished.AutoSize = true;
            lblDatePublished.Dock = DockStyle.Fill;
            lblDatePublished.Location = new Point(376, 112);
            lblDatePublished.Name = "lblDatePublished";
            lblDatePublished.Size = new Size(866, 28);
            lblDatePublished.TabIndex = 10;
            lblDatePublished.Text = " ";
            lblDatePublished.TextAlign = ContentAlignment.MiddleLeft;
            // 
            // lblDateArchived
            // 
            lblDateArchived.AutoSize = true;
            lblDateArchived.Dock = DockStyle.Fill;
            lblDateArchived.Location = new Point(376, 140);
            lblDateArchived.Name = "lblDateArchived";
            lblDateArchived.Size = new Size(866, 33);
            lblDateArchived.TabIndex = 11;
            lblDateArchived.Text = " ";
            lblDateArchived.TextAlign = ContentAlignment.MiddleLeft;
            // 
            // tblIngredients
            // 
            tblIngredients.ColumnCount = 1;
            tblIngredients.ColumnStyles.Add(new ColumnStyle(SizeType.Percent, 100F));
            tblIngredients.Controls.Add(lblCaptionIngredients, 0, 0);
            tblIngredients.Controls.Add(gIngredients, 0, 1);
            tblIngredients.Dock = DockStyle.Fill;
            tblIngredients.Location = new Point(3, 217);
            tblIngredients.Name = "tblIngredients";
            tblIngredients.RowCount = 2;
            tblIngredients.RowStyles.Add(new RowStyle(SizeType.Percent, 12F));
            tblIngredients.RowStyles.Add(new RowStyle(SizeType.Percent, 88F));
            tblIngredients.Size = new Size(1245, 245);
            tblIngredients.TabIndex = 2;
            // 
            // lblCaptionIngredients
            // 
            lblCaptionIngredients.AutoSize = true;
            lblCaptionIngredients.Dock = DockStyle.Fill;
            lblCaptionIngredients.Location = new Point(3, 0);
            lblCaptionIngredients.Name = "lblCaptionIngredients";
            lblCaptionIngredients.Size = new Size(1239, 29);
            lblCaptionIngredients.TabIndex = 0;
            lblCaptionIngredients.Text = "Ingredients:";
            lblCaptionIngredients.TextAlign = ContentAlignment.MiddleCenter;
            // 
            // gIngredients
            // 
            gIngredients.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            gIngredients.BackgroundColor = SystemColors.Control;
            gIngredients.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            gIngredients.Dock = DockStyle.Fill;
            gIngredients.Location = new Point(3, 32);
            gIngredients.Name = "gIngredients";
            gIngredients.RowHeadersWidth = 51;
            gIngredients.Size = new Size(1239, 210);
            gIngredients.TabIndex = 1;
            // 
            // tblSteps
            // 
            tblSteps.ColumnCount = 1;
            tblSteps.ColumnStyles.Add(new ColumnStyle(SizeType.Percent, 100F));
            tblSteps.Controls.Add(lblCaptionSteps, 0, 0);
            tblSteps.Controls.Add(gSteps, 0, 1);
            tblSteps.Dock = DockStyle.Fill;
            tblSteps.Location = new Point(3, 468);
            tblSteps.Name = "tblSteps";
            tblSteps.RowCount = 2;
            tblSteps.RowStyles.Add(new RowStyle(SizeType.Percent, 12F));
            tblSteps.RowStyles.Add(new RowStyle(SizeType.Percent, 88F));
            tblSteps.Size = new Size(1245, 247);
            tblSteps.TabIndex = 3;
            // 
            // lblCaptionSteps
            // 
            lblCaptionSteps.AutoSize = true;
            lblCaptionSteps.Dock = DockStyle.Fill;
            lblCaptionSteps.Location = new Point(3, 0);
            lblCaptionSteps.Name = "lblCaptionSteps";
            lblCaptionSteps.Size = new Size(1239, 29);
            lblCaptionSteps.TabIndex = 0;
            lblCaptionSteps.Text = "Steps:";
            lblCaptionSteps.TextAlign = ContentAlignment.MiddleCenter;
            // 
            // gSteps
            // 
            gSteps.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            gSteps.BackgroundColor = SystemColors.Control;
            gSteps.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            gSteps.Dock = DockStyle.Fill;
            gSteps.Location = new Point(3, 32);
            gSteps.Name = "gSteps";
            gSteps.RowHeadersWidth = 51;
            gSteps.Size = new Size(1239, 212);
            gSteps.TabIndex = 1;
            // 
            // frmRecipe
            // 
            AutoScaleDimensions = new SizeF(11F, 28F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(1251, 718);
            Controls.Add(tblMain);
            Font = new Font("Segoe UI", 12F, FontStyle.Regular, GraphicsUnit.Point, 0);
            Margin = new Padding(4);
            Name = "frmRecipe";
            Text = "frmRecipe";
            tblMain.ResumeLayout(false);
            tblTitle.ResumeLayout(false);
            tblTitle.PerformLayout();
            tblRecipeInfo.ResumeLayout(false);
            tblRecipeInfo.PerformLayout();
            tblIngredients.ResumeLayout(false);
            tblIngredients.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)gIngredients).EndInit();
            tblSteps.ResumeLayout(false);
            tblSteps.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)gSteps).EndInit();
            ResumeLayout(false);
        }

        #endregion

        private TableLayoutPanel tblMain;
        private TableLayoutPanel tblTitle;
        private Label label1;
        private Label lblRecipeName;
        private Label lblAuthor;
        private TableLayoutPanel tblRecipeInfo;
        private Label lblCaptionRecipeStatus;
        private Label lblCaptionCuisineType;
        private Label lblCaptionCalories;
        private Label lblCaptionDateDrafted;
        private Label lblCaptionDatePublished;
        private Label lblCaptionDateArchived;
        private TableLayoutPanel tblIngredients;
        private TableLayoutPanel tblSteps;
        private Label lblCaptionIngredients;
        private DataGridView gIngredients;
        private Label lblCaptionSteps;
        private DataGridView gSteps;
        private Label lblRecipeStatus;
        private Label lblCuisineType;
        private Label lblCalories;
        private Label lblDateDrafted;
        private Label lblDatePublished;
        private Label lblDateArchived;
    }
}