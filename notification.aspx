<%@ Page Title="" Language="C#" MasterPageFile="~/sonyMST.Master" AutoEventWireup="true" CodeBehind="notification.aspx.cs" Inherits="SonyWeb_3.notification" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headerContent" runat="server">
    Notifications
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" runat="server">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-body">
                <asp:Repeater ID="rptNotification" runat="server" DataSourceID="sdsNotification">
                    <ItemTemplate>

                        <div class="col-xs-12 col-sm-3 widget-container-col" id="widget-container-col-6">
                            <div class="widget-box widget-color-dark light-border">
                                <div class="widget-header">
                                    <div class="widget-toolbar">
                                        <span class="badge badge-danger">Alert</span>
                                    </div>
                                </div>

                                <div class="widget-body">
                                    <div class="widget-main padding-6">
                                        <div class="alert alert-info">
                                            <h4 class="widget-title smaller">Make Followup for :</h4>
                                            <h5 class="widget-title smaller">Cust - <%# Eval("custName") %></h5>

                                            <h5 class="widget-title smaller">Product - <%# Eval("productName") %></h5>
                                            <h5 class="widget-title smaller">Phone - <%# Eval("cellNumber") %></h5>
                                            <h5 class="widget-title smaller">Email - <%# Eval("email") %></h5>
                                            <h5 class="widget-title smaller">Price - <%# Eval("productUnitPrice") %></h5>
                                            <h5 class="widget-title smaller">Discount - <%# Eval("discountedPrice") %></h5>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:SqlDataSource ID="sdsNotification" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT F.followupID, I.custName, I.productName, I.productUnitPrice, I.discountedPrice, customerMST.cellNumber, customerMST.email FROM followups AS F INNER JOIN inquiryMST AS I ON F.inquiryID = I.inquiryMST INNER JOIN customerMST ON I.customerID = customerMST.customerID WHERE (F.isActive = 1) AND (F.isDone = 0) AND (DATEADD(dd, 0, DATEDIFF(dd, 0, F.followupDate)) = DATEADD(dd, 0, DATEDIFF(dd, 0, GETDATE()))) AND (I.inquiryOwnerID = @UserID)">
                    <SelectParameters>
                        <asp:SessionParameter Name="UserID" SessionField="userID" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </div>


</asp:Content>


