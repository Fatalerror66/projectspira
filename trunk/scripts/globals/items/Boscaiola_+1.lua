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
--	MP +40
--	HP +18% (Cap: 125@694 Base HP)
--	Store TP +6
-----------------------------------------

require("scripts/globals/settings");

function OnUseItem(user,target,item)
	item:setMsg(0,0);
	item:setAnimation(24);

	effect = user:getStatusEffect(EFFECT_FOOD);

	if (effect ~= nil) then --Already has food
		item:dontRemove();
		item:setAnimation(55);
	else
		user:addStatusEffect(EFFECT_FOOD,5201,0,3600); --Adds the "has food" effect.
		user:addStatusEffect(5201,1,0,3600); --Adds effects specific to this food.
	end
end;
