Scriptname Lich_RecoveryPlayerScript extends ReferenceAlias  

Armor Property PhylacteryRepaired  Auto  

Quest Property LichRecovery Auto

Actor Property PlayerREF Auto

Event OnInit()
	Debug.Notification("Assigning inventory event filters")
	AddInventoryEventFilter(PhylacteryRepaired)
EndEvent

Event OnItemAdded(Form ItemAdded, Int ItemCount, ObjectReference ItemRef, ObjectReference SourceRef)
	Debug.Notification("Added an item")
	If LichRecovery.IsRunning() == True && LichRecovery.GetStage() == 10
		PlayerItemsCheck()
	EndIf
EndEvent

Event OnItemRemoved(Form ItemAdded, Int ItemCount, ObjectReference ItemRef, ObjectReference SourceRef)
	Debug.Notification("Removed an item")
	If LichRecovery.IsRunning() == True && LichRecovery.GetStage() == 10
		PlayerItemsCheck()
	EndIf
EndEvent

Function PlayerItemsCheck()
	Bool GotEmAll = True
	
	Debug.Notification("Checking for repaired phylactery")
	
	;Check for a phylactery
	If PlayerREF.GetItemCount(PhylacteryRepaired) >= 1
		LichRecovery.SetObjectiveCompleted(10, True)
		LichRecovery.SetStage(20)
	ElseIf LichRecovery.IsObjectiveCompleted(10) == True
		;FIXME: Losing the repaired phylactery is actually significantly troublesome; see Issue #23
		LichRecovery.SetObjectiveCompleted(10, False)
		LichRecovery.SetObjectiveDisplayed(10, True)
		GotEmAll = False
	EndIf
EndFunction
