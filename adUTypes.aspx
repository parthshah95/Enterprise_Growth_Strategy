<%@ Page Title="" Language="C#" MasterPageFile="~/sonyMST.Master" AutoEventWireup="true" CodeBehind="adUTypes.aspx.cs" Inherits="SonyWeb_3.adUTypes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headerContent" runat="server">
    User Groups
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" runat="server">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-body">
                <p class="text-danger">
                    <asp:Literal ID="liVal" runat="server"></asp:Literal>
                    <asp:LinkButton ID="ltbnNew" Visible="false" PostBackUrl="~/addAddUType.aspx" runat="server">New User Group</asp:LinkButton>
                </p>
                <div class="form-group">

                    <div class="panel-body">
                        <div class="table-responsive">
                            <asp:GridView ID="gvUsers" CssClass="table table-striped table-bordered table-hover" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="userGroupID" DataSourceID="sdsUsers">
                                <Columns>
                                    <asp:BoundField DataField="userGroupID" HeaderText="ID" SortExpression="userGroupID" InsertVisible="False" ReadOnly="True" />
                                    <asp:BoundField DataField="groupName" HeaderText="Name" SortExpression="groupName" />
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="sdsUsers" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [userGroupID], [groupName] FROM [userGroupMST]"></asp:SqlDataSource>
                        </div>
                    </div>


                </div>
            </div>
        </div>
    </div>
</asp:Content>
