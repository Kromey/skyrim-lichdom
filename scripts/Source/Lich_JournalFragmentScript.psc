Scriptname Lich_JournalFragmentScript extends ObjectReference  
{Script to handle quest updates when a fragment of Artun's journal is found and read}

Quest Property Lich01 Auto  
{The research quest}
Bool Property HasBeenRead = False Auto  
{Flag to store whether or not this fragment has been read}

Perk Property PerkToGain Auto
{Perk that reading this fragment grants the player (if any)}
Spell Property SpellToGain Auto
{Spell that reading this fragment grants the player (if any)}
Int Property ObjectiveToShow  Auto 
{Objective that reading this fragment should display} 
Bool Property IsOptional = False Auto
{Flag whether or not this fragment is optional for the quest to advance}

Event OnRead()
	;Only run this if we've never read this book before
	If HasBeenRead == False
		Debug.Notification("This fragment is "+IsOptional)
		;Found a new fragment -- update the quest
		(Lich01 as Lich_ResearchQuestScript).FragmentFound(IsOptional)
		
		Actor Player = Game.GetPlayer()
		
		If PerkToGain != None
			;Have a perk to give to the player -- give it to them
			Player.AddPerk(PerkToGain)
		EndIf
		
		If SpellToGain != None
			;Have a spell for the player -- give it to them
			Player.AddSpell(SpellToGain)
		EndIf
		
		If ObjectiveToShow > 0 && Lich01.IsObjectiveDisplayed(ObjectiveToShow) == False
			;Show the relevant objective
			Lich01.SetObjectiveDisplayed(ObjectiveToShow, True)
		EndIf
		
		;This book's been read now, nothing more to do
		HasBeenRead = True
	Endif
EndEvent

