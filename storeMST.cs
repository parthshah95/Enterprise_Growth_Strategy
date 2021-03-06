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
    
    public partial class storeMST
    {
        public storeMST()
        {
            this.inquiryMSTs = new HashSet<inquiryMST>();
            this.userDetails = new HashSet<userDetail>();
            this.walkinDetails = new HashSet<walkinDetail>();
        }
    
        public decimal storeID { get; set; }
        public Nullable<decimal> accountID { get; set; }
        public string storeName { get; set; }
        public string storeDetail { get; set; }
        public string storeHolder { get; set; }
        public string ContactDetail { get; set; }
        public string AddressLine1 { get; set; }
        public string AddressLine2 { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string Zip { get; set; }
        public string Country { get; set; }
        public Nullable<bool> isActive { get; set; }
        public Nullable<bool> isDeleted { get; set; }
        public Nullable<System.DateTime> CreatedDate { get; set; }
        public Nullable<decimal> CreatedBy { get; set; }
        public Nullable<System.DateTime> LastmodifiedDate { get; set; }
        public Nullable<decimal> LastmodifiedBy { get; set; }
    
        public virtual accountMST accountMST { get; set; }
        public virtual ICollection<inquiryMST> inquiryMSTs { get; set; }
        public virtual ICollection<userDetail> userDetails { get; set; }
        public virtual ICollection<walkinDetail> walkinDetails { get; set; }
    }
}
