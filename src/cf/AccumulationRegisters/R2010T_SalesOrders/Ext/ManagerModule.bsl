﻿#Region Service
Function GetLockFields(Data) Export
	Result = New Structure();
	Result.Insert("RegisterName", "AccumulationRegister.R2010T_SalesOrders");
	LockInfo = New Structure("Data, Fields", Data, PostingServer.GetLockFieldsMap(GetLockFieldNames()));
	Result.Insert("LockInfo", LockInfo);
	Return Result;
EndFunction

Function GetLockFieldNames() Export
	Return "";
EndFunction

Function GetExistsRecords(Ref, RecordType = Undefined, AddInfo = Undefined) Export
	Return PostingServer.GetExistsRecordsFromAccRegister(Ref, "AccumulationRegister.R2010T_SalesOrders", RecordType,
		AddInfo);
EndFunction
#EndRegion