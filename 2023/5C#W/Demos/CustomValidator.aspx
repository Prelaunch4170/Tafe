<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CustomValidator.aspx.cs" Inherits="CustomValidator" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
 <script type="text/javascript">
    
    function valComments_ClientValidate(source, args)
    {
        if (args.Value.length > 10)
            args.IsValid = false;
        else
            args.IsValid = true;
    }
    
    </script>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:Label
        id="lblComments"
        Text="Comments:"
        AssociatedControlID="txtComments"
        Runat="server" />
    <br />    
    <asp:TextBox
        id="txtComments"
        TextMode="MultiLine"
        Columns="30"
        Rows="5"
        Runat="server" />    
    <asp:CustomValidator
        id="valComments"
        ControlToValidate="txtComments"
        Text="(Comments must be less than 10 characters)"
        OnServerValidate="valComments_ServerValidate"
        Runat="server" />
        
    <br /><br />
    
    <asp:Button
        id="btnSubmit"
        Text="Submit"
        Runat="server" />
    </div>
    </form>
</body>
</html>
