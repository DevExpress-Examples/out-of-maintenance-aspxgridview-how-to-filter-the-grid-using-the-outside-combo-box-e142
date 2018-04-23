Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Configuration
Imports System.Collections
Imports System.Web
Imports System.Web.Security
Imports DevExpress.Web.ASPxGridView



Partial Public Class Advanced_CheckBox_Selection
	Inherits System.Web.UI.Page

	Private Const SessionCountryParameter As String = "ShipCountry"
	Private Const SessionCountryInitValue As String = "USA"

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
		If (Not IsPostBack) AndAlso (Not IsCallback) Then
			'Init values on the first load
			Session(SessionCountryParameter) = SessionCountryInitValue
			cbCountries.Value = SessionCountryInitValue
			grid.ExpandAll()
		End If
	End Sub
	Protected Sub grid_CustomCallback(ByVal sender As Object, ByVal e As ASPxGridViewCustomCallbackEventArgs)
		If CStr(Session(SessionCountryParameter)) = e.Parameters Then
		Return
		End If
		Session(SessionCountryParameter) = e.Parameters
		grid.DataBind()
		grid.ExpandAll()
	End Sub
End Class
