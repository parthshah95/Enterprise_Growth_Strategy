<%@ Page Title="" Language="C#" MasterPageFile="~/sonyMST.Master" AutoEventWireup="true" CodeBehind="mails.aspx.cs" Inherits="SonyWeb_3.mails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headerContent" runat="server">
    Mails
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" runat="server">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-body">
                <p class="text-danger">
                    <asp:Literal ID="liVal" runat="server"></asp:Literal>
                </p>
                  <asp:LinkButton ID="lbtnNew" CssClass="btn btn-primary"  PostBackUrl="~/mailNew.aspx" runat="server">New Mail</asp:LinkButton>
                 
                <div class="row">
                     <asp:GridView ID="gvProduct" CssClass="table table-striped table-bordered table-hover" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="messageID" DataSourceID="sdsMail">
                         <Columns>
                             <asp:BoundField DataField="messageID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="messageID" />
                             <asp:BoundField DataField="messageDate" HeaderText="Date" SortExpression="messageDate" />
                             <asp:BoundField DataField="firstName" HeaderText="firstName" SortExpression="firstName" />
                             <asp:BoundField DataField="lastName" HeaderText="lastName" SortExpression="lastName" />
                             <asp:BoundField DataField="messageType" HeaderText="Type" SortExpression="messageType" />
                             <asp:TemplateField HeaderText="Detail" SortExpression="messageDetail">
                               
                                 <ItemTemplate>
                                     <asp:Literal ID="litMsg" Text='<%# Bind("messageDetail") %>' runat="server"></asp:Literal>
                                     
                                 </ItemTemplate>
                             </asp:TemplateField>
                         </Columns>
                </asp:GridView>
                     <asp:SqlDataSource ID="sdsMail" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT messageMail.messageID, userDetails.firstName, userDetails.lastName, messageMail.messageDetail, messageMail.messageDate, messageMail.messageType FROM messageMail INNER JOIN userDetails ON messageMail.senderID = userDetails.userID WHERE (messageMail.receiverID = @userID)">
                         <SelectParameters>
                             <asp:SessionParameter Name="userID" SessionField="userID" />
                         </SelectParameters>
                     </asp:SqlDataSource>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
