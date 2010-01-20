-----------------------------------
--	Author: ReaperX
--  Western Moon Gate
--  opens during Full Moon nights from midnight to 3am, see http://wiki.ffxiclopedia.org/wiki/Moongate_Pass .
--  That behavior is not implemented.
--  Also opens when you have the key item Moongate Pass (implemented).

--  Equation of the door is X = -196.14 +.81*Z. This is needed to check whether we are on inside or outside.

---------------------------------------------------
require("scripts/globals/settings");
package.loaded["scripts/zones/RoMaeve/TextIDs"] = nil;
require("scripts/zones/RoMaeve/TextIDs");
---------------------------------------------------

MoongatePass = 0x1E5;

function onTrigger(player,npc)
X = player:getXPos();
Z = player:getZPos();
if (X < -196.14 +.81*Z) or (player:hasKeyItem(MoongatePass) == 1) then -- we are on the inside of the moon gate.
  npc:setState(20);
else
	player:specialMessage(1128); -- "The door is sealed." (unverified, could be "The Door is locked".)-
end;
end; 