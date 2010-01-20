-----------------------------------
--	Author: Bababooey
--	Nero di Seppia +1
--	More squid ink means more squid flavor!
--
--	http://wiki.ffxiclopedia.org/wiki/Nero_di_Seppia_%2B1
--
--	60 Minutes, All Races
--	Dexterity +3
--	Agility -1
--	Vitality +2
--	Mind -2
--	Charisma -1
--	HP +17% (Cap: 140@823 Base HP)
--	Store TP +6
--	Double Attack+1% (Cap: ???)
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_DEX,3);
	effect:subtractMod(MOD_AGI,1);
	effect:addMod(MOD_VIT,2);
	effect:subtractMod(MOD_MND,2);
	effect:subtractMod(MOD_CHR,1);
	effect:addMod(MOD_FOOD_HPP,17);
	effect:addMod(MOD_FOOD_HP_CAP,140);
	effect:addMod(MOD_STORETP,6);
	effect:addMod(MOD_DOUBLE_ATTACK,1);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;

