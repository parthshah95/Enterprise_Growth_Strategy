<%@ Page Title="" Language="C#" MasterPageFile="~/sonyMST.Master" AutoEventWireup="true" CodeBehind="followupNew.aspx.cs" Inherits="SonyWeb_3.followupNew" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headerContent" runat="server">
    Set Follow up
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" runat="server">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-body">
                <p class="text-danger">
                    <asp:Literal ID="liVal" runat="server"></asp:Literal>
                </p>
                <div class="form-group">
                    <label>Inquiry</label>
                    <asp:DropDownList ID="ddlStore" CssClass="form-control" AppendDataBoundItems="True" runat="server" DataSourceID="sdsStore" DataTextField="InqDetail" DataValueField="inquiryMST">
                        <asp:ListItem Text="None" Value="0"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="sdsStore" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT inquiryMST, custName + '-' + productName AS InqDetail FROM inquiryMST"></asp:SqlDataSource>

                </div>
                <div class="form-group">
                    <label>Followup Date</label>
                    <asp:TextBox ID="txtFD" CssClass="form-control" Rows="5" runat="server" required></asp:TextBox>
                    <asp:ImageButton ID="imgPopup" ImageUrl="assets/img/Calendar.png" ImageAlign="Bottom"
                        runat="server" />
                    <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" PopupButtonID="imgPopup" TargetControlID="txtFD" Format="dd/MM/yyyy" />

                </div>

                <div class="form-group">
                    <label>Detail</label>
                    <asp:TextBox ID="txtDetail" TextMode="MultiLine" Rows="3" CssClass="form-control" runat="server"></asp:TextBox>

                </div>
                <asp:Button ID="btnSave" CssClass="btn btn-primary" OnClick="btnSave_Click" runat="server" Text="Save" />
            </div>
        </div>
    </div>
</asp:Content>
