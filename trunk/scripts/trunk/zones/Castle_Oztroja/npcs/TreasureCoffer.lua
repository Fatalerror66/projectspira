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
package.loaded["scripts/zones/Castle_Oztroja/TextIDs"] = nil;
require("scripts/zones/Castle_Oztroja/TextIDs");
-------------------------------------------
-- Initialization variables
-------------------------------------------
   treasureLVL = 67;
		minLVL = 40;
       zoneKey = 0x414; -- 1044
-- Loot
  treasureGilArray = {0.5,7320,18000};
 treasureGemsArray = {0.25,Aquamarine,Zircon,Chrysoberyl,Moonstone,Painite,Peridot,Sunstone,Fluorite};
treasureItemsArray = {0.25,SafeguardRing};

--   AF related
  ChaosCuirass = 0x3165;
ChoralCannions = 0x378F;
RoguesCulottes = 0x378B;
WarlocksTabard = 0x3162;

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
	drkbody = 0;
	brdlegs = 0;
	thflegs = 0;
	rdmbody = 0;
	-- Checking if you can get AF item after starting AF2
	if player:getVar("KNOWS_ABOUT_BORGHERTZ") == 1 then
		if (player:getQuestStatus(1,58) >= 1 and player:getMainJob() == 8 and not(player:hasItem(ChaosCuirass) == 1)) then     -- DRK has completed AF2
			drkbody = 1;
		elseif (player:getQuestStatus(3,64) >= 1 and player:getMainJob() == 10 and not(player:hasItem(ChoralCannions) == 1)) then  -- BRD has completed AF2
			brdlegs = 1;
		elseif (player:getQuestStatus(2,70) >= 1 and player:getMainJob() == 6 and not(player:hasItem(RoguesCulottes) == 1)) then   -- THF has completed AF2
			thflegs = 1;
		elseif (player:getQuestStatus(0,85) >= 1 and player:getMainJob() == 5 and not(player:hasItem(WarlocksTabard) == 1)) then   -- RDM has completed AF2
			rdmbody = 1;
		end
	end;

	if(drkbody == 1 or brdlegs == 1 or thflegs == 1 or rdmbody == 1)then
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
			if(drkbody == 1) then
				-- DRK AF body
				player:addItem(ChaosCuirass);
				player:specialMessage(ITEM_OBTAINED,ChaosCuirass);
			elseif(brdlegs == 1) then
				-- BRD AF legs
				player:addItem(ChoralCannions);
				player:specialMessage(ITEM_OBTAINED,ChoralCannions);
			elseif(thflegs == 1) then
				-- THF AF legs
				player:addItem(RoguesCulottes);
				player:specialMessage(ITEM_OBTAINED,RoguesCulottes);
			elseif(rdmbody == 1) then
				-- RDM AF body
				player:addItem(WarlocksTabard);
				player:specialMessage(ITEM_OBTAINED,WarlocksTabard);
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