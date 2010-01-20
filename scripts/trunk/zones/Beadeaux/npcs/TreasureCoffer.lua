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
package.loaded["scripts/zones/Beadeaux/TextIDs"] = nil;
require("scripts/zones/Beadeaux/TextIDs");
-------------------------------------------
-- Initialization variables
-------------------------------------------
   treasureLVL = 67;
		minLVL = 57;
       zoneKey = 0x413; -- 1043
-- Loot
  treasureGilArray = {0.429,4700,25000};
 treasureGemsArray = {0.115,Aquamarine,Zircon,Chrysoberyl,Moonstone,Painite,Peridot,Sunstone};
treasureItemsArray = {0.357,BurstScroll};

-- AF related
   OldGauntlets = 0xD2;
  BeastJackcoat = 0x3166;
GallantBreeches = 0x378C;
   TempleCyclas = 0x315F;

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
	bstbody = 0;
	pldlegs = 0;
	mnkbody = 0;
	-- Checking if you can get the old gauntlets for WHM AF quest
	if(player:getQuestStatus(3,46) == 1 and player:hasKeyItem(OldGauntlets) == 0) then     -- WHM old gauntlets
		og = 1;
	end
	-- Checking if you can get AF item after starting AF2 quest
	if player:getVar("KNOWS_ABOUT_BORGHERTZ") == 1 then
		if(player:getQuestStatus(3,61) >= 1 and player:getMainJob() == 9 and player:hasItem(BeastJackcoat) == 0) then       -- BST has completed AF2
			bstbody = 1;
		elseif(player:getQuestStatus(0,91) >= 1 and player:getMainJob() == 7 and player:hasItem(GallantBreeches) == 0) then -- PLD has completed AF2
			pldlegs = 1;
		elseif(player:getQuestStatus(1,52) >= 1 and player:getMainJob() == 2 and player:hasItem(TempleCyclas) == 0) then    -- MNK has completed AF2
			mnkbody = 1;
		end
	end;

if(og == 1 or bstbody == 1 or pldlegs == 1 or mnkbody == 1)then
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
			elseif(bstbody == 1) then
				-- BST AF body
				player:addItem(BeastJackcoat);
				player:specialMessage(ITEM_OBTAINED,BeastJackcoat);
			elseif(pldlegs == 1) then
				-- PLD AF legs
				player:addItem(GallantBreeches);
				player:specialMessage(ITEM_OBTAINED,GallantBreeches);
			elseif(mnkbody == 1) then
				-- MNK AF body
				player:addItem(TempleCyclas);
				player:specialMessage(ITEM_OBTAINED,TempleCyclas);
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