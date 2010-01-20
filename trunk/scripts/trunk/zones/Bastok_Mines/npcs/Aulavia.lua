-----------------------------------
--	Author: Caspian
--  Vollbow Regional Shop: Aulavia
-- 	Only sells when Bastok controlls Vollbow
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)
	npcname = npc:getName();
	npcid = npc:getId();
	--print("Name:",npcname);
	--print("NPC ID:",npcid);
	-----------------------------------
	-- Dialogues,cutscenes,etc. go below.
	-----------------------------------
	Fauregandi = 1; --getRegionOwner(17);
	if (Fauregandi ~= 1) then 
		player:showText(npc,1549);
	else
		player:showText(npc,1548);
		
		shop = player:createShop(2);--Open shop!!
		--Total stock cuts off after 16 items.  If you add more than that the extras won't display.

		stock1 = {0x27C,117, --Chamomile
				0x360,86, --Fish Scales
				0x3A8,14,--Rock Salt
				0x582,1620} --Sweet William
		i = 1;
	
		while i <= (table.getn(stock1)-1) do
			--print("ITEM: ",stock1[i]);
			shop:addItem(stock1[i],stock1[i+1]*SHOP_PRICE);
			i = i+2;
			if (i >= table.getn(stock1)) then break; end
		end

		player:sendShop(shop);	
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
	--print("CSID:",csid);
	--print("RESULT:",option);
end;