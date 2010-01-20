-----------------------------------
--	Author: Caspian
--  Valdeaunia Regional Shop: Tibelda
-- 	Only sells when Bastok controlls Valdeaunia
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
	Valdeaunia = 1; --getRegionOwner(13);
	if (Valdeaunia ~= 1) then 
		player:showText(npc,902);
	else
		player:showText(npc,996);
		
		shop = player:createShop(2);--Open shop!!
		--Total stock cuts off after 16 items.  If you add more than that the extras won't display.

		stock1 = {0x111E,28, --Frost Turnip
				0x27E,166} --Sage
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