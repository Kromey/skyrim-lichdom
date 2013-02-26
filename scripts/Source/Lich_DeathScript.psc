Scriptname Lich_DeathScript extends ReferenceAlias  
{Script to handle the player dying as a lich.}

Quest Property LichStatus Auto
{Lich status tracking quest}

Event OnEnterBleedout()
;Event OnDying(Actor akKiller)
	Debug.Notification("We're dying!")
	
	(LichStatus as Lich_StatusScript).LichDeath()
EndEvent

;Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, \
;  bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
;	Actor MySelf = GetActorRef()
	
	;MySelf.StartDeferredKill()
	;Debug.Notification("Health: "+MySelf.GetAV("health"))
;	If MySelf.GetAV("health") <= 0
;		Debug.Notification("Deferred death!")
;		(LichStatus as Lich_StatusScript).LichDeath()
;	EndIf
	;Utility.Wait(0.75)
	;MySelf.EndDeferredKill()
;EndEvent
