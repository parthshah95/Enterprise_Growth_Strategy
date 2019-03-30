<%@ Page Title="" Language="C#" MasterPageFile="~/sonyMST.Master" AutoEventWireup="true" CodeBehind="mailNew.aspx.cs" Inherits="SonyWeb_3.mailNew" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headerContent" runat="server">
    Mail
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" runat="server">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-body">
                <p class="text-danger">
                    <asp:Literal ID="liVal" runat="server"></asp:Literal>
                </p>
                <div class="form-group">
                    <label>To</label>
                    <asp:DropDownList ID="ddlStore" CssClass="form-control" AppendDataBoundItems="True" runat="server" DataSourceID="sdsStore" DataTextField="firstName" DataValueField="userID">
                        <asp:ListItem Text="None" Value="0"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="sdsStore" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [userID], [firstName] FROM [userDetails] WHERE ([userID] &lt;&gt; @userID)">
                        <SelectParameters>
                            <asp:SessionParameter Name="userID" SessionField="userID" Type="Decimal" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                </div>
                <div class="form-group">
                    <label>Message Type</label>
                    <asp:TextBox ID="txtType" CssClass="form-control" Rows="5" runat="server" required></asp:TextBox>
                </div>

                <div class="form-group">
                    <label>Messages</label>
                    <asp:TextBox ID="txtDetail" TextMode="MultiLine" Rows="3" CssClass="form-control" runat="server" required></asp:TextBox>

                </div>
                <asp:Button ID="btnSave" CssClass="btn btn-primary" OnClick="btnSave_Click" runat="server" Text="Send" />
            </div>
        </div>
    </div>
</asp:Content>
