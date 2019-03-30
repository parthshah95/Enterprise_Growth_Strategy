<%@ Page Title="" Language="C#" MasterPageFile="~/sonyMST.Master" AutoEventWireup="true" CodeBehind="adStores.aspx.cs" Inherits="SonyWeb_3.adStores" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headerContent" runat="server">
    Store List
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" runat="server">
      <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-body">
                <p class="text-danger">
                    <asp:Literal ID="liVal" runat="server"></asp:Literal>
                    <asp:LinkButton ID="ltbnNew" PostBackUrl="~/adAddStore.aspx" runat="server">New Store</asp:LinkButton>
                </p>
                <div class="form-group">

                    <div class="panel-body">
                            <div class="table-responsive">
                    <asp:GridView ID="gvUsers" CssClass="table table-striped table-bordered table-hover" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="storeID" DataSourceID="sdsUsers">
                        <Columns>
                            <asp:BoundField DataField="accountID" HeaderText="Acc ID" SortExpression="accountID" />
                            <asp:BoundField DataField="storeID" HeaderText="Store ID" SortExpression="storeID" InsertVisible="False" ReadOnly="True" />
                            <asp:BoundField DataField="storeName" HeaderText="Name" SortExpression="storeName" />
                            <asp:BoundField DataField="storeDetail" HeaderText="Detail" SortExpression="storeDetail" />
                            <asp:BoundField DataField="storeHolder" HeaderText="Manager" SortExpression="storeHolder" />
                            <asp:BoundField DataField="ContactDetail" HeaderText="Contact #" SortExpression="ContactDetail" />
                            <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                            <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                            <asp:CheckBoxField DataField="isActive" HeaderText="isActive" SortExpression="isActive" />
                            <asp:TemplateField></asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="sdsUsers" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [accountID], [storeID], [storeName], [storeDetail], [storeHolder], [ContactDetail], [City], [State], [isActive] FROM [storeMST]"></asp:SqlDataSource>
                </div>
            </div>
                                
                                
                                 </div>
            </div>
        </div>
    </div>
</asp:Content>
