using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Runtime.Serialization;

namespace blogging
{
    [DataContract]
    public class Blog
    {
        [DataMember]
        public string CreatedBy;
        [DataMember] 
        public string DateCreated;
        [DataMember] 
        public string Name;
        [DataMember]
        public List<Post> Posts;

    }
}
