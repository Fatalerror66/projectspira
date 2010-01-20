-----------------------------------
--	Author: Tenjou
-- 	RONFAURE REGIONAL VENDOR: Jourille
-- 	Only sells when Windurst controls Ronfaure.
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
ronfaure = 2; --getRegionOwner(4);
if (ronfaure ~= 2) then 
	player:showText(npc,2254);
else
	player:showText(npc,2253);
--Open shop!!
shop = player:createShop(2);
	--Total stock cuts off after 16 items.  If you add more than that the extras won't display.

	stock1 = {0x27f,110, --Chestnut
			0x1125,29, --San d'Orian Carrot
			0x262,55, --San d'Orian Flour
			0x114f,69} --San d'Orian Grape
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