<%@ Page Title="" Language="C#" MasterPageFile="~/sonyMST.Master" AutoEventWireup="true" CodeBehind="adAddProduct.aspx.cs" Inherits="SonyWeb_3.adAddProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headerContent" runat="server">
    Product
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" runat="server">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-body">
                <p class="text-danger">
                    <asp:Literal ID="liVal" runat="server"></asp:Literal>
                </p>
                <div class="form-group">
                    <label>Product Code</label>
                    <asp:TextBox ID="txtCode" CssClass="form-control" runat="server" required></asp:TextBox>
                    <p class="help-block">Product Code to identify Product</p>
                </div>
                 <div class="form-group">
                    <label>Product Name</label>
                    <asp:TextBox ID="txtName" CssClass="form-control" runat="server" required></asp:TextBox>
                    
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
                    <p class="help-block">Select Product Category</p>
                </div>
                 <div class="form-group">
                    <label>Product Price</label>
                    <asp:TextBox ID="txtPrice" CssClass="form-control" runat="server" required></asp:TextBox>                    
                </div>
                 <div class="form-group">
                    <label>Product Pic</label>
                    <asp:FileUpload ID="flPhoto" runat="server" />                
                </div>
                <div class="form-group">
                    <label>Product Description</label>
                    <asp:TextBox ID="txtDesc" TextMode="MultiLine" Rows="5" CssClass="form-control" runat="server" ></asp:TextBox>
                    
                </div>
                <asp:Button ID="btnSave" CssClass="btn btn-primary" OnClick="btnSave_Click" runat="server" Text="Save" />
            </div>
        </div>
    </div>
</asp:Content>
