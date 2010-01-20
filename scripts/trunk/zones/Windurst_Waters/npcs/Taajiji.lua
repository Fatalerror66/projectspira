-----------------------------------
--	Author: Tenjou
-- 	Taajiji
-- 	Standard Merchant.
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
player:showText(npc,2242);

--Open shop!!
shop = player:createShop(2);
--Total stock cuts off after 16 items.  If you add more than that the extras won't display.

--Stock1 is regular stock, available to all.
stock1 = {0x119a,5216, --Mutton Tortilla
		0x1138,128, --Tortilla
		0x118c,552, --Puls
		0x1151,2387, --Dhalmel Stew
		0x119d,10, --Distilled Water
		0x118d,184, --Windurstian Tea
		0x11cb,1711} --Windurst Salad
--Stock2 has some restrictions, in this case Windurst 2nd in conquest.
stock2 = {0x1158,6064, --Whitefish Stew
		0x11dc,1669, --Beaugreen Sautee
		0x1146,184, --Orange Juice
		0x1156,1324} --Dhalmel Steak
--Stock3 has the most restrictions, in this case Windurst in first and Windurstians only.
stock3 = {0x113b,756, --Dhalmel Pie
		0x1152,5050, --Mushroom Risotto
		0x11ca,12762, --Shallops Tropicale
		0x1129,984} --Orange Kuchen

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