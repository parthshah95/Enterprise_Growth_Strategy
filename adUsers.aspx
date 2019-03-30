<%@ Page Title="" Language="C#" MasterPageFile="~/sonyMST.Master" AutoEventWireup="true" CodeBehind="adUsers.aspx.cs" Inherits="SonyWeb_3.adUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headerContent" runat="server">
    User List
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" runat="server">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-body">
                <p class="text-danger">
                    <asp:Literal ID="liVal" runat="server"></asp:Literal>
                    <asp:LinkButton ID="ltbnNew" PostBackUrl="~/adAddUser.aspx" runat="server">New User</asp:LinkButton>
                </p>
                <div class="form-group">

                    <div class="panel-body">
                        <div class="table-responsive">
                            <asp:GridView ID="gvUsers" CssClass="table table-striped table-bordered table-hover" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="userID" DataSourceID="sdsUsers">
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:Image ID="imgUser" Height="100px" Width="100px" ImageUrl='<%#("~/userData/userPic/" + Eval("userID").ToString()+".jpg" )%>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="accountID" HeaderText="Acc ID" SortExpression="accountID" />
                                    <asp:BoundField DataField="storeID" HeaderText="Store ID" SortExpression="storeID" />
                                    <asp:BoundField DataField="userID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="userID" />
                                    <asp:BoundField DataField="firstName" HeaderText="First Name" SortExpression="firstName" />
                                    <asp:BoundField DataField="lastName" HeaderText="Last Name" SortExpression="lastName" />
                                    <asp:BoundField DataField="DOB" DataFormatString="{0:d}" HeaderText="DOB" SortExpression="DOB" />
                                    <asp:BoundField DataField="contactNumber" HeaderText="Contact #" SortExpression="contactNumber" />
                                    <asp:CheckBoxField DataField="isActive" HeaderText="isActive" SortExpression="isActive" />
                                    <asp:CheckBoxField DataField="isDeleted" HeaderText="isDeleted" SortExpression="isDeleted" />
                                    <asp:TemplateField></asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="sdsUsers" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [userID], [firstName], [lastName], [DOB], [contactNumber], [isActive], [isDeleted], [accountID], [storeID] FROM [userDetails] ORDER BY [firstName], [lastName]"></asp:SqlDataSource>
                        </div>
                    </div>


                </div>
            </div>
        </div>
    </div>
</asp:Content>
