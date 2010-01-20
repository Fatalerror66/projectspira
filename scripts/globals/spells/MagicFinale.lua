--------------------------------------
--	Author: Tenjou
--	Magic Finale
-- 	Removes one beneficial magical effect from target.
--	http://wiki.ffxiclopedia.org/wiki/Category:Status_Effects
--
--	Incomplete: Military Harp increases success rate; however, this song almost always succeeds.
--------------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/combat");

function OnSpellCast(caster,target,spell)
	spell:setMsg(0); --This message is hardcoded.
	target:dispel();
	target:updateEnmity(caster,240,100);
end;