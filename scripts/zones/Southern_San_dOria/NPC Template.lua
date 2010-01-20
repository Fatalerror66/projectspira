-----------------------------------
-- Area:
-- By: 
require("scripts/globals/settings");
-----------------------------------
-- OnTrade Action
-----------------------------------
function onTrade(player,npc,trade)
	--print("onTrade")
--	item1 = trade:hasItemQty(itemID,Qty);
--	trade:isComplete();
end; 
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
	npcname = (npc:getName());
	--print("Name",npcname)
	--print("npc",npc)
end;
-----------------------------------
--onEventSelection Action--
-----------------------------------
function onEventSelection(player,csid,option)
	--print("onEventSelection")
	--print("CSID:",csid);
	--print("RESULT:",option);
end;
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
	--print("onEventFinish")
	--print("CSID:",csid);
	--print("RESULT:",option);
end;