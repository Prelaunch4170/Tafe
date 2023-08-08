using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class ColorChangeOnError : System.Web.UI.Page
{
    protected void Page_PreRender()
    {
        foreach (BaseValidator valControl in Page.Validators)
        {
            WebControl assControl = (WebControl)Page.FindControl(valControl.ControlToValidate);
            if (!valControl.IsValid)
                assControl.BackColor = System.Drawing.Color.Yellow;
            else
                assControl.BackColor = System.Drawing.Color.White;
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {

    }
}
