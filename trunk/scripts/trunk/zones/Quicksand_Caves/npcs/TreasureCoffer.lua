-----------------------------------
--	Author: Almendro
--	Treasure Coffer
--  Info from: 
--      http://wiki.ffxiclopedia.org/wiki/Picking_your_Coffers_and_Chests 
--      http://ffxi.allakhazam.com/db/jobs.html?fjob=10&mid=1086187627165365190&num=150
-----------------------------------
-- Includes
require("scripts/globals/settings");
require("scripts/globals/Treasure");
package.loaded["scripts/zones/Quicksand_Caves/TextIDs"] = nil;
require("scripts/zones/Quicksand_Caves/TextIDs");
-------------------------------------------
-- Initialization variables
-------------------------------------------
   treasureLVL = 55;
		minLVL = 45;
       zoneKey = 0x41E; -- 1054
-- Loot
  treasureGilArray = {0.684,6160,16100};
 treasureGemsArray = {0.316,Chrysoberyl,Painite,Sunstone,Fluorite,Jadeite};
treasureItemsArray = {0,nil};

            Map = 0x1A9;
	
--   AF related
   OldGauntlets = 0xD2;
 MyochinHaidate = 0x3791;
 DrachenGreaves = 0x3716;

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
	
	questItemNeeded = 0;
	samlegs = 0;
	drgfeet = 0;
	-- Checking if you can get AF item after starting AF2
	if player:getVar("KNOWS_ABOUT_BORGHERTZ") == 1 then
		if    (player:getQuestStatus(5,141) >= 1 and player:getMainJob() == 12 and not(player:hasItem(MyochinHaidate) == 1)) then	-- SAM has completed AF2
			samlegs = 1;
		elseif(player:getQuestStatus(0,95) >= 1 and player:getMainJob() == 14 and not(player:hasItem(DrachenGreaves) == 1))then		-- DRG has completed AF2 
			drgfeet = 1;
		end
	end;

	if(samlegs == 1 or drgfeet == 1 or player:hasKeyItem(Map) == 0)then
		questItemNeeded = 1;
	end

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
			-- AF active
			if (player:hasKeyItem(Map) == 0) then
				-- Old Gauntlets
				player:addKeyItem(Map);
				player:specialMessage(KEYITEM_OBTAINED,Map);
			elseif(samlegs == 1) then
				-- SAM AF legs
				player:addItem(MyochinHaidate);
				player:specialMessage(ITEM_OBTAINED,MyochinHaidate);
			elseif(drgfeet == 1) then
				-- DRG AF feet
				player:addItem(DrachenGreaves);
				player:specialMessage(ITEM_OBTAINED,DrachenGreaves);
			else
			    -- Not AF
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
				randomIllusionTime = math.random(COFFER_MIN_ILLUSION_TIME,COFFER_MAX_ILLUSION_TIME);
				randomIllusionTime = math.random(COFFER_MIN_ILLUSION_TIME,COFFER_MAX_ILLUSION_TIME);
				randomIllusionTime = math.random(COFFER_MIN_ILLUSION_TIME,COFFER_MAX_ILLUSION_TIME);
				setGlobalVar("["..player:getZone().."]".."Treasure"..treasure_type,os.time() + randomIllusionTime);
			end
		else
			-- Failed to open the coffer.
			if (success ~= -1 ) then -- success -1 means it failed cause of weakness or illusionTime. Other value means it normally failed to open
				-- Now checking if It is a critical failure
				critfailureroll = math.random();
				critfailureroll = math.random();
				critfailureroll = math.random();
				if (critfailureroll <= 0.1) then -- 10% chance
					zone = Zone(player:getZone());
					zone:spawnMob("Mimic",npc:getXPos(),npc:getYPos(),npc:getZPos(),npc:getRot(),player:getId());
					player:specialMessage(CHEST_MIMIC);
				elseif (critfailureroll >= 0.9) then -- 10% chance
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