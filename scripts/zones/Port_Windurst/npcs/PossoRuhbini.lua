-----------------------------------
--	Author: Tenjou
--	NORVALLEN REGIONAL MERCHANT: Posso Ruhbini
--	Only sells when Windurst controlls Norvallen.
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
norval = 2; --getRegionOwner(6);
if (norval ~= 2) then 
	player:showText(npc,938);
else
	player:showText(npc,937);
--Open shop!!
shop = player:createShop(2);
	--Total stock cuts off after 16 items.  If you add more than that the extras won't display.

	stock1 = {0x2b0,18, --Arrowwood Log
			0x2ba,87, --Ash Log
			0x26a,25, --Blue Peas
			0x26d,25} --Crying Mustard
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