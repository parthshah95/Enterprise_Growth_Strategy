<%@ Page Title="" Language="C#" MasterPageFile="~/sonyMST.Master" AutoEventWireup="true" CodeBehind="followups.aspx.cs" Inherits="SonyWeb_3.followups" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headerContent" runat="server">
    Follow ups
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
                            <label>Customer</label>
                            <asp:DropDownList ID="ddlCustomer" CssClass="form-control" AppendDataBoundItems="True" runat="server" DataSourceID="sdsCust" DataTextField="CustName" DataValueField="customerID">
                                <asp:ListItem Text="None" Value="0"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="sdsCust" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT firstName + ' ' + lastName AS CustName, customerID FROM customerMST"></asp:SqlDataSource>

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
                        <asp:LinkButton ID="lbtnNew" CssClass="btn btn-primary" PostBackUrl="~/followupNew.aspx" runat="server">New </asp:LinkButton>

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
                <asp:Panel ID="plFollowup" ScrollBars="Auto" runat="server">
                    <asp:GridView ID="gvProduct" CssClass="table table-striped table-bordered table-hover" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="sdsProduct">
                        <Columns>
                            <asp:BoundField DataField="inquiryID" HeaderText="inquiryID" SortExpression="inquiryID" />
                            <asp:BoundField DataField="followupDate" HeaderText="followupDate" SortExpression="followupDate" DataFormatString="{0:d}" />
                            <asp:BoundField DataField="productName" HeaderText="productName" SortExpression="productName" />
                            <asp:BoundField DataField="productCode" HeaderText="productCode" SortExpression="productCode" />
                            <asp:BoundField DataField="productUnitPrice" HeaderText="productUnitPrice" SortExpression="productUnitPrice" />
                            <asp:BoundField DataField="discountedPrice" HeaderText="discountedPrice" SortExpression="discountedPrice" />
                            <asp:BoundField DataField="custName" HeaderText="custName" SortExpression="custName" />
                            <asp:CheckBoxField DataField="isActive" HeaderText="isActive" SortExpression="isActive" />
                            <asp:BoundField DataField="followupDetail" HeaderText="followupDetail" SortExpression="followupDetail" />
                            <asp:BoundField DataField="followupType" HeaderText="followupType" SortExpression="followupType" />
                            <asp:TemplateField>
                                  <ItemTemplate>
                               <asp:LinkButton ID="lbtnClose" runat="server" CommandArgument='<%# Eval("followupID") %>' OnClick="lbtnClose_Click">Close</asp:LinkButton>
                            </ItemTemplate>

                            </asp:TemplateField>
                        </Columns>
                        <PagerStyle CssClass="dataTables_paginate paging_simple_numbers" />
                    </asp:GridView>
                </asp:Panel>
                <asp:SqlDataSource ID="sdsProduct" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    SelectCommand="SELECT followups.followupID, inquiryMST.productName, inquiryMST.productCode, inquiryMST.productUnitPrice, inquiryMST.discountedPrice, inquiryMST.custName, followups.followupDate, followups.inquiryID, followups.isActive, followups.followupDetail, followups.followupType FROM followups INNER JOIN inquiryMST ON followups.inquiryID = inquiryMST.inquiryMST LEFT OUTER JOIN productMST ON inquiryMST.productID = productMST.productID LEFT OUTER JOIN categoryMST ON productMST.categoryID = categoryMST.categoryID WHERE (productMST.productName LIKE '%' + @productName + '%')  AND (@categoryID=0 OR (productMST.categoryID = @categoryID)) AND (@custID=0 OR (inquiryMST.customerID = @custID)) AND followups.isActive=1">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtName" DefaultValue="%" Name="productName" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="ddlCategory" Name="categoryID" PropertyName="SelectedValue" Type="Decimal" DefaultValue="0" />
                        <asp:ControlParameter ControlID="ddlCustomer" DefaultValue="0" Name="custID" PropertyName="SelectedValue" Type="Decimal" />
                    </SelectParameters>
                </asp:SqlDataSource>

            </div>
        </div>
    </div>
</asp:Content>

