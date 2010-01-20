--------------------------------------
--	Author: Tenjou
-- 	Teleport-Holla
-- 	Teleports qualified party members within area of effect to Holla.
--
--	Although the basic function is accurate, it still appears very buggy.
--------------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/combat");
require("/scripts/globals/spell_definitions");
package.loaded["scripts/globals/teleports"] = nil;
require("scripts/globals/teleports");

function OnSpellCast(caster,target,spell)

--Check for Holla Gate Crystal.
holla = target:hasKeyItem(0x160);
zone = target:getZone();
if (holla == 1 and zone ~= 0x83) then
	--Do it!
	toHolla(target);
	--Adjust message for multiple targets.
	numcheck = spell:getCurrTargNum();
	if (numcheck == 1) then
		spell:setMsg(93);
		--print("target1");
	else
		spell:setMsg(273);
		--print("allies");
	end
else
	spell:setMsg(0);
end

final = 0;
return final;
end;