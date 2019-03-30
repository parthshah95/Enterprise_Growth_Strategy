<%@ Page Title="" Language="C#" MasterPageFile="~/sonyMST.Master" AutoEventWireup="true" CodeBehind="customers.aspx.cs" Inherits="SonyWeb_3.customers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headerContent" runat="server">
    Customers
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
                            <label>First Name</label>
                            <asp:TextBox ID="txtFName" CssClass="form-control" runat="server" required></asp:TextBox>

                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="form-group">
                            <label>Last Name</label>
                            <asp:TextBox ID="txtlName" CssClass="form-control" runat="server" required></asp:TextBox>

                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="form-group">
                            <label>DOB</label>
                            <asp:TextBox ID="txtDOB" CssClass="form-control" Rows="5" runat="server" ></asp:TextBox>
                            <asp:ImageButton ID="imgPopup" ImageUrl="assets/img/Calendar.png" ImageAlign="Bottom"
                                runat="server" />
                            <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" PopupButtonID="imgPopup" TargetControlID="txtDOB" Format="MM/dd/yyyy" />

                        </div>
                    </div>
                    <div class="col-lg-3">
                        <asp:Button ID="btnSearch" CausesValidation="true" CssClass="btn btn-primary" runat="server" Text="Search" />
                        <asp:LinkButton ID="lbtnNew" CssClass="btn btn-primary" PostBackUrl="~/customerNew.aspx" CausesValidation="false" runat="server">New </asp:LinkButton>

                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="col-lg-12">
        <!-- Advanced Tables -->
        <div class="panel panel-default">
            <div class="panel-heading">
                Filtered Customer
            </div>
            <div class="panel-body">
                <asp:GridView ID="gvProduct" CssClass="table table-striped table-bordered table-hover" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="customerID" DataSourceID="sdsProduct">
                    <Columns>
                        <asp:BoundField DataField="customerID" HeaderText="customerID" InsertVisible="False" ReadOnly="True" SortExpression="customerID" />
                        <asp:BoundField DataField="firstName" HeaderText="firstName" SortExpression="firstName" />
                        <asp:BoundField DataField="lastName" HeaderText="lastName" SortExpression="lastName" />
                        <asp:BoundField DataField="DOB" HeaderText="DOB" SortExpression="DOB" DataFormatString="{0:d}" />
                        <asp:BoundField DataField="homeNumber" HeaderText="homeNumber" SortExpression="homeNumber" />
                        <asp:BoundField DataField="cellNumber" HeaderText="cellNumber" SortExpression="cellNumber" />
                        <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="lbtnDetail" runat="server" CommandArgument='<%# Eval("customerID") %>' OnClick="lbtnDetail_Click1">Detail</asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="lbtnInqiry" runat="server" CommandArgument='<%# Eval("customerID") %>' OnClick="lbtnInqiry_Click">New Inquiry</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle CssClass="dataTables_paginate paging_simple_numbers" />
                </asp:GridView>
                <asp:SqlDataSource ID="sdsProduct" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    SelectCommand="SELECT [customerID], [firstName], [lastName], [DOB], [homeNumber], [cellNumber], [email] FROM [customerMST] 
                    WHERE (([firstName] LIKE '%' + @firstName + '%') 
                    AND ([lastName] LIKE '%' + @lastName + '%') 
                    AND (@DOB = '1/1/2000'  OR [DOB] = @DOB))">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtFName" DefaultValue="%" Name="firstName" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtlName" DefaultValue="%" Name="lastName" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtDOB" DefaultValue="1/1/2000" Name="DOB" PropertyName="Text" Type="DateTime" />
                    </SelectParameters>
                </asp:SqlDataSource>

            </div>
        </div>
    </div>
</asp:Content>
