--------------------------------------
--	Author: Aurelias
-- 	Erase
-- 	Removes one detrimental magical effect from target party member.
--	http://wiki.ffxiclopedia.org/wiki/Category:Status_Effects
--------------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/combat");

function OnSpellCast(caster,target,spell)
	spell:setMsg(0); --This message is hardcoded.
	target:erase();
	target:updateEnmity(caster,480,1);
end;