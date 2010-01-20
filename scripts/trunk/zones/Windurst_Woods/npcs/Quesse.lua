-----------------------------------
--	Author: Tenjou
-- 	Quesse
-- 	Stanard merchant.
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
player:showText(npc,1785);


--Open shop!!
shop = player:createShop(2);
--Total stock cuts off after 16 items.  If you add more than that the extras won't display.

--Stock1 is regular stock, available to all.
stock1 = {0x11c1,62, --Gysahl Greens
		0x348,7, --Chocobo Feather
		0x4278,11, --Pet Food Alpha Biscuit
		0x4279,82, --Pet Food Beta Biscuit
		0x45c4,82, --Carrot Broth
		0x45c6,695, --Bug Broth
		0x45c8,126, --Herbal Broth
		0x45ca,695, --Carrion Broth
		0x13d1,50784}  --Chocobo Mazurka
--Stock2 has some restrictions, in this case Windurst 2nd in conquest.
stock2 = {0x439b,5} --Dart
--Stock3 has the most restrictions, in this case Windurst in first and Windurstians only.
stock3 = {0x34d,3881} --Black Chocobo Feather


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