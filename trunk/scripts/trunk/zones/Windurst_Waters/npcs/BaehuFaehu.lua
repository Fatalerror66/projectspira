-----------------------------------
--	Author: Tenjou
-- 	SARUTABARUTA REGIONAL VENDOR: Baehu-Faehu
-- 	Only sells when Windurst has control of Sarutabaruta.
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
saruta = 2; --getRegionOwner(9);
if (saruta ~= 2) then 
	player:showText(npc,2246);
else
	player:showText(npc,2245);
--Open shop!!
shop = player:createShop(2);
	--Total stock cuts off after 16 items.  If you add more than that the extras won't display.

	stock1 = {0x115c,22, --Rarab Tail
			0x2b1,33, --Lauan Log
			0x26b,43, --Popoto
			0x1128,29, --Saruta Orange
			0x27b,18} --Windurstian Tea Leaves
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