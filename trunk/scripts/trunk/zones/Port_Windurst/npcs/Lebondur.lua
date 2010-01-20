-----------------------------------
--	Author: Tenjou
--	VOLLBOW REGIONAL MERCHANT: Lebondur
--	Only sells when Windurst controls Vollbow.
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
vollbow = 2; --getRegionOwner(17);
if (vollbow ~= 2) then 
	player:showText(npc,2646);
else
	player:showText(npc,2645);
--Open shop!!
shop = player:createShop(2);
	--Total stock cuts off after 16 items.  If you add more than that the extras won't display.

	stock1 = {0x27c,119, --Chamomile
			0x360,88, --Fish Scales
			0x3a8,14, --Rock Salt
			0x582,1656} --Sweet William
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