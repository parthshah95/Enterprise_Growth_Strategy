<%@ Page Title="" Language="C#" MasterPageFile="~/sonyMST.Master" AutoEventWireup="true" CodeBehind="inquiryDetail.aspx.cs" Inherits="SonyWeb_3.inquiryDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headerContent" runat="server">
    Inquiry Detail
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" runat="server">
    <asp:Repeater ID="rptNotification" runat="server" DataSourceID="sdsNotification">
        <ItemTemplate>
            <div class="col-xs-12 col-sm-3 widget-container-col" id="widget-container-col-6">
                <div class="widget-box widget-color-dark light-border">
                    <div class="widget-header">
                        <div class="widget-toolbar">
                            <span class="badge badge-danger">Inquiry</span>
                        </div>
                    </div>

                    <div class="widget-body">
                        <div class="widget-main padding-6">
                            <div class="alert alert-info">
                               
                                <h4 class="widget-title smaller">Cust - <%# Eval("custName") %></h4>

                                <h5 class="widget-title smaller">Product - <%# Eval("productName") %></h5>
                                <h5 class="widget-title smaller">Phone - <%# Eval("cellNumber") %></h5>
                                <h5 class="widget-title smaller">Email - <%# Eval("email") %></h5>
                                <h5 class="widget-title smaller">Price - <%# Eval("productUnitPrice") %></h5>
                                <h5 class="widget-title smaller">Descount - <%# Eval("discountedPrice") %></h5>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>
    <asp:SqlDataSource ID="sdsNotification" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT I.custName, I.productName, I.productUnitPrice, I.discountedPrice, customerMST.cellNumber, customerMST.email FROM inquiryMST AS I INNER JOIN customerMST ON I.customerID = customerMST.customerID WHERE (I.inquiryMST = @incID)">
        <SelectParameters>
            <asp:SessionParameter Name="incID" SessionField="inqID" />
        </SelectParameters>
    </asp:SqlDataSource>
    <div class="row">
        <div class="col-sm-6">
            <div class="tabbable tabs-left">
                <ul class="nav nav-tabs" id="myTab3">
                    <li class="active">
                        <a data-toggle="tab" href="#home3">
                            <i class="pink ace-icon fa fa-tachometer bigger-110"></i>
                            Follow ups
                        </a>
                    </li>

                    <%-- <li>
                        <a data-toggle="tab" href="#profile3">
                            <i class="blue ace-icon fa fa-user bigger-110"></i>
                            Profile
                        </a>
                    </li>

                    <li>
                        <a data-toggle="tab" href="#dropdown13">
                            <i class="ace-icon fa fa-rocket"></i>
                            More
                        </a>
                    </li>--%>
                </ul>

                <div class="tab-content">
                    <div id="home3" class="tab-pane in active">
                        <asp:GridView ID="gvProduct" CssClass="table table-striped table-bordered table-hover" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="sdsProduct">
                            <Columns>
                                <asp:BoundField DataField="followupDate" HeaderText="followupDate" SortExpression="followupDate" DataFormatString="{0:d}" />
                                <asp:BoundField DataField="followupDetail" HeaderText="followupDetail" SortExpression="followupDetail" />
                                <asp:BoundField DataField="followupType" HeaderText="followupType" SortExpression="followupType" />
                            </Columns>
                            <PagerStyle CssClass="dataTables_paginate paging_simple_numbers" />
                        </asp:GridView>

                        <asp:SqlDataSource ID="sdsProduct" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                            SelectCommand="SELECT followupDetail, followupType, followupDate, isActive, isDone, doneDate FROM followups WHERE (inquiryID = @inqID)">
                            <SelectParameters>
                                <asp:SessionParameter Name="inqID" SessionField="inqID" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>

                    <%--  <div id="profile3" class="tab-pane">
                        <p>Food truck fixie locavore, accusamus mcsweeney's marfa nulla single-origin coffee squid.</p>
                        <p>Raw denim you probably haven't heard of them jean shorts Austin.</p>
                    </div>

                    <div id="dropdown13" class="tab-pane">
                        <p>Etsy mixtape wayfarers, ethical wes anderson tofu before they sold out mcsweeney's organic lomo retro fanny pack lo-fi farm-to-table readymade.</p>
                        <p>Raw denim you probably haven't heard of them jean shorts Austin.</p>
                    </div>--%>
                </div>
            </div>
        </div>
        <!-- /.col -->
    </div>
</asp:Content>
