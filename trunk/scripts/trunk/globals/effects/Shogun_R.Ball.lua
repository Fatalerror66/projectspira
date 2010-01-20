-----------------------------------
--	Author: Bababooey
--	Shogun Rice Ball
--	This tonosama rice ball has been made to perfection.
--
--	http://wiki.ffxiclopedia.org/wiki/Shogun_Rice_Ball
--
--	60 Minutes, All Races
--	Dexterity +4
--	Vitality +4
--	Charisma +4
--	HP +20
--	Attack +50
--	Defense +30
--	Double Attack+5% (Cap: ???)
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_DEX,4);
	effect:addMod(MOD_VIT,4);
	effect:addMod(MOD_CHR,4);
	effect:addMod(MOD_HP,20);
	effect:addMod(MOD_ATT,50);
	effect:addMod(MOD_DEF,30);
	effect:addMod(MOD_DOUBLE_ATTACK,5);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;

