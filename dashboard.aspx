<%@ Page Title="" Language="C#" MasterPageFile="~/sonyMST.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="SonyWeb_3.Dashboard" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headerContent" runat="server">
    Dashboard
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" runat="server">
   <div class="col-lg-6">
        <div class="panel panel-default">
            <div class="panel-body">
                <h2>Total Inquiry</h2>
                <asp:Chart ID="Chart1" runat="server" DataSourceID="sds" CssClass="chat-body">
                    <Series>
                        <asp:Series Name="Series1" XValueMember="UserName" YValueMembers="IValue"></asp:Series>
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                    </ChartAreas>
                </asp:Chart>



                <asp:SqlDataSource ID="sds" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT 'Store' as UserName,COUNT(inquiryMST) AS IValue
FROM inquiryMST
UNION ALL 
SELECT 'My' as UserName,COUNT(MYINQ.inquiryMST) AS IValue FROM inquiryMST AS MYINQ 
WHERE (MYINQ.inquiryOwnerID = @userID)">
                    <SelectParameters>
                        <asp:SessionParameter Name="userID" SessionField="userID" />
                    </SelectParameters>
                </asp:SqlDataSource>

            </div>
        </div>
    </div>

    <div class="col-lg-6">
        <div class="panel panel-default">
            <div class="panel-body">
                <h2>Completed Inquiry</h2>
                <asp:Chart ID="Chart2" runat="server" DataSourceID="sds" CssClass="chat-body">
                    <Series>
                        <asp:Series Name="Series1" XValueMember="UserName" YValueMembers="IValue"></asp:Series>
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                    </ChartAreas>
                </asp:Chart>



                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT 'Store' as UserName,COUNT(inquiryMST) AS IValue
FROM inquiryMST
                    WHERE inquiryStatus = 'Close'
UNION ALL 
SELECT 'My' as UserName,COUNT(MYINQ.inquiryMST) AS IValue FROM inquiryMST AS MYINQ 
WHERE (MYINQ.inquiryOwnerID = @userID) AND MYINQ.inquiryStatus = 'Close'">
                    <SelectParameters>
                        <asp:SessionParameter Name="userID" SessionField="userID" />
                    </SelectParameters>
                </asp:SqlDataSource>

            </div>
        </div>
    </div>

</asp:Content>
