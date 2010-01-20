-----------------------------------
--	Author: ReaperX
-- 	??? In Sauromugue Champaign
-- 	For THF AF2 quest
-----------------------------------

require("scripts/globals/settings");
package.loaded["scripts/zones/Sauromugue_Champaign/TextIDs"] = nil;
require("scripts/zones/Sauromugue_Champaign/TextIDs");

FirstForgedEnvelope = 0xBB;
FirstSignedForgedEnvelope = 0xBD;

Grapnel = 0x4442;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
if player:getQuestStatus(2,70) == 1 and player:getVar("THF_AF2_TOWER") == 2 then
	loc = Zone(0x78);
	loc:spawnMob("ClimbpixHighri",194, 32, 205, 194,player:getId());
	player:specialMessage(COMEDOWN);
elseif player:getQuestStatus(2,70) == 2 or player:getVar("THF_AF2_TOWER") == 7 then
	player:specialMessage(COMEDOWN+20); -- "There is no longer any need to climb the tower." (verified on retail)
elseif player:getQuestStatus(2,70) == 1 then
	player:specialMessage(COMEDOWN+19); -- "It is impossible to climb this wall with your bare hands."
else
	player:specialMessage(COMEDOWN+18); -- "There is nothing out of the ordinary here."
end
end; 


-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
if trade:getItemCount() == 1 and trade:hasItemQty(Grapnel,1) then
	gearsum = 0;
	i = 1;
	while (gearsum == 0) and (i<=16) do
		gearsum = gearsum + player:getEquip(i);
		i = i + 1;
	end;
	if (gearsum == 0) then
		trade:isComplete();
		event = Event(2);
		event:setParams(4,Grapnel)
		player:startEvent(event);
	else
		player:specialMessage(COMEDOWN+21,0,Grapnel); -- "You try climbing the wall using the {}, but you are too heavy."
	end;
end;
end; 
  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
if (csid == 2) then
	player:setVar("THF_AF2_TOWER",7); -- 7 indicates player has completed the grappling part of the quest.	
	player:removeKeyItem(FirstForgedEnvelope);
	player:addKeyItem(FirstSignedForgedEnvelope);
	player:specialMessage(KEYITEM_OBTAINED,FirstSignedForgedEnvelope);
end;
end;