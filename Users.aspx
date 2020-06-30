<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="DT3_Lab.Users" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <div id="userGrid">
        <table>
            <tr>
                <td>
                    <asp:GridView ID="GridViewUsers" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" DataSourceID="sqldsUsers" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:TemplateField ShowHeader="False">
                                <EditItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                                    &nbsp;<asp:LinkButton ID="LinkButton4" runat="server" CausesValidation="False" CommandName="Select" Text="Select"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                            <asp:BoundField DataField="username" HeaderText="username" SortExpression="username" />
                            <asp:BoundField DataField="password" HeaderText="password" SortExpression="password" />
                            <asp:BoundField DataField="full_name" HeaderText="full_name" SortExpression="full_name" />
                            <asp:TemplateField HeaderText="access_level_id" SortExpression="access_level_id">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="sqldsAccessLevels" DataTextField="access_level" DataValueField="Id" Height="22px" SelectedValue='<%# Bind("access_level_id") %>' Width="154px">
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="sqldsAccessLevels" DataTextField="access_level" DataValueField="Id" Enabled="False" SelectedValue='<%# Bind("access_level_id") %>'>
                                    </asp:DropDownList>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="sqldsUsers" runat="server" ConnectionString="<%$ ConnectionStrings:DT3_LabConnectionString %>" DeleteCommand="DELETE FROM [users] WHERE [Id] = @original_Id" InsertCommand="INSERT INTO [users] ([username], [password], [full_name], [access_level_id]) VALUES (@username, @password, @full_name, @access_level_id)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [Id], [username], [password], [full_name], [access_level_id] FROM [users] ORDER BY [username]" UpdateCommand="UPDATE [users] SET [username] = @username, [password] = @password, [full_name] = @full_name, [access_level_id] = @access_level_id WHERE [Id] = @original_Id">
                        <DeleteParameters>
                            <asp:Parameter Name="original_Id" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="username" Type="String" />
                            <asp:Parameter Name="password" Type="String" />
                            <asp:Parameter Name="full_name" Type="String" />
                            <asp:Parameter Name="access_level_id" Type="Int32" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="username" Type="String" />
                            <asp:Parameter Name="password" Type="String" />
                            <asp:Parameter Name="full_name" Type="String" />
                            <asp:Parameter Name="access_level_id" Type="Int32" />
                            <asp:Parameter Name="original_Id" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="sqldsAccessLevels" runat="server" ConnectionString="<%$ ConnectionStrings:DT3_LabConnectionString %>" SelectCommand="SELECT [access_level], [Id] FROM [access_levels]"></asp:SqlDataSource>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>

