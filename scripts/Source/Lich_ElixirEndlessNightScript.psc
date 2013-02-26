Scriptname Lich_ElixirEndlessNightScript extends activemagiceffect  
{Script for the Elixir of Endless Night
Note that the Elixir, being not a poison, should never affect anyone but the player, or if it does we may need to revise what we're doing here...}

Float Property deathDelay  Auto  
{How long to wait in bleedout before the victim dies.}

Event OnEffectStart(Actor Target, Actor Caster)
	Bool isEssential = Target.IsEssential() ;To be used later...

	Target.GetActorBase().SetEssential() ;Make the victim essential
	Target.SetNoBleedoutRecovery(True) ;Will not recover from bleedout
	
	Game.DisablePlayerControls(true, true, true, false, true) ;Player can't do anything
	Game.ForceThirdPerson() ;Player watches themself die

	Target.Kill(Caster) ;Send the victim into bleedout...
	Utility.Wait(deathDelay) ;...wait a bit...
	Target.KillEssential(Caster) ;...then kill him for good

	Target.GetActorBase().SetEssential(isEssential) ;Put everything back the way it was
EndEvent
