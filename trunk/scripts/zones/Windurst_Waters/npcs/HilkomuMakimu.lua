-----------------------------------
--	Author: Tenjou
-- 	Hilkomu-Makimu
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
player:showText(npc,2237);

--Open shop!!
shop = player:createShop(2);
--Total stock cuts off after 16 items.  If you add more than that the extras won't display.

--Stock1 is regular stock, available to all.
stock1 = {0x12a0,5814, --Stone II
		0x12aa,8100, --Water II
		0x129b,12236, --Aero II
		0x1291,16928, --Fire II
		0x1296,22356, --Blizzard II
		0x12a5,28520} --Thunder II
--Stock2 has some restrictions, in this case Windurst 2nd in conquest.
stock2 = {0x12bd,1191, --Stonega
		0x12c7,2143, --Waterga
		0x12b8,4239, --Aeroga
		0x12ae,7181, --Firaga
		0x12b3,10948, --Blizzaga
		0x12c2,15456, --Thundaga
		0x12fb,8280} --Shock Spikes
--Stock3 has the most restrictions, in this case Windurst in first and Windurstians only.
stock3 = {0x12dd,23184, --Poison II
		0x12e7,12880, --Bio II
		0x12e1,4747} --Poisonga

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