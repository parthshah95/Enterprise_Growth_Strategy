<%@ Page Title="" Language="C#" MasterPageFile="~/sonyMST.Master" AutoEventWireup="true" CodeBehind="cutomrDetail.aspx.cs" Inherits="SonyWeb_3.cutomrDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headerContent" runat="server">
    Customer Detail
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" runat="server">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-body">
                <p class="text-danger">
                    <asp:Literal ID="liVal" runat="server"></asp:Literal>
                </p>
                <div class="col-lg-6">
                    <div class="form-group">
                        <label>First Name</label>
                        <asp:TextBox ID="txtFName" CssClass="form-control" runat="server" required></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Middel Name</label>
                        <asp:TextBox ID="txtMName" CssClass="form-control" runat="server" required></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Last Name</label>
                        <asp:TextBox ID="txtLName" CssClass="form-control" runat="server" required></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Cell</label>
                        <asp:TextBox ID="txtCell" CssClass="form-control" runat="server" required></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Home</label>
                        <asp:TextBox ID="txtHome" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Company</label>
                        <asp:TextBox ID="txtCompany" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Customer Type</label>
                        <asp:DropDownList ID="ddlType" CssClass="form-control" AppendDataBoundItems="True" runat="server" DataSourceID="sdsCust" DataTextField="customerType" DataValueField="customerTypeID">
                            <asp:ListItem Text="None" Value="0"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="sdsCust" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [customerTypeID], [customerType] FROM [customerTypeMST] WHERE ([isActive] = @isActive)">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="true" Name="isActive" Type="Boolean" />
                            </SelectParameters>
                        </asp:SqlDataSource>

                    </div>
                    <div class="form-group">
                        <label>Customer Status</label>
                        <asp:DropDownList ID="ddlStatus" CssClass="form-control" AppendDataBoundItems="True" runat="server" DataSourceID="sdsStatus" DataTextField="customerStatus" DataValueField="customerStatusID">
                            <asp:ListItem Text="None" Value="0"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="sdsStatus" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [customerStatusID], [customerStatus] FROM [customerStatusMST] WHERE ([isActive] = @isActive)">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="true" Name="isActive" Type="Boolean" />
                            </SelectParameters>
                        </asp:SqlDataSource>

                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="form-group">
                        <label>Email</label>
                        <asp:TextBox ID="txtEmail" CssClass="form-control" TextMode="Email" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>WebSite</label>
                        <asp:TextBox ID="txtWebSite" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>DOB</label>
                        <asp:TextBox ID="txtDOB" CssClass="form-control" Rows="5" runat="server"></asp:TextBox>
                        <asp:ImageButton ID="imgPopup" ImageUrl="assets/img/Calendar.png" ImageAlign="Bottom"
                            runat="server" />
                        <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" PopupButtonID="imgPopup" TargetControlID="txtDOB" Format="dd/MM/yyyy" />

                    </div>
                    <div class="form-group">
                        <label>Address Line 1</label>
                        <asp:TextBox ID="txtAddress1" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Address Line 2</label>
                        <asp:TextBox ID="txtAddress2" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>City </label>
                        <asp:TextBox ID="txtCity" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Work Phone </label>
                        <asp:TextBox ID="txtWorkPhone" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>


                <asp:Button ID="btnSave" CssClass="btn btn-primary" OnClick="btnSave_Click" runat="server" Text="Save" />
            </div>
        </div>
    </div>
</asp:Content>
