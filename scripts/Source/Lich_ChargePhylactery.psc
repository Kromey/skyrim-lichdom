Scriptname Lich_ChargePhylactery extends ActiveMagicEffect  
{Upgrades a crafted or a repaired phylactery.
A crafted phylactery becomes a charged phylactery, ready for the Ritual of Becoming.
A repaired phylactery becomes a final phylactery, and the player's lich state is restored.}

Armor Property BasePhylactery  Auto  
{The base phylactery}
Armor Property RepairedPhylactery Auto
{Repaired phylactery}
Armor Property PrimedPhylactery  Auto  
{Charged phylactery}

Ingredient Property Heart Auto
{Human heart}

Quest Property LichStatus Auto
{Lich status quest}
Quest Property LichResearch Auto
{Lich research quest}
Quest Property LichRestoration Auto
{Lich restoration quest}

Sound Property FailureSFX  Auto  
{Sound to Play when the spell fails}
Message Property FailureMSG Auto
{Message when no phylactery}
Message Property FailureMSG2 Auto
{Message when no heart}


Event OnEffectStart(Actor akTarget, Actor akCaster)
	ObjectReference Caster = akCaster
	
	;First check that the caster has a heart
	If Caster.GetItemCount(Heart) >= 1
		;Are we repairing a phylactery or making a new one?
		If Caster.GetItemCount(RepairedPhylactery) >= 1
			;Repaired a damaged phylactery
			Caster.RemoveItem(RepairedPhylactery, 1, True)
			Caster.RemoveItem(Heart, 1, True)
			;No need to add the final phylactery, MakeLich() does that for us
			
			;Now restore the player's lich state
			(LichStatus as Lich_StatusScript).MakeLich()
			
			;Complete relevant quest objective
			If LichRestoration.IsRunning()
				LichRestoration.SetObjectiveCompleted(20)
				LichRestoration.CompleteQuest()
			EndIf
		ElseIf Caster.GetItemCount(BasePhylactery) >= 1
			;Charging a new phylactery
			Caster.RemoveItem(BasePhylactery, 1, True)
			Caster.RemoveItem(Heart, 1, True)
			Caster.AddItem(PrimedPhylactery, 1, False)
			
			;Complete relevant quest objective
			If LichResearch.IsRunning()
				LichResearch.SetObjectiveCompleted(21)
			EndIf
		Else
			;Caster must have had no valid phylactery
			FailureSFX.Play(Caster)
			FailureMSG.Show()
		EndIf
	Else
		;Caster had no heart
		FailureSFX.Play(Caster)
		FailureMSG2.Show()
	EndIf
EndEvent

