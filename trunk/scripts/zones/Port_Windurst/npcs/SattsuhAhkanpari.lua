-----------------------------------
--	Author: Tenjou
--	ELSHIMO UPLANDS REGIONAL MERCHANT: Posso Ruhbini
--	Only sells when Windurst controlls Elshimo Uplands.
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
elshimo = 2; --getRegionOwner(19);
if (elshimo ~= 2) then 
	player:showText(npc,2648);
else
	player:showText(npc,2647);
--Open shop!!
shop = player:createShop(2);
	--Total stock cuts off after 16 items.  If you add more than that the extras won't display.

	stock1 = {0x585,1656, --Cattleya
			0x274,239, --Cinnamon
			0x1174,73, --Pamamas
			0x2d1,147} --Rattan Lumber
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