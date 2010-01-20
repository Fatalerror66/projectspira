-----------------------------------
--	Author: Tenjou
-- 	Ensasa
-- 	Working!
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
player:showText(npc,2235);

--Open shop!!
shop = player:createShop(2);
--Total stock cuts off after 16 items.  If you add more than that the extras won't display.

--Stock1 is regular stock, available to all.
stock1 = {0x43a7,4, --Bone Arrow
		0xda,920, --Earthen Flowerpot
		0x43f4,3, --Little Worm
		0x43f3,9, --Lugworm
		0x762,576, --River Foliage
		0x13c9,283, --Earth Threnody
		0x13c6,644, --Fire Threnody
		0x763,576, --Sea Foliage
		0x5c,905, --Tarutaru Stool
		0x6e,4744}  --White Jar
--Stock2 has some restrictions, in this case Windurst 2nd in conquest.
stock2 = {0x43b8,5, --Crossbow Bolt
		0x43a6,3, --Wooden Arrow
		0x70,456} --Yellow Jar
--Stock3 has the most restrictions, in this case Windurst in first and Windurstians only.
stock3 = {0x68,3881} --Tarutaru Folding Screen


i = 1;
while i <= (table.getn(stock1)-1) do
	--print("ITEM: ",stock1[i]);
	shop:addItem(stock1[i],stock1[i+1]*SHOP_PRICE);
	i = i+2;
	if (i >= table.getn(stock1)) then break; end
end

j = 1;
while j <= (table.getn(stock2)-1) do
	--print("ITEM: ",stock2[j]);
	shop:addItem(stock2[j],stock2[j+1]*SHOP_PRICE);
	j = j+2;
	if (j >= table.getn(stock2)) then break; end
end

if (player:getNation() == 2) then
k = 1;
while k <= (table.getn(stock3)-1) do
	--print("ITEM: ",stock3[k]);
	shop:addItem(stock3[k],stock3[k+1]*SHOP_PRICE);
	k = k+2;
	if (k >= table.getn(stock3)) then break; end
end
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