Scriptname Lich_CuriousNoteScript extends ObjectReference  

GlobalVariable Property Lich_FragmentLocsKnown  Auto  

Event OnRead()
	Lich_FragmentLocsKnown.Value = 1 ;Fragment locations are now known
	Debug.Notification("FragmentLocsKnown.Value: "+Lich_FragmentLocsKnown.Value)
EndEvent
