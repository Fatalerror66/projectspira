-----------------------------------
--	Author: Bababooey
--	Tonosama Rice Ball
--	Only the finest ingredients are used in this rice ball.
--
--	http://wiki.ffxiclopedia.org/wiki/Tonosama_Rice_Ball
--
--	30 Minutes, All Races
--	Dexterity +3
--	Vitality +3
--	Charisma +3
--	HP +15
--	Attack +50
--	Defense +30
--	Double Attack+1% (Cap: ???)
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_DEX,3);
	effect:addMod(MOD_VIT,3);
	effect:addMod(MOD_CHR,3);
	effect:addMod(MOD_HP,15);
	effect:addMod(MOD_ATT,50);
	effect:addMod(MOD_DEF,30);
	effect:addMod(MOD_DOUBLE_ATTACK,1);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
