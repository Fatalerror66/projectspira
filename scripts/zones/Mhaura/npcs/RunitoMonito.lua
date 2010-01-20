-----------------------------------
--	Author: Tenjou
--	Runito-Monito
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
stock1 = {0x4015,106, --Cat Bagnakhs
		0x4017,1554, --Brass Bagnakhs
		0x4041,855, --Brass Dagger
		0x42a3,92, --Bronze Rod
		0x42b9,634, --Brass Rod
		0x4093,3601, --Brass Xiphos
		0x40c7,2502, --Claymore
		0x4140,618, --Butterfly Axe
		0x439b,9, --Dart
		0x43a6,3, --Wooden Arrow
		0x43a7,4, --Bone Arrow
		0x43b8,5} --Crossbow Bolts

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