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
    
    public partial class messageMail
    {
        public messageMail()
        {
            this.messageMail1 = new HashSet<messageMail>();
        }
    
        public decimal messageID { get; set; }
        public Nullable<decimal> senderID { get; set; }
        public Nullable<decimal> receiverID { get; set; }
        public string messageDetail { get; set; }
        public Nullable<System.DateTime> messageDate { get; set; }
        public Nullable<bool> isRead { get; set; }
        public Nullable<bool> isDeleted { get; set; }
        public Nullable<bool> isImportant { get; set; }
        public string messageType { get; set; }
        public Nullable<decimal> parentMessageID { get; set; }
    
        public virtual ICollection<messageMail> messageMail1 { get; set; }
        public virtual messageMail messageMail2 { get; set; }
        public virtual userDetail userDetail { get; set; }
        public virtual userDetail userDetail1 { get; set; }
    }
}