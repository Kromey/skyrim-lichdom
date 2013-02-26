;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname QF_Lich_ResearchQuest_020048C8 Extends Quest Hidden

;BEGIN ALIAS PROPERTY LunarForge
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LunarForge Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RedHerring
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RedHerring Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RedHerringOwner
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RedHerringOwner Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Fragment03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Fragment03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RedHerringMapMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RedHerringMapMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Fragment01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Fragment01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Fragment05Owner
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Fragment05Owner Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Fragment02Owner
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Fragment02Owner Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Fragment02Location
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Fragment02Location Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Fragment03MapMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Fragment03MapMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Fragment01MapMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Fragment01MapMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Fragment04MapMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Fragment04MapMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Fragment04Owner
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Fragment04Owner Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Fragment04Location
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Fragment04Location Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Fragment05Location
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Fragment05Location Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Fragment02MapMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Fragment02MapMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Fragment01Location
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Fragment01Location Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Fragment05MapMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Fragment05MapMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RedHerringTest
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RedHerringTest Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Fragment02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Fragment02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Fragment01Owner
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Fragment01Owner Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Fragment03Owner
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Fragment03Owner Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Fragment05
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Fragment05 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Fragment03Location
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Fragment03Location Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RedHerringLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_RedHerringLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Fragment04
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Fragment04 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
Debug.Notification("Starting research quest")

;Temp testing
SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
If !Alias_Fragment01Location.GetLocation()
    Debug.Notification("Location 1 failed to fill")
EndIf

SetObjectiveDisplayed(10, True) ;Display our objective
;TODO: Remove these testing lines
;Alias_Fragment01MapMarker.GetReference().AddToMap(True)
;Alias_Fragment02MapMarker.GetReference().AddToMap(True)
;Alias_Fragment03MapMarker.GetReference().AddToMap(True)
;Alias_Fragment04MapMarker.GetReference().AddToMap(True)
;Alias_Fragment05MapMarker.GetReference().AddToMap(True)
;Alias_RedHerringMapMarker.GetReference().AddToMap(True)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
