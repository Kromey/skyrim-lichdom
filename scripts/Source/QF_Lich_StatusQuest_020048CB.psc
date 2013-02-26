;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname QF_Lich_StatusQuest_020048CB Extends Quest Hidden

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN AUTOCAST TYPE Lich_StatusScript
Quest __temp = self as Quest
Lich_StatusScript kmyQuest = __temp as Lich_StatusScript
;END AUTOCAST
;BEGIN CODE
;Make the player a lich when this quest is started
kmyQuest.MakeLich()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
