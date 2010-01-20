-- Auto-Generated Script from FFXImonV3 
-- By: Mana  
----------------------------------- 
-- onTrade Action 
----------------------------------- 
function onTrade(player,npc,trade) 
 	boncort = player:getVar("boncort")
	sandyQuest16 = player:getQuestStatus(0,16)
	item1 = trade:hasItemQty(532,1);
	if item1 == true then
		if sandyQuest16 == 1 and boncort == 0 then
			player:setVar("boncort",1)
			player:specialMessage(0x8fd)
			player:showText(npc,0x8f9)
			trade:isComplete()
		elseif sandyQuest16 == 1 and boncort == 1 then
			player:specialMessage(0x8fe)
		end
	end 
end; 
----------------------------------- 
-- onTrigger Action 
----------------------------------- 
function onTrigger(player,npc) 
player:showText(npc,1893) 
shop = player:createShop(0); 
shop:addItem(4364,(108*SHOP_PRICE)); 
shop:addItem(4356,(180*SHOP_PRICE)); 
shop:addItem(4376,(108*SHOP_PRICE)); 
shop:addItem(4380,(198*SHOP_PRICE)); 
shop:addItem(4509,(10*SHOP_PRICE)); 
shop:addItem(4423,(270*SHOP_PRICE)); 
shop:addItem(5007,(163*SHOP_PRICE)); 
player:sendShop(shop); 
end; 
