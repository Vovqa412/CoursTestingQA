﻿&AtServer
Procedure OnCreateAtServer(Cancel, StandardProcessing)

	Items.Stores.Enabled = False;
	Items.PriceTypes.Enabled = False;
	Items.Prices.Enabled = False;
	Items.PaymentTerm.Enabled = False;
	Items.TaxRates.Enabled = False;

	For Each Question In Parameters.QuestionsParameters Do
		ThisObject[Question.Action] = True;
		Items[Question.Action].Enabled = True;
		Items[Question.Action].Title = Question.QuestionText;
	EndDo;

	If PriceTypes Then
		Items.Prices.Enabled = True;
		Prices = True;
		Items.Prices.Title = R().QuestionToUser_013;
	EndIf;

EndProcedure

&AtClient
Procedure OK(Command)
	Actions = New Structure();

	If Stores Then
		Actions.Insert("UpdateStores", "UpdateStores");
	EndIf;
	If PriceTypes Then
		Actions.Insert("UpdatePriceTypes", "UpdatePriceTypes");
	EndIf;
	If Prices Then
		Actions.Insert("UpdatePrices", "UpdatePrices");
	EndIf;
	If PaymentTerm Then
		Actions.Insert("UpdatePaymentTerm", "UpdatePaymentTerm");
	EndIf;
	If TaxRates Then
		Actions.Insert("UpdateTaxRates", "UpdateTaxRates");
	EndIf;
	Close(Actions);
EndProcedure

&AtClient
Procedure Cancel(Command)
	Close(Undefined);
EndProcedure