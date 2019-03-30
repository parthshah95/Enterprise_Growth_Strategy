<%@ Page Title="" Language="C#" MasterPageFile="~/sonyMST.Master" AutoEventWireup="true" CodeBehind="inquiry.aspx.cs" Inherits="SonyWeb_3.inquiry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headerContent" runat="server">
    Inquiry
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
                            <label>Customer Name</label>
                            <asp:TextBox ID="txtCust" CssClass="form-control" runat="server" required></asp:TextBox>

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
                            <label>Date</label>
                            <asp:TextBox ID="txtInqury" CssClass="form-control" Rows="5" runat="server" ></asp:TextBox>
                            <asp:ImageButton ID="imgPopup" ImageUrl="assets/img/Calendar.png" ImageAlign="Bottom"
                                runat="server" />
                            <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" PopupButtonID="imgPopup" TargetControlID="txtInqury" Format="dd/MM/yyyy" />

                        </div>
                    </div>
                    <div class="col-lg-3">
                        <asp:Button ID="btnSearch" CausesValidation="true" CssClass="btn btn-primary" runat="server" Text="Search" />
                        <asp:LinkButton ID="lbtnNew" CssClass="btn btn-primary" CausesValidation="false"  PostBackUrl="~/inquiryNew.aspx" runat="server">New </asp:LinkButton>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="col-lg-12">
        <!-- Advanced Tables -->
        <div class="panel panel-default">
            <div class="panel-heading">
                Filtered Inquiry
            </div>
            <div class="panel-body">
                <asp:GridView ID="gvProduct" CssClass="table table-striped table-bordered table-hover" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="inquiryMST" DataSourceID="sdsProduct">
                    <Columns>
                        <asp:BoundField DataField="inquiryMST" HeaderText="inquiryMST" InsertVisible="False" ReadOnly="True" SortExpression="inquiryMST" />
                        <asp:BoundField DataField="createdDate" DataFormatString="{0:d}" HeaderText="createdDate" SortExpression="createdDate" />
                        <asp:BoundField DataField="custName" HeaderText="custName" SortExpression="custName" />
                        <asp:BoundField DataField="productName" HeaderText="productName" SortExpression="productName" />
                        <asp:BoundField DataField="productUnitPrice" HeaderText="productUnitPrice" SortExpression="productUnitPrice" />
                        <asp:BoundField DataField="discountedPrice" HeaderText="discountedPrice" SortExpression="discountedPrice" />
                        <asp:BoundField DataField="inquiryType" HeaderText="inquiryType" SortExpression="inquiryType" />
                        <asp:BoundField DataField="inquiryStatus" HeaderText="inquiryStatus" SortExpression="inquiryStatus" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="lbtnDetail" runat="server" CommandArgument='<%# Eval("inquiryMST") %>' OnClick="lbtnDetail_Click">Detail</asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="lbtnFollowup" runat="server" CommandArgument='<%# Eval("inquiryMST") %>' OnClick="lbtnFollowup_Click">Set Next Followup</asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="lbtnClose" runat="server" CommandArgument='<%# Eval("inquiryMST") %>' OnClick="lbtnClose_Click">Close</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle CssClass="dataTables_paginate paging_simple_numbers" />
                </asp:GridView>
                <asp:SqlDataSource ID="sdsProduct" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    SelectCommand="SELECT [inquiryMST], [custName], [productName], [productUnitPrice], [discountedPrice], [inquiryType], [inquiryStatus], [createdDate] FROM [inquiryMST] 
                    WHERE (([custName] LIKE '%' + @custName + '%') 
                    AND ([productName] LIKE '%' + @productName + '%') 
                    AND (@createdDate='1/1/2000' OR [createdDate] = @createdDate)) ORDER BY [createdDate] DESC">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtCust" DefaultValue="%" Name="custName" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtName" DefaultValue="%" Name="productName" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtInqury" DefaultValue="1/1/2000" Name="createdDate" PropertyName="Text" Type="DateTime" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </div>
</asp:Content>
