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
    
    public partial class categoryMST
    {
        public categoryMST()
        {
            this.categoryMST1 = new HashSet<categoryMST>();
            this.productMSTs = new HashSet<productMST>();
        }
    
        public decimal categoryID { get; set; }
        public string catCode { get; set; }
        public string catName { get; set; }
        public string catDescription { get; set; }
        public Nullable<bool> isActive { get; set; }
        public Nullable<bool> isDeleted { get; set; }
        public Nullable<System.DateTime> CreatedDate { get; set; }
        public Nullable<decimal> CreatedBy { get; set; }
        public Nullable<System.DateTime> LastmodifiedDate { get; set; }
        public Nullable<decimal> LastmodifiedBy { get; set; }
        public Nullable<decimal> parentcategoryID { get; set; }
    
        public virtual ICollection<categoryMST> categoryMST1 { get; set; }
        public virtual categoryMST categoryMST2 { get; set; }
        public virtual ICollection<productMST> productMSTs { get; set; }
    }
}
