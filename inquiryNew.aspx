<%@ Page Title="" Language="C#" MasterPageFile="~/sonyMST.Master" AutoEventWireup="true" CodeBehind="inquiryNew.aspx.cs" Inherits="SonyWeb_3.inquiryNew" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headerContent" runat="server">
    Inquiry
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" runat="server">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-body">
                <p class="text-danger">
                    <asp:Literal ID="liVal" runat="server"></asp:Literal>
                </p>

                <div class="form-group">
                    <label>Customer</label>
                    <asp:DropDownList ID="ddlCustomer" CssClass="form-control" AppendDataBoundItems="True" runat="server" DataSourceID="sdsCust" DataTextField="CustName" DataValueField="customerID">
                        <asp:ListItem Text="None" Value="0"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="sdsCust" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT firstName + ' ' + lastName AS CustName, customerID FROM customerMST"></asp:SqlDataSource>

                </div>
                <div class="form-group">
                    <label>Inquiry Type</label>
                    <asp:TextBox ID="txtType" CssClass="form-control" runat="server" required></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Product</label>
                    <asp:DropDownList ID="ddProduct" CssClass="form-control" AppendDataBoundItems="True" AutoPostBack="true" runat="server" DataSourceID="sdsProduct" DataTextField="Product" DataValueField="productID">
                        <asp:ListItem Text="None" Value="0"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="sdsProduct" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT productCode + ' : ' + productName AS Product, productID FROM productMST"></asp:SqlDataSource>

                </div>
                <div class="form-group">
                    <label>Unit Price</label>
                    <asp:DropDownList ID="ddlUnit" CssClass="form-control" runat="server" DataSourceID="sdsPrice" DataTextField="UnitPrice" DataValueField="productCode">
                       
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="sdsPrice" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT UnitPrice, productCode FROM productMST WHERE (productID = @pID)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddProduct" Name="pID" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                </div>
                <div class="form-group">
                    <label>Discount</label>
                    <asp:TextBox ID="txtDiscount" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Next Followup Date</label>
                    <asp:TextBox ID="txtFD" CssClass="form-control" runat="server" required></asp:TextBox>
                    <asp:ImageButton ID="imgPopup" ImageUrl="assets/img/Calendar.png" ImageAlign="Bottom" Width="50px"
                        runat="server" />
                    <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" PopupButtonID="imgPopup" TargetControlID="txtFD" Format="dd/MM/yyyy" />

                </div>

                <div class="form-group">
                    <label>Detail</label>
                    <asp:TextBox ID="txtDetail" TextMode="MultiLine" Rows="3" CssClass="form-control" runat="server" ></asp:TextBox>

                </div>
                <asp:Button ID="btnSave" CssClass="btn btn-primary" OnClick="btnSave_Click" runat="server" Text="Save" />
            </div>
        </div>
    </div>
</asp:Content>
