-----------------------------------
--	Author: Bababooey
--	Boscaiola +1
--	There are enough mushrooms in this scrumptious pasta to make
--	any moustached plumber jump for joy.
--
--	http://wiki.ffxiclopedia.org/wiki/Boscaiola_%2B1
--
--	60 Minutes, All Races
--	Strength -5
--	Dexterity -2
--	Vitality +2
--	Mind +4
--	MP Recovered while healing +1
--	HP +18% (Cap: 125@694 Base HP)
--	MP +40
--	Store TP +6
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:subtractMod(MOD_STR,5);
	effect:subtractMod(MOD_DEX,2);
	effect:addMod(MOD_VIT,2);
	effect:addMod(MOD_MND,4);
	effect:addMod(MOD_MPHEAL,1);
	effect:addMod(MOD_FOOD_HPP,18);
	effect:addMod(MOD_FOOD_HP_CAP,125);
	effect:addMod(MOD_MP,40);
	effect:addMod(MOD_STORETP,6);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
