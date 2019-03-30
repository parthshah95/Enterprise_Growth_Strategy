<%@ Page Title="" Language="C#" MasterPageFile="~/sonyMST.Master" AutoEventWireup="true" CodeBehind="customerNew.aspx.cs" Inherits="SonyWeb_3.customerNew" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headerContent" runat="server">
    New Customer
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" runat="server">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-body">
                <p class="text-danger">
                    <asp:Literal ID="liVal" runat="server"></asp:Literal>
                </p>
                <div class="form-group">
                    <label>First Name</label>
                    <asp:TextBox ID="txtFName" CssClass="form-control" runat="server" required></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Middel Name</label>
                    <asp:TextBox ID="txtMName" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Last Name</label>
                    <asp:TextBox ID="txtLName" CssClass="form-control" runat="server" required></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Cell</label>
                    <asp:TextBox ID="txtCell" CssClass="form-control" runat="server" required></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Home</label>
                    <asp:TextBox ID="txtHome" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Company</label>
                    <asp:TextBox ID="txtCompany" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Customer Type</label>
                    <asp:DropDownList ID="ddlType" CssClass="form-control" AppendDataBoundItems="True" runat="server" DataSourceID="sdsCust" DataTextField="customerType" DataValueField="customerTypeID">
                        <asp:ListItem Text="None" Value="0"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="sdsCust" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [customerTypeID], [customerType] FROM [customerTypeMST] WHERE ([isActive] = @isActive)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="true" Name="isActive" Type="Boolean" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                </div>
                <div class="form-group">
                    <label>Customer Status</label>
                    <asp:DropDownList ID="ddlStatus" CssClass="form-control" AppendDataBoundItems="True" runat="server" DataSourceID="sdsStatus" DataTextField="customerStatus" DataValueField="customerStatusID">
                        <asp:ListItem Text="None" Value="0"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="sdsStatus" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [customerStatusID], [customerStatus] FROM [customerStatusMST] WHERE ([isActive] = @isActive)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="true" Name="isActive" Type="Boolean" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                </div>


                <asp:Button ID="btnSave" CssClass="btn btn-primary" OnClick="btnSave_Click" runat="server" Text="Save" />
            </div>
        </div>
    </div>
</asp:Content>
