using System;
using NUnit.Framework;

namespace SalesTest
{
    [TestFixture]
    public class SalesTest
    {
        Sales.Invoice invoiceMain;
        Sales.Customer customerMain;
        Sales.Seat seatMain;
        Sales.Activity activityMain;
        Sales.Flight flightMain;

        [OneTimeSetUp]
        public void FixtureSetup()
        {
            customerMain = new Sales.Customer(1, "john", "Smith", "4560361423329093", "Visa", "03/2026");
            invoiceMain = new Sales.Invoice(0, customerMain, 1, 4, 1);
            seatMain = new Sales.Seat(100, 0);
            flightMain = new Sales.Flight(5, 15, 4, 8);
            activityMain = new Sales.Activity(flightMain);
        }
        [Test]//1
        public void testSetseats()
        {
            invoiceMain.setNumberOfSeats(2);
            Assert.AreEqual(2, invoiceMain.getNumberOfSeats());
        }
        [Test]//2
        public void testGetDicscount()
        {
            Assert.AreEqual(0.9, invoiceMain.getDiscount(1));
        }
       

        [Test]//3
        public void testbookSeats()
        {
            seatMain.bookSeats(5);

            Assert.AreEqual(6, seatMain.getCurrentSeat());
            Assert.AreEqual(1, seatMain.getLastBooked());
        }


        [Test]//4
        public void testCustomerNull()
        {
            Sales.Customer customerNull = new Sales.Customer(1, null, "Smith", "4560361423329093", "Visa", "03/2026");

            Assert.IsNull(customerNull.getFirstName());
        }
        [Test]//5
        public void testCustomerTheSame()
        {
            Assert.AreSame(invoiceMain.getTheCust(), customerMain);
        }
        [Test]//6
        public void testEconomyExeption()
        {

            Sales.Flight flightTest;
            Assert.Throws<ArgumentException>(() => flightTest = new Sales.Flight(10, 0, 15, 10));
        }
        [Test]//7
        public void testFirstClassExeption()
        {

            Sales.Flight flightTest;
            Assert.Throws<ArgumentException>(() => flightTest = new Sales.Flight(10, 10, 15, 0));
        }
        [Test]//8
        public void testFirstClassCharge()
        {

            Assert.AreEqual(2000, invoiceMain.getCharge(1));
        }
        [Test]//9
        public void EconomyRows()
        {
            Sales.Flight flightTest;
            Assert.Throws<ArgumentException>(() => flightTest = new Sales.Flight(0, 10, 10, 10));
        }
        [Test]//10
        public void FirstClassRows()
        {
            Sales.Flight flightTest;
            Assert.Throws<ArgumentException>(() => flightTest = new Sales.Flight(10, 10, 0, 10));
        }
    }
}
