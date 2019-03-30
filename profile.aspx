<%@ Page Title="" Language="C#" MasterPageFile="~/sonyMST.Master" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="SonyWeb_3.profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headerContent" runat="server">
    My Profile
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" runat="server">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-body">
                <p class="text-danger">
                    <asp:Literal ID="liVal" runat="server"></asp:Literal>
                </p>
                <asp:Image ID="imgPic" Height="100px" Width="100px" runat="server" />
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
                    <label>Pic</label>
                    <asp:FileUpload ID="flPhoto" runat="server" />
                </div>

                <div class="form-group">
                    <label>Password</label>
                    <asp:TextBox ID="txtPass" TextMode="Password" CssClass="form-control" runat="server" required></asp:TextBox>
                    <p class="help-block">Enter Password Name Here</p>
                </div>

                <div class="form-group">
                    <label>DOB</label>
                    <asp:TextBox ID="txtDOB" CssClass="form-control" Rows="5" runat="server" required></asp:TextBox>
                    <asp:ImageButton ID="imgPopup" ImageUrl="assets/img/Calendar.png" ImageAlign="Bottom"
                        runat="server" />
                    <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" PopupButtonID="imgPopup" TargetControlID="txtDOB" Format="dd/MM/yyyy" />

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
                    <asp:TextBox ID="txtAddressLine2" CssClass="form-control" runat="server" required></asp:TextBox>

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
