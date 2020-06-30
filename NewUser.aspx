<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NewUser.aspx.cs" Inherits="DT3_Lab.NewUser" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <table>
            <tr>
                <td>Full Name</td>
                <td>
                    <asp:TextBox ID="TextBoxFullName" runat="server" stype="width:100%" CausesValidation="True"></asp:TextBox>
                </td>
                <td>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxFullName" ErrorMessage="Full name is required" ForeColor="Red" ValidationGroup="newUser">*</asp:RequiredFieldValidator>

                </td>
            </tr>
            <tr>
                <td>User Name</td>
                <td>
                    <asp:TextBox ID="TextBoxUserName" runat="server" CausesValidation="True"></asp:TextBox>
                </td>
                <td>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBoxUserName" ErrorMessage="Username is required" ForeColor="Red" ValidationGroup="newUser">*</asp:RequiredFieldValidator>

                </td>
            </tr>
            <tr>
                <td>Access Level</td>
                <td>
                    <asp:DropDownList ID="DropDownListUserRoles" runat="server" Height="18px" CausesValidation="True"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>Password</td>
                <td>
                    <asp:TextBox ID="TextBoxPassword" runat="server" TextMode="Password" CausesValidation="True"></asp:TextBox>
                </td>
                <td>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBoxPassword" ErrorMessage=" Password is required" ForeColor="Red" ValidationGroup="newUser">*</asp:RequiredFieldValidator>

                </td>
            </tr>
            <tr>
                <td>Verify Password</td>
                <td>
                    <asp:TextBox ID="TextBoxVerifyPassword" runat="server" TextMode="Password" CausesValidation="True"></asp:TextBox>
                </td>
                <td>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBoxVerifyPassword" ErrorMessage="Verify password is required" ForeColor="Red" ValidationGroup="newUser">*</asp:RequiredFieldValidator>

                </td>
            </tr>
            <tr>
                <td colspan="3" class="auto-style1">
                    <asp:Button ID="ButtonSaveUser" runat="server" Text="Save" OnClick="ButtonSaveUser_Click" />
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:Label ID="LabelResult" runat="server" Text=""></asp:Label>
                </td>
            </tr>
        </table>
    </div>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="newUser" />
</asp:Content>

