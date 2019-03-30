<%@ Page Title="" Language="C#" MasterPageFile="~/sonyMST.Master" AutoEventWireup="true" CodeBehind="product.aspx.cs" Inherits="SonyWeb_3.product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headerContent" runat="server">
    Products
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" runat="server">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-body">
                <p class="text-danger">
                    <asp:Literal ID="liVal" runat="server"></asp:Literal>
                </p>
                <div class="row">
                    <div class="col-lg-3">
                        <div class="form-group">
                            <label>Product Code</label>
                            <asp:TextBox ID="txtCode" CssClass="form-control" runat="server"></asp:TextBox>

                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="form-group">
                            <label>Product Name</label>
                            <asp:TextBox ID="txtName" CssClass="form-control" runat="server"></asp:TextBox>

                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="form-group">
                            <label>Category</label>
                            <asp:DropDownList ID="ddlCategory" CssClass="form-control" AppendDataBoundItems="True" runat="server" DataSourceID="sdsCategory" DataTextField="catCode" DataValueField="categoryID">
                                <asp:ListItem Text="None" Value="0" Selected="True"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="sdsCategory" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                                SelectCommand="SELECT [categoryID], [catCode]+ '-' + [catName] as catCode FROM [categoryMST] WHERE ([isActive] = @isActive)">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="true" Name="isActive" Type="Boolean" />
                                </SelectParameters>
                            </asp:SqlDataSource>

                        </div>
                    </div>
                    <div class="col-lg-3">
                        <asp:Button ID="btnSearch" CausesValidation="false" CssClass="btn btn-primary" runat="server" Text="Search" />

                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="col-lg-12">
        <!-- Advanced Tables -->
        <div class="panel panel-default">
            <div class="panel-heading">
                Filtered Product
            </div>
            <div class="panel-body">
                <asp:GridView ID="gvProduct" CssClass="table table-striped table-bordered table-hover" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="productID" DataSourceID="sdsProduct">
                    <Columns>
                        <asp:TemplateField HeaderText="productPic" SortExpression="productPic">
                            <ItemTemplate>
                                <asp:Image ID="imgProduct" Height="50px" Width="50px" ImageUrl='<%# Bind("productPic") %>' runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="productID" HeaderText="productID" InsertVisible="False" ReadOnly="True" SortExpression="productID" />
                        <asp:BoundField DataField="productCode" HeaderText="productCode" SortExpression="productCode" />
                        <asp:BoundField DataField="productName" HeaderText="productName" SortExpression="productName" />
                        <asp:BoundField DataField="catName" HeaderText="catName" SortExpression="catName" />
                        <asp:BoundField DataField="UnitPrice" HeaderText="UnitPrice" SortExpression="UnitPrice" />
                        <asp:BoundField DataField="productDesciption" HeaderText="productDesciption" SortExpression="productDesciption" />
                        <asp:BoundField DataField="categoryID" HeaderText="categoryID" SortExpression="categoryID" Visible="False" />
                        <asp:CheckBoxField DataField="isActive" HeaderText="isActive" SortExpression="isActive" />
                    </Columns>
                    <PagerStyle CssClass="dataTables_paginate paging_simple_numbers" />
                </asp:GridView>
                <asp:SqlDataSource ID="sdsProduct" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    SelectCommand="SELECT productMST.productID, productMST.productCode, productMST.productName, productMST.productDesciption, productMST.categoryID,
                     productMST.isActive, productMST.productPic, productMST.UnitPrice, categoryMST.catName FROM productMST 
                    LEFT OUTER JOIN categoryMST ON productMST.categoryID = categoryMST.categoryID 
                    WHERE ( productMST.productName like '%'+ @productName + '%' )AND  ( productMST.productCode like '%'+ @productCode + '%' )AND (@categoryID=0 OR productMST.categoryID=@categoryID )
                  ">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtCode" DefaultValue="%" Name="productCode" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="ddlCategory" Name="categoryID" PropertyName="SelectedValue" Type="Decimal" />
                        <asp:ControlParameter ControlID="txtName" DefaultValue="%" Name="productName" PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>

            </div>
        </div>
    </div>
</asp:Content>
