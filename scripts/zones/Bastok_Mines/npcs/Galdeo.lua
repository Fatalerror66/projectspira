-----------------------------------
--	Author: Caspian
--  Li'Telor Regional Shop: Galdeo
-- 	Only sells when Bastok controlls Li'Telor
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
	LiTelor = 1; --getRegionOwner(13);
	if (LiTelor ~= 1) then 
		player:showText(npc,903);
	else
		player:showText(npc,1547);
		
		shop = player:createShop(2);--Open shop!!
		--Total stock cuts off after 16 items.  If you add more than that the extras won't display.

		stock1 = {0x26F,117, --Bay Leaves
				0x103A,6300} --Holy Water
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