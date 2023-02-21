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

public partial class CustomValidator : System.Web.UI.Page
{

    public void valComments_ServerValidate(Object source, ServerValidateEventArgs args)
    {
        if (args.Value.Length > 10)
            args.IsValid = false;
        else
            args.IsValid = true;
    }
}
