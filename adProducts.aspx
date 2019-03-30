<%@ Page Title="" Language="C#" MasterPageFile="~/sonyMST.Master" AutoEventWireup="true" CodeBehind="adProducts.aspx.cs" Inherits="SonyWeb_3.adProducts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headerContent" runat="server">
    Product List
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" runat="server">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-body">
                <p class="text-danger">
                    <asp:Literal ID="liVal" runat="server"></asp:Literal>
                    <asp:LinkButton ID="ltbnNew" PostBackUrl="~/adAddProduct.aspx" runat="server">New Product</asp:LinkButton>
                </p>
                <div class="form-group">

                    <div class="panel-body">
                        <div class="table-responsive">
                            <asp:GridView ID="gvUsers" CssClass="table table-striped table-bordered table-hover" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="productID" DataSourceID="sdsUsers">
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:Image ID="imgUser" Height="100px" Width="100px" ImageUrl='<%# Eval("productPic") %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="productID" HeaderText="ID" SortExpression="productID" InsertVisible="False" ReadOnly="True" />
                                    <asp:BoundField DataField="productCode" HeaderText="Code" SortExpression="productCode" />
                                    <asp:BoundField DataField="productName" HeaderText="Name" SortExpression="productName" />
                                    <asp:TemplateField HeaderText="Description" SortExpression="productDesciption">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("productDesciption") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("productDesciption") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="catName" HeaderText="Category" SortExpression="catName" />
                                    <asp:CheckBoxField DataField="isActive" HeaderText="isActive" SortExpression="isActive" />
                                    <asp:BoundField DataField="CreatedDate" DataFormatString="{0:d}" HeaderText="Created On" SortExpression="CreatedDate" />
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="sdsUsers" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT productMST.productID, productMST.productCode, productMST.productName, productMST.productDesciption, categoryMST.catName, productMST.isActive, productMST.CreatedDate,productMST.productPic FROM productMST LEFT OUTER JOIN categoryMST ON productMST.categoryID = categoryMST.categoryID"></asp:SqlDataSource>
                        </div>
                    </div>


                </div>
            </div>
        </div>
    </div>
</asp:Content>
