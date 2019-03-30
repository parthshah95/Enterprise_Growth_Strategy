<%@ Page Title="" Language="C#" MasterPageFile="~/sonyMST.Master" AutoEventWireup="true" CodeBehind="adAddStore.aspx.cs" Inherits="SonyWeb_3.adAddStore" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headerContent" runat="server">
    Store Detail
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" runat="server">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-body">
                <p class="text-danger">
                    <asp:Literal ID="liVal" runat="server"></asp:Literal>
                </p>
                <div class="form-group">
                    <label>Store</label>
                    <asp:TextBox ID="txtName" CssClass="form-control" runat="server" required></asp:TextBox>
                    <p class="help-block">Enter Store Name Here</p>
                </div>
                <div class="form-group">
                    <label>Account</label>
                    <asp:DropDownList ID="ddlAccount" CssClass="form-control" AppendDataBoundItems="True" runat="server" DataSourceID="sdsCategory" DataTextField="accountName" DataValueField="accountID">
                        <asp:ListItem Text="None" Value="0"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="sdsCategory" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [accountID], [accountName], [isActive] FROM [accountMST] WHERE ([isActive] = @isActive)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="true" Name="isActive" Type="Boolean" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <p class="help-block">Store Account</p>
                </div>
                <div class="form-group">
                    <label>Store Manager</label>
                    <asp:TextBox ID="txtManager" CssClass="form-control" runat="server" required></asp:TextBox>

                </div>
                <div class="form-group">
                    <label>Contact #</label>
                    <asp:TextBox ID="txtContact" CssClass="form-control" runat="server" required></asp:TextBox>

                </div>
                <div class="form-group">
                    <label>Address Line 1</label>
                    <asp:TextBox ID="txtAddLine1" CssClass="form-control" runat="server" required></asp:TextBox>

                </div>
                <div class="form-group">
                    <label>Address Line 2</label>
                    <asp:TextBox ID="txtAddressLine2" CssClass="form-control" runat="server" required></asp:TextBox>

                </div>
                <div class="form-group">
                    <label>City</label>
                    <asp:TextBox ID="txtCity" CssClass="form-control" runat="server" required></asp:TextBox>

                </div>
                <div class="form-group">
                    <label>State</label>
                    <asp:TextBox ID="txtState" CssClass="form-control" runat="server" required></asp:TextBox>

                </div>
                <div class="form-group">
                    <label>Description</label>
                    <asp:TextBox ID="txtDesc" TextMode="MultiLine" Rows="5" CssClass="form-control" runat="server"></asp:TextBox>

                </div>
                <asp:Button ID="btnSave" CssClass="btn btn-primary" OnClick="btnSave_Click" runat="server" Text="Save" />
            </div>
        </div>
    </div>
</asp:Content>
