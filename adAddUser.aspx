<%@ Page Title="" Language="C#" MasterPageFile="~/sonyMST.Master" AutoEventWireup="true" CodeBehind="adAddUser.aspx.cs" Inherits="SonyWeb_3.adAddUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headerContent" runat="server">
    User Detail
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" runat="server">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-body">
                <p class="text-danger">
                    <asp:Literal ID="liVal" runat="server"></asp:Literal>
                </p>
                <div class="form-group">
                    <label>First Name</label>
                    <asp:TextBox ID="txtFName" CssClass="form-control" runat="server" required></asp:TextBox>
                    <p class="help-block">Enter First Name Here</p>
                </div>
                <div class="form-group">
                    <label>Last Name</label>
                    <asp:TextBox ID="txtLName" CssClass="form-control" runat="server" required></asp:TextBox>
                    <p class="help-block">Enter Last Name Here</p>
                </div>
                 <div class="form-group">
                    <label> Pic</label>
                    <asp:FileUpload ID="flPhoto" runat="server" />                
                </div>
                 <div class="form-group">
                    <label>User Name</label>
                    <asp:TextBox ID="txtUserName" CssClass="form-control" runat="server" required></asp:TextBox>
                    <p class="help-block">Enter User Name Here</p>
                </div>
                 <div class="form-group">
                    <label>Password</label>
                    <asp:TextBox ID="txtPass" TextMode="Password" CssClass="form-control" runat="server" required></asp:TextBox>
                    <p class="help-block">Enter Password Here</p>
                </div>
                  <div class="form-group">
                    <label>User Type</label>
                    <asp:DropDownList ID="ddlUserType" CssClass="form-control" AppendDataBoundItems="True" runat="server" DataSourceID="sdsUserType" DataTextField="groupName" DataValueField="userGroupID">
                        <asp:ListItem Text="None" Value="0"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="sdsUserType" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [userGroupID], [groupName] FROM [userGroupMST]">
                    </asp:SqlDataSource>
                    <p class="help-block">Account user Fall In</p>
                </div>
                <div class="form-group">
                    <label>DOB</label>
                    <asp:TextBox ID="txtDOB" CssClass="form-control" Rows="5" runat="server" required></asp:TextBox>
                    <asp:ImageButton ID="imgPopup" ImageUrl="assets/img/Calendar.png" ImageAlign="Bottom"
                        runat="server" />
                    <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" PopupButtonID="imgPopup" TargetControlID="txtDOB" Format="dd/MM/yyyy" />

                </div>
                <div class="form-group">
                    <label>Account</label>
                    <asp:DropDownList ID="ddlAccount" CssClass="form-control" AppendDataBoundItems="True" runat="server" DataSourceID="sdsCategory" DataTextField="accountName" DataValueField="accountID">
                        <asp:ListItem Text="None" Value="0"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="sdsCategory" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [accountID], [accountName], [isActive] FROM [accountMST] WHERE ([isActive] = @isActive)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="true" Name="isActive" Type="Boolean" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <p class="help-block">Account user Fall In</p>
                </div>
                <div class="form-group">
                    <label>Store</label>
                    <asp:DropDownList ID="ddlStore" CssClass="form-control" AppendDataBoundItems="True" runat="server" DataSourceID="sdsStore" DataTextField="storeName" DataValueField="storeID">
                        <asp:ListItem Text="None" Value="0"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="sdsStore" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [storeID], [storeName] FROM [storeMST]">
                    </asp:SqlDataSource>
                    <p class="help-block">Store user Fall In</p>
                </div>              
                <div class="form-group">
                    <label>Contact #</label>
                    <asp:TextBox ID="txtContact" CssClass="form-control" runat="server" required></asp:TextBox>

                </div>
                <div class="form-group">
                    <label>Address Line 1</label>
                    <asp:TextBox ID="txtAddLine1" CssClass="form-control" runat="server" required></asp:TextBox>

                </div>
                <div class="form-group">
                    <label>Address Line 2</label>
                    <asp:TextBox ID="txtAddressLine2" CssClass="form-control" runat="server"></asp:TextBox>

                </div>
                <div class="form-group">
                    <label>City</label>
                    <asp:TextBox ID="txtCity" CssClass="form-control" runat="server" required></asp:TextBox>

                </div>
                <div class="form-group">
                    <label>State</label>
                    <asp:TextBox ID="txtState" CssClass="form-control" runat="server" required></asp:TextBox>

                </div>
                <div class="form-group">
                    <label>Description</label>
                    <asp:TextBox ID="txtDesc" TextMode="MultiLine" Rows="5" CssClass="form-control" runat="server"></asp:TextBox>

                </div>
                <asp:Button ID="btnSave" CssClass="btn btn-primary" OnClick="btnSave_Click" runat="server" Text="Save" />
            </div>
        </div>
    </div>
</asp:Content>

