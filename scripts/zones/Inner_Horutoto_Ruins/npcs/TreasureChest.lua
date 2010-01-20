-----------------------------------
--	Author: Almendro
--	Treasure Chest
--  Info from: 
--      http://wiki.ffxiclopedia.org/wiki/Picking_your_Coffers_and_Chests 
--      http://ffxi.allakhazam.com/db/jobs.html?fjob=10&mid=1086187627165365190&num=150
-----------------------------------
-- *07/23/2009 - Almendro 
--     
-- To be done:
--     * Check if the moogle event is active so you cant open chests.
--     * The loot drop rate is based on few people who reported on ffxiclopedia so "more data is needed".
-----------------------------------
-- Includes
require("scripts/globals/settings");
require("scripts/globals/Treasure");
package.loaded["scripts/zones/Inner_Horutoto_Ruins/TextIDs"] = nil;
require("scripts/zones/Inner_Horutoto_Ruins/TextIDs");
-------------------------------------------
-- Initialization variables
-------------------------------------------
    treasureLVL = 18;
		 minLVL = 8;
        zoneKey = 0x405; -- 1029
questItemNeeded = 0;
-- Loot
  treasureGilArray = {0.552,450,900};
 treasureGemsArray = {0.113,Amber,Amethyst,ClearTopaz,LapisLazuli,Tourmaline};
treasureItemsArray = {0.345,MothAxe};
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
	player:specialMessage(CHEST_LOCKED,zoneKey);
end;
 
-----------------------------------
-- onTrade Action--
-----------------------------------
function onTrade(player,npc,trade)
     count = trade:getItemCount();
 keyTraded = trade:hasItemQty(zoneKey,1);
       gil = trade:getGil();
	   
if (( keyTraded or isTHFKey(trade) ) and count == 1 and gil == 0) then  -- Player traded a key and zero gil.
	success_array = openChance(player,npc,trade,treasureLVL,minLVL,questItemNeeded);
	success = success_array[1];
	message_type = success_array[2];
	if(message_type == CHEST_WEAK_AUX)then
		player:specialMessage(CHEST_WEAK);
	elseif(message_type == CHEST_ILLUSION_AUX)then
		player:specialMessage(CHEST_ILLUSION);
	elseif(message_type == CHEST_FAIL_AUX)then
		player:specialMessage(CHEST_FAIL);
	end	
	if(not(success == -2)) then
		diceroll = math.random();
		diceroll = math.random();
		diceroll = math.random();
		trade:isComplete();
		if (diceroll <= success) then
			-- Succeded to open the coffer
			player:specialMessage(CHEST_UNLOCKED);
			local loot = getLoot(treasureGilArray,treasureGemsArray,treasureItemsArray);
			if (loot[1] == "gil") then
				player:addGil(loot[2]);
				player:specialMessage(GIL_OBTAINED,loot[2]);
			else
				-- Item
				player:addItem(loot[2]);
				player:specialMessage(ITEM_OBTAINED,loot[2]);
			end
			if(isCoffer(npc))then
				treasure_type = "Coffer";
			else
				treasure_type = "Chest";
			end
			randomIllusionTime = math.random(CHEST_MIN_ILLUSION_TIME,CHEST_MAX_ILLUSION_TIME);
			randomIllusionTime = math.random(CHEST_MIN_ILLUSION_TIME,CHEST_MAX_ILLUSION_TIME);
			randomIllusionTime = math.random(CHEST_MIN_ILLUSION_TIME,CHEST_MAX_ILLUSION_TIME);
			setGlobalVar("["..player:getZone().."]".."Treasure"..treasure_type,os.time() + randomIllusionTime);
		else
			-- Failed to open the coffer.
			if (success ~= -1 ) then -- success -1 means it failed cause of weakness or illusionTime. Other value means it normally failed to open
				-- Now checking if It is a critical failure
				critfailureroll = math.random();
				critfailureroll = math.random();
				critfailureroll = math.random();
				if (critfailureroll <= 0.2) then -- 20% chance
					randomWeaknessTime = math.random(300,3600);
					randomWeaknessTime = math.random(300,3600);
					randomWeaknessTime = math.random(300,3600);
					weakness = player:getStatusEffect(EFFECT_WEAKNESS);
					if(weakness ~= nil)then
						player:removeStatusType(EFFECT_WEAKNESS);
						player:addStatusEffect(EFFECT_WEAKNESS,2,0,randomWeaknessTime);
					else
						player:addStatusEffect(EFFECT_WEAKNESS,1,0,randomWeaknessTime);
					end		
					player:specialMessage(CHEST_TRAP);
				else
					player:specialMessage(CHEST_FAIL,1,1,1);
				end
			end
		end
	end -- Your key is not wasted
end -- traded a key
end;