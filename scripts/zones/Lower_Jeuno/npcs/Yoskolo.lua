-----------------------------------
--	Author: Tenjou
-- 	Yoskolo
-- 	Standard Vendor
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
player:showText(npc,557);

--Open shop!!
shop = player:createShop(5);
--Total stock cuts off after 16 items.  If you add more than that the extras won't display.

--Stock1 is regular stock, available to all.
stock1 = {0x119d,10, --Distilled Water
		0x1146,184, --Orange Juice
		0x1147,276, --Apple Juice
		0x1148,1012, --Melon Juice
		0x1159,855, --Grape Juice
		0x115a,368, --Pineapple Juice
		0x11cc,5544, --Icecap Rolanberry
		0x13b6,6380, --Fire Carol
		0x13b7,7440, --Ice Carol
		0x13b8,5940, --Wind Carol
		0x13b9,4600, --Earth Carol
		0x13ba,7920, --Lightning Carol
		0x13bb,5000, --Water Carol
		0x13bc,4200, --Light Carol
		0x13bd,8400}  --Dark Carol

i = 1;
while i <= (table.getn(stock1)-1) do
	--print("ITEM: ",stock1[i]);
	shop:addItem(stock1[i],stock1[i+1]*SHOP_PRICE);
	i = i+2;
	if (i >= table.getn(stock1)) then break; end
end

player:sendShop(shop);
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