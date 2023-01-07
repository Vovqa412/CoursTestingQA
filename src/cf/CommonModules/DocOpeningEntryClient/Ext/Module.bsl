﻿#Region FormEvents

Procedure OnOpen(Object, Form, Cancel, AddInfo = Undefined) Export
	DocumentsClient.SetTextOfDescriptionAtForm(Object, Form);
EndProcedure

#EndRegion

#Region ItemCompany

Procedure CompanyOnChange(Object, Form, Item) Export
	DocumentsClientServer.ChangeTitleGroupTitle(Object, Form);
EndProcedure

Procedure CompanyStartChoice(Object, Form, Item, ChoiceData, StandardProcessing) Export
	OpenSettings = DocumentsClient.GetOpenSettingsStructure();

	OpenSettings.ArrayOfFilters = New Array();
	OpenSettings.ArrayOfFilters.Add(DocumentsClientServer.CreateFilterItem("DeletionMark", True,
		DataCompositionComparisonType.NotEqual));
	OpenSettings.ArrayOfFilters.Add(DocumentsClientServer.CreateFilterItem("OurCompany", True,
		DataCompositionComparisonType.Equal));
	OpenSettings.FillingData = New Structure("OurCompany", True);

	DocumentsClient.CompanyStartChoice(Object, Form, Item, ChoiceData, StandardProcessing, OpenSettings);
EndProcedure

Procedure CompanyEditTextChange(Object, Form, Item, Text, StandardProcessing) Export
	ArrayOfFilters = New Array();
	ArrayOfFilters.Add(DocumentsClientServer.CreateFilterItem("DeletionMark", True, ComparisonType.NotEqual));
	ArrayOfFilters.Add(DocumentsClientServer.CreateFilterItem("OurCompany", True, ComparisonType.Equal));
	DocumentsClient.CompanyEditTextChange(Object, Form, Item, Text, StandardProcessing, ArrayOfFilters);
EndProcedure

#EndRegion

Procedure DateOnChange(Object, Form, Item) Export
	DocumentsClientServer.ChangeTitleGroupTitle(Object, Form);
EndProcedure

#Region ItemDescription

Procedure DescriptionClick(Object, Form, Item, StandardProcessing) Export
	StandardProcessing = False;
	CommonFormActions.EditMultilineText(Item.Name, Form);
EndProcedure

#EndRegion

#Region GroupTitleDecorationsEvents

Procedure DecorationGroupTitleCollapsedPictureClick(Object, Form, Item) Export
	DocumentsClientServer.ChangeTitleCollapse(Object, Form, True);
EndProcedure

Procedure DecorationGroupTitleCollapsedLabelClick(Object, Form, Item) Export
	DocumentsClientServer.ChangeTitleCollapse(Object, Form, True);
EndProcedure

Procedure DecorationGroupTitleUncollapsedPictureClick(Object, Form, Item) Export
	DocumentsClientServer.ChangeTitleCollapse(Object, Form, False);
EndProcedure

Procedure DecorationGroupTitleUncollapsedLabelClick(Object, Form, Item) Export
	DocumentsClientServer.ChangeTitleCollapse(Object, Form, False);
EndProcedure

#EndRegion

#Region InventoryItemsEvents

Procedure InventoryItemOnChange(Object, Form, Module, Item = Undefined, Settings = Undefined) Export
	TransferSettings = DocumentsClient.GetSettingsStructure(ThisObject);
	TransferSettings.Insert("ItemListName", "Inventory");
	DocumentsClient.ItemListItemOnChange(Object, Form, ThisObject, Item, TransferSettings);
EndProcedure

Function ItemListItemSettings(Object, Form, AddInfo = Undefined) Export
	Return InventoryItemSettings(Form);
EndFunction

Function InventoryItemSettings(Form)
	Settings = New Structure("Actions, ObjectAttributes, FormAttributes, AfterActionsCalculateSettings");

	Actions = New Structure();
	Actions.Insert("UpdateItemKey", "UpdateItemKey");

	AfterActionsCalculateSettings = New Structure();

	Settings.Actions = Actions;
	Settings.ObjectAttributes = "ItemKey";
	Settings.FormAttributes = "";
	Settings.AfterActionsCalculateSettings = AfterActionsCalculateSettings;
	Return Settings;
EndFunction

Procedure InventoryItemKeyOnChange(Object, Form, Module, Item = Undefined, Settings = Undefined) Export
	TransferSettings = DocumentsClient.GetSettingsStructure(ThisObject);
	TransferSettings.Insert("ItemListName", "Inventory");
	DocumentsClient.ItemListItemKeyOnChange(Object, Form, ThisObject, Item, TransferSettings);
EndProcedure

Function ItemListItemKeySettings(Object, Form, AddInfo = Undefined) Export
	Return InventoryItemKeySettings(Form);
EndFunction

Function InventoryItemKeySettings(Form)
	Settings = New Structure("Actions, ObjectAttributes, FormAttributes, AfterActionsCalculateSettings");

	Actions = New Structure();

	AfterActionsCalculateSettings = New Structure();

	Settings.Actions = Actions;
	Settings.ObjectAttributes = "ItemKey";
	Settings.FormAttributes = "";
	Settings.AfterActionsCalculateSettings = AfterActionsCalculateSettings;
	Return Settings;
EndFunction

Function CurrencySettings(Object, Form, AddInfo = Undefined) Export
	Return New Structure();
EndFunction

#EndRegion