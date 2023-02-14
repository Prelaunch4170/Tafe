using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace S5Ex02_Rental_UsingMethod
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        const decimal SMALL_CAR_AGENCY_CHARGE = 15.00m;
        const decimal MEDIUM_CAR_AGENCY_CHARGE = 20.00m;
        decimal balance = 0.0m;

        public MainWindow()
        {
            InitializeComponent();
        }

        private void exitButton_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void clearButton_Click(object sender, RoutedEventArgs e)
        {
            clearTextBoxes();
        }

        private void clearTextBoxes()
        {
            customerNameTextBox.Clear();
            addressTextBox.Clear();
            cityTextBox.Clear();
            stateTextBox.Clear();
            postCodeTextBox.Clear();
            typeOfCarTextBox.Clear();
            beginningOdometerTextBox.Clear();
            endingOdometerTextBox.Clear();
            noOfDaysTextBox.Clear();
            kilometerDrivenTextBox.Clear();
            totalChargeTextBox.Clear();
        }

        private void calculateButton_Click(object sender, RoutedEventArgs e)
        {
            // calculate rental charge
            // (** Note: need nesting try catch statements for multiple data input validation)
            // step1: validate tyoe of car
            // step2: validate beginning odometer & ending odometer
            // step3: validate no. of days rented
            // step4: calculate kilometer driven
            // step5: calculate charge
            // step6: display output
            calculateRentalCharge(); 

        }

        // define the calculateRentalCharge method
        // note: this is a method with no return value
        private void calculateRentalCharge()
        {   
            // Validate type of car (either Small or Mediium)
            if ((typeOfCarTextBox.Text == "Small") || (typeOfCarTextBox.Text == "Medium"))
            {
                // Validate the odometer reading
                validateOdometer();
            } 
            else
            {
                MessageBox.Show("Please enter Car type must be Small or Medium", "", MessageBoxButton.OK);
                Keyboard.Focus(typeOfCarTextBox);
                typeOfCarTextBox.Select(0, typeOfCarTextBox.Text.Length);
            }
        }


        // define the validateOdometer method
        // note: this is a method with no return value
        private void validateOdometer()
        {
            // validate the beginning odometer
            if (beginningOdometerTextBox.Text == "")
            {
                MessageBox.Show("Please enter the beginning km");
                Keyboard.Focus(beginningOdometerTextBox);
            }
            else
            {
                try
                {
                    int beginningKm = int.Parse(beginningOdometerTextBox.Text);                  
                }
                catch (FormatException theException)
                {
                    MessageBox.Show("Please enter a valid kilometer i.e. integer" + theException.Message);
                    Keyboard.Focus(beginningOdometerTextBox);
                    beginningOdometerTextBox.SelectAll();
                    return;
                }
            }

            // validate the ending odometer
            if (endingOdometerTextBox.Text == "")
            {
                MessageBox.Show("Please enter the ending km");
                Keyboard.Focus(endingOdometerTextBox);
            }
            else
            {
                try
                {   // validate ending odometer reading
                    int endingKm = int.Parse(endingOdometerTextBox.Text);

                }
                catch (FormatException theException)
                {
                    MessageBox.Show("Please enter a valid kilometer i.e. integer" + theException.Message);
                    Keyboard.Focus(endingOdometerTextBox);
                    endingOdometerTextBox.SelectAll();
                    return;
                }
                // validate no of days input
                validateNoOfDays(noOfDaysTextBox.Text);
            }

    }

        // define the validateNoOfDays method
        // note: this is a method with no return value
        private void validateNoOfDays(string daysEntered)
        {
            try
            {   // validate no. of days input
                int days = int.Parse(daysEntered);
                // calculate rental charge
                decimal totalCharge = calculateCharge(typeOfCarTextBox.Text, noOfDaysTextBox.Text, beginningOdometerTextBox.Text, endingOdometerTextBox.Text);

                // Display results
                kilometerDrivenTextBox.Text = (decimal.Parse(endingOdometerTextBox.Text) - decimal.Parse(beginningOdometerTextBox.Text)).ToString();
                totalChargeTextBox.Text = totalCharge.ToString("N");

                decimal newBalance = calculateNewBalance(balance, totalCharge);
                balance = newBalance;
            }
            catch(FormatException theException)
            {
                MessageBox.Show("Format Error: Please enter a valid days i.e. integer. " + theException.Message);
                Keyboard.Focus(noOfDaysTextBox);
                noOfDaysTextBox.SelectAll();
                return;
            }
            catch(Exception theException)
            {
                MessageBox.Show("General error: Please enter a valid days i.e. integer. " + theException.Message);
                Keyboard.Focus(noOfDaysTextBox);
                noOfDaysTextBox.SelectAll();
                return;
            }
        }

        // define the calculateCharge method
        // note: this is a method with return value
        private decimal calculateCharge(string type, string days, string starting, string ending)
        {
            decimal totalCharge = 0.0m;
            if (type == "Small")
            {
                totalCharge = SMALL_CAR_AGENCY_CHARGE * int.Parse(days) + (decimal.Parse(ending) - decimal.Parse(starting)) * 0.12m;
            }
            else if (type == "Medium")
            {
                totalCharge = MEDIUM_CAR_AGENCY_CHARGE * int.Parse(days) + (decimal.Parse(ending) - decimal.Parse(starting)) * 0.15m;
            }
            return totalCharge; // it returns a value
        }

        // define the calculateNewBalance method i.e. with a return value
        private decimal calculateNewBalance(decimal rentalBalance, decimal charge)
        {   
            // function to calaculate the grand total 
            decimal thisBalance = 0.0m;
            thisBalance = rentalBalance + charge;
            return thisBalance;    // it returns a value
        }

        private void balanceButton_Click(object sender, RoutedEventArgs e)
        {
            MessageBox.Show("The rental balance is: \n" + balance.ToString("C"));
        }

    }
}
