﻿Procedure ChoiceDataGetProcessing(ChoiceData, Parameters, StandardProcessing)
	StandardProcessing = False;
	ChoiceData = New ValueList();
	ChoiceData.Add(Enums.CalculationTypes.PostShipmentCredit);
	ChoiceData.Add(Enums.CalculationTypes.Prepaid);
EndProcedure