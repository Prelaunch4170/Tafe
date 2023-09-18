using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

namespace blogging
{
    [ServiceBehavior (InstanceContextMode =InstanceContextMode.Single)]
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "BloggingService" in both code and config file together.
    public class BloggingService : IBloggingService
    {
        public List<Blog> Blogs = new List<Blog>();

        public void AdddNewBlog(Blog thisblog)
        {
            Blogs.Add(thisblog);
        }

        public void AddPostToBlog(string blogName, Post postings)
        {
            var posts = GetAllPostsForBlog(blogName);
            posts.Add(postings);
        }

        public List<Blog> GetAllBlogs()
        {
            return Blogs;
        }

        public List<Post> GetAllPostsForBlog(string blogName)
        {
            var blogs = Blogs.FirstOrDefault(b => b.Name == blogName);
            if (blogs == null)
            {
                blogs.Posts = new List<Post>();
            }
            return blogs.Posts;
        }


    }
}
