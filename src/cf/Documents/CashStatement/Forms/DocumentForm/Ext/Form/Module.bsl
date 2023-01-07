﻿#Region FormEvents

&AtServer
Procedure AfterWriteAtServer(CurrentObject, WriteParameters)
	DocCashStatementServer.AfterWriteAtServer(Object, CurrentObject, WriteParameters);
	SetVisibilityAvailability(Object, ThisObject);
EndProcedure

&AtServer
Procedure OnReadAtServer(CurrentObject)
	SetVisibilityAvailability(Object, ThisObject);
EndProcedure

&AtServer
Procedure BeforeWriteAtServer(Cancel, CurrentObject, WriteParameters)
	AddAttributesAndPropertiesServer.BeforeWriteAtServer(ThisObject, Cancel, CurrentObject, WriteParameters);
EndProcedure

&AtClient
Procedure NotificationProcessing(EventName, Parameter, Source)
	If EventName = "UpdateAddAttributeAndPropertySets" Then
		AddAttributesCreateFormControl();
	EndIf;
EndProcedure

&AtServer
Procedure OnCreateAtServer(Cancel, StandardProcessing)
	If Parameters.Key.IsEmpty() Then
		SetVisibilityAvailability(Object, ThisObject);
	EndIf;
	DocCashStatementServer.OnCreateAtServer(Object, ThisObject, Cancel, StandardProcessing);
EndProcedure

&AtClient
Procedure OnOpen(Cancel)
	DocCashStatementClient.OnOpen(Object, ThisObject, Cancel);
EndProcedure

&AtServer
Procedure OnWriteAtServer(Cancel, CurrentObject, WriteParameters)
	DocumentsServer.OnWriteAtServer(Object, ThisObject, Cancel, CurrentObject, WriteParameters);
EndProcedure

&AtClient
Procedure FormSetVisibilityAvailability() Export
	SetVisibilityAvailability(Object, ThisObject);
EndProcedure

&AtClientAtServerNoContext
Procedure SetVisibilityAvailability(Object, Form)
	Form.Items.EditCurrencies.Enabled = Not Form.ReadOnly;
EndProcedure

#EndRegion

#Region GroupTitleDecorations

&AtClient
Procedure DecorationGroupTitleCollapsedPictureClick(Item)
	DocCashStatementClient.DecorationGroupTitleCollapsedPictureClick(Object, ThisObject, Item);
EndProcedure

&AtClient
Procedure DecorationGroupTitleCollapsedLabelClick(Item)
	DocCashStatementClient.DecorationGroupTitleCollapsedLabelClick(Object, ThisObject, Item);
EndProcedure

&AtClient
Procedure DecorationGroupTitleUncollapsedPictureClick(Item)
	DocCashStatementClient.DecorationGroupTitleUncollapsedPictureClick(Object, ThisObject, Item);
EndProcedure

&AtClient
Procedure DecorationGroupTitleUncollapsedLabelClick(Item)
	DocCashStatementClient.DecorationGroupTitleUncollapsedLabelClick(Object, ThisObject, Item);
EndProcedure

#EndRegion

#Region ItemDescription

&AtClient
Procedure DescriptionClick(Item, StandardProcessing)
	DocCashStatementClient.DescriptionClick(Object, ThisObject, Item, StandardProcessing);
EndProcedure

#EndRegion

#Region AddAttributes

&AtClient
Procedure AddAttributeStartChoice(Item, ChoiceData, StandardProcessing) Export
	AddAttributesAndPropertiesClient.AddAttributeStartChoice(ThisObject, Item, StandardProcessing);
EndProcedure

&AtServer
Procedure AddAttributesCreateFormControl()
	AddAttributesAndPropertiesServer.CreateFormControls(ThisObject, "GroupOther");
EndProcedure

#EndRegion

#Region ExternalCommands

&AtClient
Procedure GeneratedFormCommandActionByName(Command) Export
	ExternalCommandsClient.GeneratedFormCommandActionByName(Object, ThisObject, Command.Name);
	GeneratedFormCommandActionByNameServer(Command.Name);
EndProcedure

&AtServer
Procedure GeneratedFormCommandActionByNameServer(CommandName) Export
	ExternalCommandsServer.GeneratedFormCommandActionByName(Object, ThisObject, CommandName);
EndProcedure

#EndRegion

#Region ItemFormEvents

&AtClient
Procedure DataPeriodOnChange(Item)
	DocCashStatementClient.DataPeriodOnChange(Object, DataPeriod);
EndProcedure

&AtClient
Procedure StatusOnChange(Item)
	DocCashStatementClient.StatusOnChange(ThisObject);
EndProcedure

&AtClient
Procedure CompanyOnChange(Item)
	DocCashStatementClient.CompanyOnChange(ThisObject);
EndProcedure

&AtClient
Procedure BranchOnChange(Item)
	DocCashStatementClient.BranchOnChange(ThisObject);
EndProcedure

&AtClient
Procedure DateOnChange(Item)
	DocCashStatementClient.DateOnChange(ThisObject);
EndProcedure

&AtClient
Procedure NumberOnChange(Item)
	DocCashStatementClient.NumberOnChange(ThisObject);
EndProcedure

&AtClient
Procedure FillTransactions(Command)
	FillTransactionsAtServer();
EndProcedure

&AtServer
Procedure FillTransactionsAtServer()
	DocCashStatementServer.FillTransactions(Object);
EndProcedure

&AtClient
Procedure BasisDocumentOnChange(Item)
	BasisDocumentOnChangeAtServer();
EndProcedure

&AtServer
Procedure BasisDocumentOnChangeAtServer()
	DocCashStatementServer.FillOnBasisDocument(Object);
EndProcedure

&AtClient
Procedure PaymentListOnChange(Item, AddInfo = Undefined) Export
	Return;
EndProcedure

&AtClient
Procedure PaymentListFinancialMovementTypeStartChoice(Item, ChoiceData, StandardProcessing)
	DocCashStatementClient.PaymentListFinancialMovementTypeStartChoice(Object, ThisObject, Item, ChoiceData,
		StandardProcessing);
EndProcedure

&AtClient
Procedure PaymentListFinancialMovementTypeEditTextChange(Item, Text, StandardProcessing)
	DocCashStatementClient.PaymentListFinancialMovementTypeEditTextChange(Object, ThisObject, Item, Text,
		StandardProcessing);
EndProcedure

#EndRegion

&AtClient
Procedure ShowRowKey(Command)
	DocumentsClient.ShowRowKey(ThisObject);
EndProcedure

&AtClient
Procedure EditCurrencies(Command)
	CurrentData = ThisObject.Items.PaymentList.CurrentData;
	If CurrentData = Undefined Then
		Return;
	EndIf;
	FormParameters = CurrenciesClientServer.GetParameters_V6(Object, CurrentData);
	NotifyParameters = New Structure();
	NotifyParameters.Insert("Object", Object);
	NotifyParameters.Insert("Form"  , ThisObject);
	Notify = New NotifyDescription("EditCurrenciesContinue", CurrenciesClient, NotifyParameters);
	OpenForm("CommonForm.EditCurrencies", FormParameters, , , , , Notify, FormWindowOpeningMode.LockOwnerWindow);
EndProcedure

&AtClient
Procedure ShowHiddenTables(Command)
	DocumentsClient.ShowHiddenTables(Object, ThisObject);
EndProcedure
