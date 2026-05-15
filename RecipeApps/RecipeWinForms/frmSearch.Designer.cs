namespace RecipeWinForms
{
    partial class frmSearch
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
            tblSearch = new TableLayoutPanel();
            lblRecipe = new Label();
            txtRecipe = new TextBox();
            btnSearch = new Button();
            gRecipe = new DataGridView();
            tblMain.SuspendLayout();
            tblSearch.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)gRecipe).BeginInit();
            SuspendLayout();
            // 
            // tblMain
            // 
            tblMain.ColumnCount = 1;
            tblMain.ColumnStyles.Add(new ColumnStyle(SizeType.Percent, 50F));
            tblMain.Controls.Add(tblSearch, 0, 0);
            tblMain.Controls.Add(gRecipe, 0, 1);
            tblMain.Dock = DockStyle.Fill;
            tblMain.Location = new Point(0, 0);
            tblMain.Margin = new Padding(4);
            tblMain.Name = "tblMain";
            tblMain.RowCount = 2;
            tblMain.RowStyles.Add(new RowStyle(SizeType.Percent, 8.095238F));
            tblMain.RowStyles.Add(new RowStyle(SizeType.Percent, 91.90476F));
            tblMain.Size = new Size(1100, 630);
            tblMain.TabIndex = 0;
            // 
            // tblSearch
            // 
            tblSearch.ColumnCount = 3;
            tblSearch.ColumnStyles.Add(new ColumnStyle());
            tblSearch.ColumnStyles.Add(new ColumnStyle());
            tblSearch.ColumnStyles.Add(new ColumnStyle());
            tblSearch.Controls.Add(lblRecipe, 0, 0);
            tblSearch.Controls.Add(txtRecipe, 1, 0);
            tblSearch.Controls.Add(btnSearch, 2, 0);
            tblSearch.Location = new Point(4, 4);
            tblSearch.Margin = new Padding(4);
            tblSearch.Name = "tblSearch";
            tblSearch.RowCount = 1;
            tblSearch.RowStyles.Add(new RowStyle(SizeType.Percent, 100F));
            tblSearch.Size = new Size(403, 43);
            tblSearch.TabIndex = 0;
            // 
            // lblRecipe
            // 
            lblRecipe.Anchor = AnchorStyles.Left;
            lblRecipe.AutoSize = true;
            lblRecipe.Location = new Point(4, 7);
            lblRecipe.Margin = new Padding(4, 0, 4, 0);
            lblRecipe.Name = "lblRecipe";
            lblRecipe.Size = new Size(69, 28);
            lblRecipe.TabIndex = 0;
            lblRecipe.Text = "Recipe";
            // 
            // txtRecipe
            // 
            txtRecipe.Anchor = AnchorStyles.Left;
            txtRecipe.Location = new Point(80, 4);
            txtRecipe.Name = "txtRecipe";
            txtRecipe.Size = new Size(218, 34);
            txtRecipe.TabIndex = 1;
            // 
            // btnSearch
            // 
            btnSearch.Anchor = AnchorStyles.Left;
            btnSearch.AutoSize = true;
            btnSearch.Location = new Point(304, 3);
            btnSearch.Name = "btnSearch";
            btnSearch.Size = new Size(94, 37);
            btnSearch.TabIndex = 2;
            btnSearch.Text = "Search";
            btnSearch.UseVisualStyleBackColor = true;
            // 
            // gRecipe
            // 
            gRecipe.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            gRecipe.Dock = DockStyle.Fill;
            gRecipe.Location = new Point(3, 54);
            gRecipe.Name = "gRecipe";
            gRecipe.RowHeadersWidth = 51;
            gRecipe.Size = new Size(1094, 573);
            gRecipe.TabIndex = 1;
            // 
            // frmSearch
            // 
            AutoScaleDimensions = new SizeF(11F, 28F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(1100, 630);
            Controls.Add(tblMain);
            Font = new Font("Segoe UI", 12F, FontStyle.Regular, GraphicsUnit.Point, 0);
            Margin = new Padding(4);
            Name = "frmSearch";
            Text = "Recipe Search";
            tblMain.ResumeLayout(false);
            tblSearch.ResumeLayout(false);
            tblSearch.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)gRecipe).EndInit();
            ResumeLayout(false);
        }

        #endregion

        private TableLayoutPanel tblMain;
        private TableLayoutPanel tblSearch;
        private Label lblRecipe;
        private TextBox txtRecipe;
        private Button btnSearch;
        private DataGridView gRecipe;
    }
}