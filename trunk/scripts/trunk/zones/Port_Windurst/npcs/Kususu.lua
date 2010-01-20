-----------------------------------
--	Author: Tenjou
--	Kususu
--	Standard merchant.
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
player:showText(npc,929);

--Open shop!!
shop = player:createShop(2);
--Total stock cuts off after 16 items.  If you add more than that the extras won't display.

--Stock1 is regular stock, available to all.
stock1 = {0x1201,61, --Cure
		0x1207,1363, --Curaga
		0x120e,180, --Poisona
		0x120f,324, --Paralyna
		0x1210,990, --Blindna
		0x1217,82, --Dia
		0x122b,219, --Protect
		0x1230,1584, --Shell
		0x1237,360}  --Aquaveil
--Stock2 has some restrictions, in this case Windurst 2nd in conquest.
stock2 = {0x1202,585, --Cure II
		0x121c,140, --Banish 
		0x1226,140, --Banishga
		0x1235,2097} --Blink 
--Stock3 has the most restrictions, in this case Windurst in first and Windurstians only.
stock3 = {0x1221,1165, --Diaga
		0x1236,7025, --Stoneskin
		0x1238,837} --Slow 

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