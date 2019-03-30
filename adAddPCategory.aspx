<%@ Page Title="" Language="C#" MasterPageFile="~/sonyMST.Master" AutoEventWireup="true" CodeBehind="adAddPCategory.aspx.cs" Inherits="SonyWeb_3.adAddPCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headerContent" runat="server">
    Product Category
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" runat="server">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-body">
                <p class="text-danger">
                    <asp:Literal ID="liVal" runat="server"></asp:Literal> 
                </p>
                <div class="form-group">
                    <label>Category</label>
                    <asp:TextBox ID="txtCat" CssClass="form-control" runat="server" required></asp:TextBox>
                    <p class="help-block">Enter Category Name Here</p>
                </div>
                <div class="form-group">
                    <label>Parent Category</label>
                    <asp:DropDownList ID="ddlCategory" CssClass="form-control" AppendDataBoundItems="True" runat="server" DataSourceID="sdsCategory" DataTextField="catCode" DataValueField="categoryID">
                        <asp:ListItem Text="None" Value="0"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="sdsCategory" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [categoryID], [catCode]+ '-' + [catName] as catCode FROM [categoryMST] WHERE ([isActive] = @isActive)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="true" Name="isActive" Type="Boolean" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <p class="help-block">Parent Category If any</p>
                </div>
                <asp:Button ID="btnSave" CssClass="btn btn-primary" OnClick="btnSave_Click" runat="server" Text="Save" />
            </div>
        </div>
    </div>
</asp:Content>
