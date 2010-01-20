-----------------------------------
--	Author: Tenjou
--	Kumama
--	Standard Merchant.  Her prices are based on level 1 fame :/
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
player:showText(npc,935);

--Open shop!!
shop = player:createShop(2);
--Total stock cuts off after 16 items.  If you add more than that the extras won't display.

--Stock1 is regular stock, available to all.
stock1 = {0x3230,2194*.83, --Brais
		0x3238,199*.83, --Slops
		0x32b0,1466*.83, --Gaiters
		0x32b8,128*.83, --Ash Clogs
		0x3001,124*.83}  --Lauan Shield
--Stock2 has some restrictions, in this case Windurst 2nd in conquest.
stock2 = {0x3218,557*.83, --Leather Trousers
		0x3231,1232*.83, --Cotton Brais
		0x3298,349*.83, --Leather Highboots
		0x32c0,629*.83, --Solea
		0x32b1,7498*.83, --Cotton Gaiters
		0x3002,629*.83}  --Maple Shield
--Stock3 has the most restrictions, in this case Windurst in first and Windurstians only.
stock3 = {0x3239,2620*.83, --Linen Slops
		0x32b9,1690*.83, --Holly Clogs
		0x3004,5179*.83}  --Mahogany Shield

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