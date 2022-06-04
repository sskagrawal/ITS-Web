using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


public partial class CustomPageChangeArgs:EventArgs
{
    public int CurrentPageNumber { get; set; }
    public int TotalPages { get; set; }
    public int CurrentPageSize { get; set; }
}