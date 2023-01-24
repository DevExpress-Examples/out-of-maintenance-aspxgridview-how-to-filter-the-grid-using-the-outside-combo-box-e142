<%-- BeginRegion TagPrefix and page properties --%>
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Advanced_CheckBox_Selection" ValidateRequest="false"%>

<%@ Register Assembly="DevExpress.Web.v13.1" Namespace="DevExpress.Web" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v13.1" Namespace="DevExpress.Web" TagPrefix="dxwgv" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%-- EndRegion --%>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>How to filter the grid using the outside combobox</title>
</head>
<body>
    <form id="form1" runat="server">
    
    <dxe:ASPxComboBox ID="cbCountries" runat="server" DataSourceID="dsCountries" TextField="ShipCountry" ValueField="ShipCountry" EnableClientSideAPI="True" ValueType="System.String">
        <ClientSideEvents SelectedIndexChanged="function(s, e) { grid.PerformCallback(s.GetValue()); }">
        </ClientSideEvents>
    </dxe:ASPxComboBox>
    <br/>
	<dxwgv:ASPxGridView ID="grid" runat="server" AutoGenerateColumns="False"
            DataSourceID="dsOrders" KeyFieldName="OrderID" OnCustomCallback="grid_CustomCallback">
            <Columns>
                <dxwgv:GridViewDataDateColumn FieldName="OrderDate">
                </dxwgv:GridViewDataDateColumn>
                <dxwgv:GridViewDataDateColumn FieldName="ShippedDate">
                </dxwgv:GridViewDataDateColumn>
                <dxwgv:GridViewDataTextColumn FieldName="ShipVia">
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn FieldName="Freight">
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn FieldName="ShipName">
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn FieldName="ShipCity" GroupIndex="0">
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn FieldName="ShipRegion">
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn FieldName="ShipCountry">
                </dxwgv:GridViewDataTextColumn>
            </Columns>
            <Settings ShowGroupPanel="True"/>
        </dxwgv:ASPxGridView>
        <asp:AccessDataSource ID="dsOrders" runat="server" DataFile="~/App_Data/nwind.mdb"
            SelectCommand="SELECT * FROM [Orders] where ShipCountry = ?">
            <SelectParameters>
                <asp:SessionParameter Name="ShipCountry" DefaultValue="USA" SessionField="ShipCountry" />
            </SelectParameters>
        </asp:AccessDataSource>
        <asp:AccessDataSource ID="dsCountries" runat="server" DataFile="~/App_Data/nwind.mdb"
            SelectCommand="SELECT distinct ShipCountry FROM [Orders]">
       </asp:AccessDataSource>     
    </form>
</body>
</html>