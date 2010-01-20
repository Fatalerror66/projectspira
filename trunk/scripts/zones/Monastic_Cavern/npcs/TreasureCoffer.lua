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
package.loaded["scripts/zones/Monastic_Cavern/TextIDs"] = nil;
require("scripts/zones/Monastic_Cavern/TextIDs");
-------------------------------------------
-- Initialization variables
-------------------------------------------
   treasureLVL = 67;
		minLVL = 57;
       zoneKey = 0x412; -- 1042
-- Loot
  treasureGilArray = {0.875,7320,14400};
 treasureGemsArray = {0.014,Chrysoberyl,Moonstone,Painite,Sunstone,Fluorite,Jadeite};
treasureItemsArray = {0.111,PhysicalEarring};
		
--   AF related
   OldGauntlets = 0xD2;
 ChaosFlanchard = 0x378D;
  HuntersJerkin = 0x3168;
	WizardsCoat = 0x3161;

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
	og = 0; -- Old gauntlets. Initialize a 0 so you can't get this item yet.
	drklegs = 0;
	rngbody = 0;
	blmbody = 0;
	-- Checking if you can get the old gauntlets for THF AF quest
	if(player:getQuestStatus(3,49) == 1 and not(player:hasKeyItem(OldGauntlets) == 1)) then
		og = 1;
	end
	-- Checking if you can get AF item after starting AF2
	if player:getVar("KNOWS_ABOUT_BORGHERTZ") == 1 then
		if    (player:getQuestStatus(1,58) >= 1 and player:getMainJob() == 8 and not(player:hasItem(ChaosFlanchard) == 1)) then		-- DRK has completed AF2
			drklegs = 1;
		elseif(player:getQuestStatus(2,73) >= 1 and player:getMainJob() == 11 and not(player:hasItem(HuntersJerkin) == 1))then		-- RNG has completed AF2 
			rngbody = 1;
		elseif(player:getQuestStatus(2,67) >= 1 and player:getMainJob() == 4 and not(player:hasItem(WizardsCoat) == 1))then			-- BLM has completed AF2 
			blmbody = 1;
		end
	end;

if(og == 1 or drklegs == 1 or rngbody == 1 or blmbody == 1)then
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
			if (og == 1) then
				-- Old Gauntlets
				player:addKeyItem(OldGauntlets);
				player:specialMessage(KEYITEM_OBTAINED,OldGauntlets);
			elseif(drklegs == 1) then
				-- drk AF legs
				player:addItem(ChaosFlanchard);
				player:specialMessage(ITEM_OBTAINED,ChaosFlanchard);
			elseif(rngbody == 1) then
				-- rng AF body
				player:addItem(HuntersJerkin);
				player:specialMessage(ITEM_OBTAINED,HuntersJerkin);
			elseif(blmbody == 1) then
				-- blm AF body
				player:addItem(WizardsCoat);
				player:specialMessage(ITEM_OBTAINED,WizardsCoat);
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