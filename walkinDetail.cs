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
    
    public partial class walkinDetail
    {
        public decimal walkinID { get; set; }
        public Nullable<decimal> customerID { get; set; }
        public Nullable<System.DateTime> walkinDate { get; set; }
        public Nullable<bool> isDeleted { get; set; }
        public Nullable<decimal> createdBy { get; set; }
        public Nullable<System.DateTime> createdDate { get; set; }
        public Nullable<decimal> storeID { get; set; }
    
        public virtual customerMST customerMST { get; set; }
        public virtual storeMST storeMST { get; set; }
        public virtual userDetail userDetail { get; set; }
    }
}
