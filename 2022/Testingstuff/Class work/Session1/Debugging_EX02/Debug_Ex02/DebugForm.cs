/*
 * Program:			Chapter 4 Debugging
 * Description:		This program is designed to be used as a
 * 					debugging exercise.
 */

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace Ch04Debug
{
    public partial class DebugForm : Form
    {
        // Declare class-level variables.
        private decimal blueTotalDecimal, 
                        redTotalDecimal, 
                        whiteTotalDecimal; 

        public DebugForm()
        {
            InitializeComponent();
        }

        private void calculateButton_Click(object sender, EventArgs e)
        {
            decimal quantityDecimal, 
                    totalDecimal;
            try
            {
				// Convert input to numeric.
				quantityDecimal = decimal.Parse(quantityTextBox.Text);

				// Add to the correct total.
                if (blueRadioButton.Checked)
                {
                    blueTotalDecimal += quantityDecimal;
                }
                else if (redRadioButton.Checked)
                {
                    redTotalDecimal = quantityDecimal;
                }
                else if (whiteRadioButton.Checked)
                {
                    whiteTotalDecimal++;
                }

				// Format totals in text boxes.
				blueTotalTextBox.Text = blueTotalDecimal.ToString();
				redTotalTextBox.Text = redTotalDecimal.ToString();
				whiteTotalTextBox.Text = whiteTotalDecimal.ToString();

				// Calculate total of all colors.
				totalDecimal = 
                    blueTotalDecimal + redTotalDecimal + whiteTotalDecimal;

				// Calculate and format the percentages.
                if (totalDecimal > 0)
                {
                    bluePercentTextBox.Text =
                        (blueTotalDecimal / totalDecimal).ToString("P");
                    redPercentTextBox.Text =
                        (redTotalDecimal / totalDecimal).ToString("P");
                    whitePercentTextBox.Text =
                        (whiteTotalDecimal / totalDecimal).ToString("P");
                }

				// Clear the quantity and reset the focus.
				quantityTextBox.Clear();
				quantityTextBox.Focus();
            }
            catch
            {
                MessageBox.Show("Enter numeric data.",
                    "Data Error",
                    MessageBoxButtons.OK,
                    MessageBoxIcon.Information);
                quantityTextBox.Focus();
                quantityTextBox.SelectAll();
            }
        }

        private void exitButton_Click(object sender, EventArgs e)
        {
            // End the application.

            this.Close();

           
        }
    }
}