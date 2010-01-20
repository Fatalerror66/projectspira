--	Author: ReaperX (Mission 5-1)
--			Aly		(The General's Secret)
-- 	NPC:	Alexius
--	Mission: 5-1
-- 	Quest:  The General's Secret
-----------------------------------
-- Include
require("/scripts/globals/common");
require("/scripts/globals/settings");
require("scripts/globals/rankpoints");

CurillasBottle1 = 0xA4;
CurillasBottle2 = 0xA5;
---------------------------------
-- onZoneIn
---------------------------------
function onZoneIn(player,prevZone)
cs = -1;
if (player:getMissionStatus(1,8) == 1) and (player:getVar("mission_status") == 18) then
  sendTellMsg("[pXI]Altana",player:getName(),"The Horlais Peak BCNM for Bastok 2-3 is not scripted. You have obtained the key item Kindred Crest.");
  player:addKeyItem(KindredCrest);
  player:setVar("mission_status",19);
----------------------------------------------------------------------------
-- The General's Secret
elseif (player:getQuestStatus(0,60) == 1 and player:hasKeyItem(CurillasBottle1)) then
	player:removeKeyItem(CurillasBottle1);		-- unfilled Curilla's Bottle
	player:addKeyItem(CurillasBottle2);			-- filled Curilla's Bottle
-----------------------------------------------------------------------------
end;
return cs;
end;

 