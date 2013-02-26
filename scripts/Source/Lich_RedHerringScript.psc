Scriptname Lich_RedHerringScript extends ObjectReference  

GlobalVariable Property Lich_FragmentRedHerringFound  Auto  

Event OnRead()
	Lich_FragmentRedHerringFound.Value = 1 ;The "red herring" has been found
	Debug.Notification("RedHerringFound.Value: "+Lich_FragmentRedHerringFound.Value)
EndEvent
