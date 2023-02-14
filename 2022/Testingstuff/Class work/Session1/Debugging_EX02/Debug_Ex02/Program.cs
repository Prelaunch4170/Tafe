using System;
using System.Collections.Generic;
using System.Windows.Forms;

namespace Ch04Debug
{
    static class Program
    {
        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        static void Main()
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            Application.Run(new DebugForm());
        }
    }
}