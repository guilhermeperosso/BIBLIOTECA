using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class uc_Tile : System.Web.UI.UserControl
{
    public string Color { get; set; }
    public string Icon { get; set; }
    public string Value { get; set; }
    public string Description { get; set; }
    public string Url { get; set; }

    protected void Page_Load(object sender, EventArgs e)
    {

    }
}