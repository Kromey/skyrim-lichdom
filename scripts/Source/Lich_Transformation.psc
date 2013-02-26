Scriptname Lich_Transformation extends activemagiceffect  
{The final transformation of the Player into a lich}

; The requirements
Armor Property Phylactery  Auto  
{Charged phylactery}
Potion Property ElixirEndlessNight Auto
{The Elixir of Endless Night}

Sound Property FailureSFX  Auto  
{Sound to Play when the spell fails}
Message Property FailureMSG Auto
{Message when no phylactery}
Message Property FailureMSG3 Auto
{Message when no elixir}

Quest Property Lich01 Auto
{Lich research quest}

Event OnEffectStart(Actor Target, Actor Caster)
	If Caster.GetItemCount(Phylactery) >= 1
		If Caster.GetItemCount(ElixirEndlessNight) >= 1
			; Complete the quest
			Lich01.SetObjectiveCompleted(24, True)
			Lich01.CompleteQuest()
			Lich01.Stop()
			
			; "Transform" the player
			(Lich01 As Lich_ResearchQuestScript).LichTransformation()
		Else
			; Caster had no elixir
			FailureSFX.Play(Caster)
			FailureMSG3.Show()
		EndIf
	else
		; Caster must have had no valid phylactery
		FailureSFX.Play(Caster)
		FailureMSG.Show()
	Endif
EndEvent

