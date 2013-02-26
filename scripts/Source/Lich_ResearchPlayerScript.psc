Scriptname Lich_ResearchPlayerScript extends ReferenceAlias  

Armor Property Phylactery Auto
Armor Property PhylacteryCharged Auto
Potion Property ElixirEndlessNight Auto
Ingredient Property HumanHeart Auto

Quest Property Lich01 Auto

Actor Property PlayerREF Auto

Event OnInit()
	Debug.Notification("Assigning inventory event filters")
	AddInventoryEventFilter(Phylactery)
	AddInventoryEventFilter(HumanHeart)
	AddInventoryEventFilter(PhylacteryCharged)
	AddInventoryEventFilter(ElixirEndlessNight)
EndEvent

Event OnItemAdded(Form ItemAdded, Int ItemCount, ObjectReference ItemRef, ObjectReference SourceRef)
	Debug.Notification("Added an item")
	If Lich01.IsRunning() == True && Lich01.GetStage() == 20
		PlayerItemsCheck()
	EndIf
EndEvent

Event OnItemRemoved(Form ItemAdded, Int ItemCount, ObjectReference ItemRef, ObjectReference SourceRef)
	Debug.Notification("Removed an item")
	If Lich01.IsRunning() == True && Lich01.GetStage() == 20
		PlayerItemsCheck()
	EndIf
EndEvent

Function PlayerItemsCheck()
	Bool GotEmAll = True
	
	Debug.Notification("Checking for ingredients")
	
	;Check for a phylactery
	If PlayerREF.GetItemCount(Phylactery) >= 1
		Lich01.SetObjectiveCompleted(20, True)
	ElseIf PlayerREF.GetItemCount(PhylacteryCharged) < 1 && Lich01.IsObjectiveCompleted(20) == True
		;If we don't have a charged phylactery, we still need one of these
		Lich01.SetObjectiveCompleted(20, False)
		Lich01.SetObjectiveDisplayed(20, True)
		GotEmAll = False
	EndIf
	
	;Check for a heart
	If PlayerREF.GetItemCount(HumanHeart) >= 1
		Lich01.SetObjectiveCompleted(21, True)
	ElseIf PlayerREF.GetItemCount(PhylacteryCharged) < 1 && Lich01.IsObjectiveCompleted(21) == True
		;If we don't have a charged phylactery, we still need one of these
		Lich01.SetObjectiveCompleted(21, False)
		Lich01.SetObjectiveDisplayed(21, True)
		GotEmAll = False
	EndIf
	
	;Check for a charged phylactery
	If PlayerREF.GetItemCount(PhylacteryCharged) >= 1
		Lich01.SetObjectiveCompleted(22, True)
	ElseIf Lich01.IsObjectiveCompleted(22) == True
		Lich01.SetObjectiveCompleted(22, False)
		Lich01.SetObjectiveDisplayed(22, True)
		GotEmAll = False
	EndIf
	
	;Check for the elixir
	If PlayerREF.GetItemCount(ElixirEndlessNight) >= 1
		Lich01.SetObjectiveCompleted(23, True)
	ElseIf Lich01.IsObjectiveCompleted(23) == True
		Lich01.SetObjectiveCompleted(23, False)
		Lich01.SetObjectiveDisplayed(23, True)
		GotEmAll = False
	EndIf
EndFunction
