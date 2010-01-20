-----------------------------------
-- Stalagmite
-- Area: Ordelle's Caves @zonepos c1 -51 0 2
-- By: ReaperX
-- PLD AF1 quest "Sharpening the Sword"
-- pops NM Earth Elemental Polevik
-- pop position verified from http://www.youtube.com/watch?v=A7LuC5AU_z8
-----------------------------------
-- onTrigger Action
-----------------------------------
OrdelleWhetstone = 0xE9;
KEYITEM_OBTAINED = 182;

require("scripts/globals/settings");
 
function onTrigger(player,npc)

if (player:getVar("sharpening_the_sword_status") == 2) then
  loc = Zone(0xC1);
	loc:spawnMob("Polevik",-50,0,6,52,player);
	player:setVar("sharpening_the_sword_status",3);
elseif (player:getVar("sharpening_the_sword_status") == 3) then
	player:specialMessage(KEYITEM_OBTAINED,OrdelleWhetstone);
	player:addKeyItem(OrdelleWhetstone);
else
	player:specialMessage(987); -- nothing out of the ordinary
end;
end;