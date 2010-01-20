-----------------------------------
--	Author: Tenjou
-- 	Shohrun-Tuhrun
-- 	Standard merchant.
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
player:showText(npc,2238);

--Open shop!!
shop = player:createShop(2);
--Total stock cuts off after 16 items.  If you add more than that the extras won't display.

--Stock1 is regular stock, available to all.
stock1 = {0x1203,3261, --Cure III
		0x122e,78200, --Protect IV
		0x1280,74520, --Protectra IV
		0x1304,64400} --Dispel
--Stock2 has some restrictions, in this case Windurst 2nd in conquest.
stock2 = {0x120c,5178, --Raise
		0x1218,10080, --Dia II
		0x121d,8100, --Banish II
		0x122c,6366, --Protect II
		0x1231,15840, --Shell II
		0x1264,4644, --Enfire
		0x1265,3688, --Enblizzard
		0x1266,2250, --Enaero
		0x1267,1827, --Enstone
		0x1268,1363, --Enthunder
		0x1269,6366} --Enwater
--Stock3 has the most restrictions, in this case Windurst in first and Windurstians only.
stock3 = {0x1239,18000} --Haste

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