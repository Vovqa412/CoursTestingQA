﻿Procedure Undopost(DocObject, Cancel, AddInfo = Undefined) Export
	If Cancel Then
		Return;
	EndIf;

	Parameters = New Structure();
	Parameters.Insert("Object", DocObject);
	Parameters.Insert("IsReposting", False);
	Parameters.Insert("PointInTime", DocObject.PointInTime());
	Parameters.Insert("TempTablesManager", New TempTablesManager());

	Module = Documents[DocObject.Ref.Metadata().Name];

	DocumentDataTables = Module.UndopostingGetDocumentDataTables(DocObject.Ref, Cancel, Parameters, AddInfo);
	Parameters.Insert("DocumentDataTables", DocumentDataTables);
	If Cancel Then
		Return;
	EndIf;

	LockDataSources = Module.UndopostingGetLockDataSource(DocObject.Ref, Cancel, Parameters, AddInfo);
	Parameters.Insert("LockDataSources", LockDataSources);
	If Cancel Then
		Return;
	EndIf;
	
	// Save pointers to locks			
	DataLock = Undefined;
	If LockDataSources <> Undefined Then
		DataLock = SetLock(LockDataSources);
	EndIf;
	If TypeOf(AddInfo) = Type("Structure") Then
		AddInfo.Insert("DataLock", DataLock);
	EndIf;

	Module.UndopostingCheckBeforeWrite(DocObject.Ref, Cancel, Parameters, AddInfo);
	If Cancel Then
		Return;
	EndIf;

	For Each RecordSet In DocObject.RegisterRecords Do
		If Upper(RecordSet.Metadata().Name) = Upper("TM1010B_RowIDMovements") Then
			Continue;
		EndIf;
		RecordSet.Clear();
		RecordSet.Write();
	EndDo;

	Module.UndopostingCheckAfterWrite(DocObject.Ref, Cancel, Parameters, AddInfo);
EndProcedure

Function SetLock(LockDataSources)
	DataLock = New DataLock();

	For Each Row In LockDataSources Do
		DataLockItem = DataLock.Add(Row.Key);

		DataLockItem.Mode = DataLockMode.Exclusive;
		DataLockItem.DataSource = Row.Value.Data;

		For Each Field In Row.Value.Fields Do
			DataLockItem.UseFromDataSource(Field.Key, Field.Value);
		EndDo;
	EndDo;
	If LockDataSources.Count() Then
		DataLock.Lock();
	EndIf;
	Return DataLock;
EndFunction