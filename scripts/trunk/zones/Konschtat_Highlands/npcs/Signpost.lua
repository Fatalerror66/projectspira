-----------------------------------
--	Author: Almendro
-- 	Signpost
-- 	Involved in "The Signpost Marks the Spot"
-----------------------------------
-- Includes
require("scripts/globals/settings");
package.loaded["scripts/zones/Konschtat_Highlands/TextIDs"] = nil;
require("scripts/zones/Konschtat_Highlands/TextIDs");
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
npcid = npc:getId();
--print("dime que signpost es ",npcid);
TheSignpostMarkstheSpot = player:getQuestStatus(1,22);
Paintingofawindmil = 0x6C;
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
if( npcid == 17220063 )then
	if(TheSignpostMarkstheSpot == 1 and player:hasKeyItem(Paintingofawindmil) == 0)then
		player:specialMessage(921); -- You see something stuck behind the signpost.
		player:addKeyItem(Paintingofawindmil);
		player:specialMessage(KEYITEM_OBTAINED,Paintingofawindmil);
	else
		player:specialMessage(920);
	end
elseif( npcid == 17220061 )then
	player:specialMessage(918);
elseif( npcid == 17220062 )then
	player:specialMessage(919);
end
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
end; 
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
end;