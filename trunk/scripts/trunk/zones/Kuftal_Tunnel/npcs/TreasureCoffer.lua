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
package.loaded["scripts/zones/Kuftal_Tunnel/TextIDs"] = nil;
require("scripts/zones/Kuftal_Tunnel/TextIDs");
-------------------------------------------
-- Initialization variables
-------------------------------------------
   treasureLVL = 65;
		minLVL = 55;
       zoneKey = 0x41B; -- 1051
-- Loot
  treasureGilArray = {0.943,5200,16100};
 treasureGemsArray = {0.057,Aquamarine,Zircon,Chrysoberyl,Moonstone,Painite,Sunstone,Fluorite,Jadeite};
treasureItemsArray = {0,nil};

            Map = 0x1A5;
--  Key items for quests
             LargeTrickBox = 0x1D7;
ChallengetotheRoyalKnights = 0x12A;
	   
--   AF related
   OldGauntlets = 0xD2;

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
	TrueWill = 0; -- NIN AF3 Quest.
	KnightStalker = 0; -- DRG AF3 Quest.
	-- Checking if you can get the old gauntlets for SAM AF quest
	if(player:getQuestStatus(3,55) == 1 and not(player:hasKeyItem(OldGauntlets) == 1)) then
		og = 1;
	end
	-- Checking if you can get key item in order to complete AF quest 3
	if    (player:getQuestStatus(5,145) == 1 and not(player:hasKeyItem(LargeTrickBox) == 1)) then
		-- NIN AF quest 3 active
		TrueWill = 1;
	elseif(player:getQuestStatus(0,96) == 1 and not(player:hasKeyItem(ChallengetotheRoyalKnights) == 1)) then
		-- DRG AF quest 3 active
		KnightStalker = 1;
	end

	if(og == 1 or TrueWill == 1 or KnightStalker == 1 or player:hasKeyItem(Map) == 0)then
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
			-- Map or AF needs
			if(player:hasKeyItem(Map) == 0)then
				player:addKeyItem(Map);
				player:specialMessage(KEYITEM_OBTAINED,Map);
			elseif (og == 1) then
				-- Old Gauntlets
				player:addKeyItem(OldGauntlets);
				player:specialMessage(KEYITEM_OBTAINED,OldGauntlets);
			elseif(TrueWill == 1) then
				-- NIN
				player:addKeyItem(LargeTrickBox);
				player:specialMessage(KEYITEM_OBTAINED,LargeTrickBox);
			elseif(KnightStalker == 1) then
				-- DRG
				player:addKeyItem(ChallengetotheRoyalKnights);
				player:specialMessage(KEYITEM_OBTAINED,ChallengetotheRoyalKnights);
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