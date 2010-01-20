-----------------------------------
--	Author: Tenjou
-- 	KUZOTZ REGIONAL VENDOR: Nhobi Zalkia
-- 	Only sells when Windurst controls Kuzotz.
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
kuzotz = 2; --getRegionOwner(16);
if (kuzotz ~= 2) then 
	player:showText(npc,1796);
else
	player:showText(npc,1795);
--Open shop!!
shop = player:createShop(2);
	--Total stock cuts off after 16 items.  If you add more than that the extras won't display.

	stock1 = {0x394,837, --Cactuar Needle
			0x113c,292, --Thundermelon
			0x118b,180} --Watermelon
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