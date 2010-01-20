-----------------------------------
--	Author: ReaperX
--  ??? (currently stationary at 148 4 68.)
--  this is a randomly moving ??? behind the moon gate that gives you the key item Moongate Pass. 
--  message when you already have the moon pass is unverified.
--  Missing: after you obtain the Moon Pass, the ??? has to depop.
--  I think that this ??? is up at all times even though the moon gate only opens during full moon nights.
---------------------------------------------------
require("scripts/globals/settings");
package.loaded["scripts/zones/RoMaeve/TextIDs"] = nil;
require("scripts/zones/RoMaeve/TextIDs");
---------------------------------------------------

MoongatePass = 0x1E5;

function onTrigger(player,npc)
if (player:hasKeyItem(MoongatePass) == 0) then
	player:addKeyItem(MoongatePass);
	player:specialMessage(KEYITEM_OBTAINED, MoongatePass);
else
	player:specialMessage(1131); -- "It is nothing but a pile of rubble."
end;
end; 