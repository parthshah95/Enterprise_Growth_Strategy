//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SonyWeb_3
{
    using System;
    using System.Collections.Generic;
    
    public partial class userGroupMST
    {
        public userGroupMST()
        {
            this.userDetails = new HashSet<userDetail>();
        }
    
        public decimal userGroupID { get; set; }
        public string groupName { get; set; }
        public string groupDetail { get; set; }
    
        public virtual ICollection<userDetail> userDetails { get; set; }
    }
}
