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

public partial class InitialValue : System.Web.UI.Page
{
     
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        
        if (Page.IsValid)
            lblResult.Text = dropFavoriteColor.SelectedValue;
    }
}
