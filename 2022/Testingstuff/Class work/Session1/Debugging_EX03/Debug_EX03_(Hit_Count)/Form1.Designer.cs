namespace HDI_Debugging_HitCount_cs
{
	partial class frmHitCount
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
            this.btnHitCount = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // btnHitCount
            // 
            this.btnHitCount.Location = new System.Drawing.Point(123, 95);
            this.btnHitCount.Margin = new System.Windows.Forms.Padding(4);
            this.btnHitCount.Name = "btnHitCount";
            this.btnHitCount.Size = new System.Drawing.Size(100, 28);
            this.btnHitCount.TabIndex = 0;
            this.btnHitCount.Text = "Hit Count";
            this.btnHitCount.UseVisualStyleBackColor = true;
            this.btnHitCount.Click += new System.EventHandler(this.btnHitCount_Click);
            // 
            // frmHitCount
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(379, 325);
            this.Controls.Add(this.btnHitCount);
            this.Margin = new System.Windows.Forms.Padding(4);
            this.Name = "frmHitCount";
            this.Text = "Debugging";
            this.ResumeLayout(false);

		}

		#endregion

		private System.Windows.Forms.Button btnHitCount;
	}
}