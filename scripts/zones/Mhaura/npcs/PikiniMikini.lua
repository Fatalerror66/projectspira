-----------------------------------
--	Author: Tenjou
--	Pikini-Mikini
--	Standard Merchant
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
player:showText(npc,590);

--Open shop.
shop = player:createShop(2);
--Total stock cuts off after 16 items.  If you add more than that the extras won't display.
stock1 = {0x1036,2335, --Eye Drops
		0x1034,284, --Antidote
		0x1037,720, --Echo Drops
		0x1010,819, --Potion
		0x119d,10, --Distilled Water
		0x43f3,9, --Lugworm
		0x3fd,450, --Hatchet
		0x1118,108, --Meat Jerky
		0x14b3,133, --Salsa
		0x126c,3888, --Regen
		0x126e,7047, --Regen II
		0x1311,10080} --Sleepga

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