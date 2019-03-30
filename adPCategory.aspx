<%@ Page Title="" Language="C#" MasterPageFile="~/sonyMST.Master" AutoEventWireup="true" CodeBehind="adPCategory.aspx.cs" Inherits="SonyWeb_3.adPCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headerContent" runat="server">
    Product Caterogy List
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" runat="server">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-body">
                <p class="text-danger">
                    <asp:Literal ID="liVal" runat="server"></asp:Literal>
                    <asp:LinkButton ID="ltbnNew" PostBackUrl="~/adAddPCategory.aspx" runat="server">New Category</asp:LinkButton>
                </p>
                <div class="form-group">

                    <div class="panel-body">
                        <div class="table-responsive">
                            <asp:GridView ID="gvUsers" CssClass="table table-striped table-bordered table-hover" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="sdsUsers">
                                <Columns>
                                    <asp:BoundField DataField="catCode" HeaderText="Code" SortExpression="catCode" />
                                    <asp:BoundField DataField="catName" HeaderText="Name" SortExpression="catName" />
                                    <asp:TemplateField HeaderText="Description" SortExpression="catDescription">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("catDescription") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("catDescription") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:CheckBoxField DataField="isActive" HeaderText="isActive" SortExpression="isActive" />
                                    <asp:BoundField DataField="Parent" HeaderText="Parent" SortExpression="Parent" />
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="sdsUsers" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT categoryMST.catCode, categoryMST.catName, categoryMST.catDescription, categoryMST.isActive, parentCat.catName AS Parent FROM categoryMST LEFT OUTER JOIN categoryMST AS parentCat ON categoryMST.parentcategoryID = parentCat.categoryID"></asp:SqlDataSource>
                        </div>
                    </div>


                </div>
            </div>
        </div>
    </div>
</asp:Content>
