//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SkyNetz.FaleMais.DataAccess
{
    using System;
    using System.Collections.Generic;
    
    public partial class Fares
    {
        public int Id { get; set; }
        public byte Origin { get; set; }
        public byte Destination { get; set; }
        public int Time { get; set; }
        public int PlanId { get; set; }
        public decimal StarterValue { get; set; }
        public decimal DiscountedValue { get; set; }
        public decimal FullValue { get; set; }
        public decimal UnitValue { get; set; }
    
        public virtual Plans Plans { get; set; }
    }
}
