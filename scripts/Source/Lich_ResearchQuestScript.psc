Scriptname Lich_ResearchQuestScript extends Quest  
{This quest script handles all the heavy lifting for the quest to research all the necessary steps to becoming a lich.} 

Actor Property PlayerREF Auto
{Least "expensive" way to reference the player}

GlobalVariable Property Lich_FragmentsFound  Auto
{Global variable stores the number of journal fragments found.}
GlobalVariable Property Lich_FragmentsTotal  Auto
{Global variable stores the total number of journal fragments.}
GlobalVariable Property Lich_FragmentsOptRemaining Auto
{Global variable stores the number of optional fragments not yet found.}

Function FragmentFound(Bool IsOptional = False)
{Called whenever a journal fragment is found.

This function ensures that the relevant quest objective is updated,
and when all fragments have been found it updates the quest to the
next state -- performing the final ritual!}
	;Debug.Notification("A fragment's been found!")
	;Make sure our quest is running
	If IsRunning() == False
		If Start()
			;Debug.Notification("Quest started")
		EndIf
	EndIf
	
	;Make sure we're on the appropriate stage
	If GetStage() <= 10
		If SetStage(10)
			;Debug.Notification("Stage set")
		EndIf
		If IsOptional
			;One fewer optional fragments
			Lich_FragmentsOptRemaining.Value = Lich_FragmentsOptRemaining.Value - 1
		EndIf
		;Increment our fragment count and update our quest stage
		If ModObjectiveGlobal(1, Lich_FragmentsFound, 10, Lich_FragmentsTotal.Value - Lich_FragmentsOptRemaining.Value)
			;Debug.Notification("Found 'em all!")
			SetStage (20)
			;SetObjectiveDisplayed(20) ;Build the phylactery
			;SetObjectiveDisplayed(21) ;Get a human heart
			;SetObjectiveDisplayed(22) ;Charge the phylactery
			;SetObjectiveDisplayed(23) ;Brew the Elixir
			;SetObjectiveDisplayed(24) ;Final transformation
		endIf
	EndIf
EndFunction

; The requirements
Armor Property Phylactery  Auto  
{Charged phylactery}
Potion Property ElixirEndlessNight Auto
{The Elixir of Endless Night}

; The results
Armor Property PhylacteryFinal Auto
{The lich's final phylactery}
Quest Property LichStatus Auto
{Lich status tracking quest}

;TODO: This whole chain of events is pretty FUBAR right now...
Function LichTransformation()
{Transform the player into a lich!}
	; "transform" the player by upgrading the phylactery...
	PlayerREF.RemoveItem(Phylactery, 1, True)
	PlayerREF.RemoveItem(ElixirEndlessNight, 1, True)
	;Adding the final phylactery happens in the MakeLich() method
	
	; ...and start the status quest
	LichStatus.Start()
	LichStatus.SetStage(10)
EndFunction
