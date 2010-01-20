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
package.loaded["scripts/zones/Crawlers_Nest/TextIDs"] = nil;
require("scripts/zones/Crawlers_Nest/TextIDs");
-------------------------------------------
-- Initialization variables
-------------------------------------------
   treasureLVL = 61;
		minLVL = 51;
       zoneKey = 0x415; -- 1045
-- Loot
  treasureGilArray = {0.563,6040,11880};
 treasureGemsArray = {0.187,Aquamarine,Zircon,Chrysoberyl,Painite,Jadeite,Sunstone};
treasureItemsArray = {0.25,HiReraiser};

--     AF related
     OldGauntlets = 0xD2;
   ChoralRoundlet = 0x3621;
     FightessMask = 0x30DF;
HealersPantaloons = 0x3788;	
   HuntersBraccae = 0x3790;
   
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
	brdhead = 0;
	warhead = 0;
	whmlegs = 0;
	rnglegs = 0;

	-- Checking if you can get the old gauntlets for MNK and BST AF quests
	if    (player:getQuestStatus(3,45) == 1 and not(player:hasKeyItem(OldGauntlets) == 1)) then     -- MNK old gauntlets
		og = 1;
	elseif(player:getQuestStatus(3,52) == 1 and not(player:hasKeyItem(OldGauntlets) == 1)) then     -- BST old gauntlets
		og = 1;
	end
	-- Checking if you can get AF item after starting AF2 quests
	if player:getVar("KNOWS_ABOUT_BORGHERTZ") == 1 then
		if    (player:getQuestStatus(3,64) >= 1 and player:getMainJob() == 10 and not(player:hasItem(ChoralRoundlet) == 1)) then     -- BRD has completed AF2
			brdhead = 1;
		elseif(player:getQuestStatus(1,55) >= 1 and player:getMainJob() == 1 and not(player:hasItem(FightessMask) == 1)) then        -- WAR has completed AF2
			warhead = 1;
		elseif(player:getQuestStatus(0,88) >= 1 and player:getMainJob() == 3 and not(player:hasItem(HealersPantaloons) == 1)) then   -- WHM has completed AF2
			whmlegs = 1;
		elseif(player:getQuestStatus(2,73) >= 1 and player:getMainJob() == 11 and not(player:hasItem(HuntersBraccae) == 1)) then     -- RNG has completed AF2
			rnglegs = 1;
		end
	end;
	
if(og == 1 or brdhead == 1 or warhead == 1 or whmlegs == 1 or rnglegs == 1)then
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
			elseif(brdhead == 1) then
				-- BRD AF head
				player:addItem(ChoralRoundlet);
				player:specialMessage(ITEM_OBTAINED,ChoralRoundlet);
			elseif(warhead == 1) then
				-- WAR AF head
				player:addItem(FightessMask);
				player:specialMessage(ITEM_OBTAINED,FightessMask);			
			elseif(whmlegs == 1) then
				-- WHM AF legs
				player:addItem(HealersPantaloons);
				player:specialMessage(ITEM_OBTAINED,HealersPantaloons);
			elseif(rnglegs == 1) then
				-- RNG AF legs
				player:addItem(HuntersBraccae);
				player:specialMessage(ITEM_OBTAINED,HuntersBraccae);
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