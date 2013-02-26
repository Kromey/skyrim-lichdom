Scriptname Lich_StatusScript extends Quest  

Actor Property PlayerREF Auto
{Least "expensive" way to reference the player}

;Lich ability perks
Perk Property Lich_CommonAbilitiesPerk  Auto 
Perk Property Lich_DemiAbilitiesPerk  Auto  
Perk Property Lich_FullAbilitiesPerk  Auto  

;Phylacteries
Armor Property PhylacteryFinal  Auto 
Armor Property PhylacteryDamaged  Auto  
Armor Property PhylacteryRepaired  Auto  

Spell Property Lich_PhylacteryBlast Auto
{Phylactery explosion effect}

Quest Property RecoveryQuest Auto

Int Property CurrentStage Auto
{Store the current stage because GetStage is useless.
Used for tracking lichdom state.}

Function MakeLich()
{Make the player a lich.}
	;Remove nether abilities
	PlayerREF.RemovePerk(Lich_DemiAbilitiesPerk)

	;Add ability perks
	PlayerREF.AddPerk(Lich_CommonAbilitiesPerk)
	PlayerREF.AddPerk(Lich_FullAbilitiesPerk)
	
	;Player can't die
	PlayerREF.GetActorBase().SetEssential(True)
	
	;Add the phylactery
	PlayerREF.AddItem(PhylacteryFinal, 1, False)
	
	;Make sure the lich is no longer a "ghost" of its former glory
	PlayerREF.SetAlpha(1.0, True)

	CurrentStage = 20
	Debug.Notification("Player is now a lich")
EndFunction

Function MakeNetherLich()
{Make the player a nether lich.}
	;Remove full abilities
	PlayerREF.RemovePerk(Lich_FullAbilitiesPerk)

	;Add ability perks
	PlayerREF.AddPerk(Lich_CommonAbilitiesPerk)
	PlayerREF.AddPerk(Lich_DemiAbilitiesPerk)
	
	;Take away the phylactery, add the damaged phylactery
	PlayerREF.RemoveItem(PhylacteryFinal, 1, True)
	PlayerREF.AddItem(PhylacteryDamaged, 1, False)
	
	;Make the nether lich a "ghost" of its former glory
	PlayerREF.SetAlpha(0.25, True)
	
	;Start the recovery quest
	If RecoveryQuest.IsRunning()
		;Stop it and reset it
		RecoveryQuest.Stop()
		RecoveryQuest.Reset()
	EndIf
	RecoveryQuest.Start()
	RecoveryQuest.SetStage(10)
	
	;Player can die now
	PlayerREF.GetActorBase().SetEssential(False)

	CurrentStage = 10
	Debug.Notification("Player is now a nether lich")
EndFunction

Function MakeAncientLich()
	Debug.Notification("Ancient lich state not implemented... yet...")
	CurrentStage = 30
EndFunction

Function LichDeath()
	If CurrentStage == 10
		Debug.Notification("Nether lich death -- die!")
		;Player is already a nether lich -- time to die!
		;Do nothing, player was already made killable in MakeNetherLich()
	ElseIf CurrentStage == 20
		Debug.Notification("Lich death -- become nether lich!")
		
		;Phylactery explodes!
		Utility.Wait(0.25)
		Lich_PhylacteryBlast.Cast(PlayerREF)
		
		Utility.Wait(1.0) ;Pause to let the drama of the moment sink in...
		
		;Heal the player up
		PlayerREF.RestoreAV("health", PlayerREF.GetBaseAV("health"))
		
		;Make the player a nether lich
		MakeNetherLich()
	;ElseIf CurrentStage == 30
		;Player is an ancient lich
		;not implemented
	Else
		;Bwuh???
		Debug.Notification("Unknown lich state!")
		;Failsafe -- just make 'em a lich
		MakeLich()
	EndIf
EndFunction
