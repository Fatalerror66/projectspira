--------------------------------------
--	Author: Tenjou
--	Dispel
-- 	Removes one beneficial magical effect from target.
--	http://wiki.ffxiclopedia.org/wiki/Category:Status_Effects
--------------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/combat");

function OnSpellCast(caster,target,spell)
	spell:setMsg(0); --This message is hardcoded.
	target:dispel();
	target:updateEnmity(caster,320,320);
end;