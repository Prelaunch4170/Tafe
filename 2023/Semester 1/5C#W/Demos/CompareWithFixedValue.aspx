<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CompareWithFixedValue.aspx.cs" Inherits="CompareWithFixedValue" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    <asp:Label
        id="lblDate"
        Text="Date:"
        AssociatedControlID="txtDate"
        Runat="server" />
    <asp:TextBox
        id="txtDate"
        Runat="server" />
    <asp:CompareValidator
        id="cmpDate"
        Text="(Date must be greater than now)"
        ControlToValidate="txtDate"
        Type="Date"
        Operator="GreaterThan"
        Runat="server" />    
    
    <br /><br />
    
    <asp:Button
        id="btnSubmit"
        Text="Submit"
        Runat="server" />
        <br />
        <br />
        Enter a Date Greater than Today's date (MM/DD/YYYY)</div>
    </form>
</body>
</html>
