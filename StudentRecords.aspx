<%@ Page Language="C#" AutoEventWireup="true" CodeFile="StudentRecords.aspx.cs" Inherits="StudentRecords" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="App_Themes/SiteStyles.css" />
</head>
<body>
    <h1>Course Information</h1>
    <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                    <td>
                        <label>
                            Student ID
                        </label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="studentID" />
                        <div class="validators">
                            <asp:RequiredFieldValidator ID="studentIDValidator" runat="server" ControlToValidate="studentID"
                                   CssClass="error" Text="Student ID is required." />
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>
                            Student Name
                        </label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="studentName" />
                        <div class="validators">
                            <asp:RegularExpressionValidator
                                ID="studentNameValidator"
                                ValidationExpression="[a-zA-Z]+\s+[a-zA-Z]+"
                                ControlToValidate="studentName"
                                CssClass="error"
                                Display="Dynamic"
                                ErrorMessage="Must be in first_name last_name!"
                                runat="server"/>
                            <asp:RequiredFieldValidator ID="studentNameValidator2" runat="server" ControlToValidate="studentName"
                                   CssClass="error" Text="Student name is required." />
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>
                            Grade (0-100)
                        </label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="studentGrade" />
                        <div class="validators">
                            <asp:RequiredFieldValidator ID="studentGradeValidator" runat="server" ControlToValidate="studentGrade"
                                   CssClass="error" Text="Student grade is required." />
                            <asp:RangeValidator MinimumValue="0" MaximumValue="100" Type="Double" CssClass="error" ID="rangeValidator" ControlToValidate="studentGrade"
                                runat="server" Text="Grade must be between 0 to 100." />
                        </div>
                    </td>
                </tr>
            </table>
        </div>
        <div>
            <asp:Button runat="server" Text="Add to Course Record" OnClick="btnSubmit_Click" />
        </div><br />
        <div>
            Following student records have been added:
        </div><br />
        <div>
            Order By
        </div>
        <div>
            <asp:RadioButton AutoPostBack="true" runat="server" GroupName="RadioGroup" ID="radioId" OnCheckedChanged="orderList" Checked="true" /> ID &nbsp;&nbsp;&nbsp;
            <asp:RadioButton AutoPostBack="true" runat="server" GroupName="RadioGroup" ID="radioName" OnCheckedChanged="orderList" /> Name &nbsp;&nbsp;&nbsp;
            <asp:RadioButton AutoPostBack="true" runat="server" GroupName="RadioGroup" ID="radioGrade" OnCheckedChanged="orderList" /> Grade &nbsp;&nbsp;&nbsp;
        </div>
        <div>
            <asp:Table runat="server" ID="tblStudents" CssClass="table">
                <asp:TableRow>
                    <asp:TableHeaderCell>ID</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Name</asp:TableHeaderCell>    
                    <asp:TableHeaderCell>Grade</asp:TableHeaderCell> 
                </asp:TableRow>
            </asp:Table>
        </div>
    </form>
</body>
</html>
