using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BlogConsoleClient.ServiceReference1;
using blogging;

namespace BlogConsoleClient
{
    internal class Program
    {
        static void Main(string[] args)
        {
            BloggingServiceClient client = new BloggingServiceClient();

            Blog blog2 = new Blog();
            blog2.Name = "test";
            blog2.CreatedBy = "Andre";
            blog2.DateCreated =  DateTime.Today.ToString();
            client.AdddNewBlog(blog2);

            Blog blog1 = new Blog();
            blog1.Name = "Samsons";
            blog1.CreatedBy = "samson";
            blog1.DateCreated = DateTime.Today.ToString();
            client.AdddNewBlog(blog1);

            foreach(var blog in client.GetAllBlogs())
            {
                Console.WriteLine(blog.Name + " "+ blog.CreatedBy + " " + blog.DateCreated);
            }
            Console.ReadLine();
        }
    }
}
