<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Course Information</title>
    <link rel="stylesheet" href="App_Themes/SiteStyles.css" />
</head>
<body>
    <h1>Course Information</h1>
    <form id="form1" runat="server">
        <table>
            <tr>
                <td>
                    <asp:Label runat="server" ID="LabelCourseNumber">
                        Course Number
                    </asp:Label>
                </td>
                <td>
                    <asp:TextBox runat="server" ID="CourseNumber" />
                    <asp:RequiredFieldValidator ID="courseNumberValidator" runat="server" ControlToValidate="CourseNumber"
                           CssClass="failureNotification" ErrorMessage="Course number is required." ToolTip="Course number is required."
                           ValidationGroup="ValidationGroup">Course number is required.</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label runat="server" ID="LabelCourseName">Course Name</asp:Label>
                </td>
                <td>
                    <asp:TextBox runat="server" ID="CourseName" />
                    <asp:RequiredFieldValidator ID="courseNameValidator" runat="server" ControlToValidate="CourseName"
                           CssClass="failureNotification" ErrorMessage="Course name is required." ToolTip="Course name is required."
                           ValidationGroup="ValidationGroup">Course name is required.</asp:RequiredFieldValidator>
                </td>
            </tr>
        </table>
        <div>
            <asp:Button runat="server" ID="btnSubmit" Text="Submit Course Information" OnClick="btnSubmit_Click"/>
        </div>
    </form>
</body>
</html>
