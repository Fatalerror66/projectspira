-----------------------------------
--	Author: Tenjou
-- 	ZULKHEIM REGIONAL MERCHANT: Bin Stejihna
-- 	Only sells when Windurst controls Zulkheim.
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
zulkheim = 2; --getRegionOwner(5);
if (zulkheim ~= 2) then 
	player:showText(npc,1800);
else
	player:showText(npc,1799);
--Open shop!!
shop = player:createShop(2);
	--Total stock cuts off after 16 items.  If you add more than that the extras won't display.

	stock1 = {0x26e,43, --Dried Marjoram
			0x1114,43, --Giant Sheep Meat
			0x110e,21, --La Theine Cabbage
			0x263,36, --Rye Flour
			0x262,54, --San d'Oria Flour
			0x111a,54, --Selbina Milk
			0x730,1800} --Semolina
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