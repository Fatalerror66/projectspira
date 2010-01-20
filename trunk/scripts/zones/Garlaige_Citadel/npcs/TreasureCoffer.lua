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
package.loaded["scripts/zones/Garlaige_Citadel/TextIDs"] = nil;
require("scripts/zones/Garlaige_Citadel/TextIDs");
-------------------------------------------
-- Initialization variables
-------------------------------------------
   treasureLVL = 54;
		minLVL = 44;
       zoneKey = 0x417; -- 1047
-- Loot
  treasureGilArray = {0.714,5000,10400};
 treasureGemsArray = {0.143,Chrysoberyl,Jadeite,Moonstone};
treasureItemsArray = {0.143,LightGauntlets};

--   AF related
   OldGauntlets = 0xD2;
      BeastHelm = 0x30E5;
 GallantCoronet = 0x30E3;
     HealersCap = 0x361F;
	TempleCrown = 0x30E0;
 WarlocksTights = 0x378A;

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
	bsthead = 0;
	pldhead = 0;
	mnkhead = 0;
	whmhead = 0;
	rdmlegs = 0;

	-- Checking if you can get the old gauntlets for RNG or BLM AF quests
	if    (player:getQuestStatus(3,54) == 1 and not(player:hasKeyItem(OldGauntlets) == 1)) then     -- RNG old gauntlets
		og = 1;
	elseif(player:getQuestStatus(3,47) == 1 and not(player:hasKeyItem(OldGauntlets) == 1)) then  	-- BLM old gauntlets
		og = 1;
	end
	-- Checking if you can get AF item after starting AF2 quest.
	if player:getVar("KNOWS_ABOUT_BORGHERTZ") == 1 then
		if    (player:getQuestStatus(3,61) >= 1 and player:getMainJob() == 9 and not(player:hasItem(BeastHelm) == 1)) then      -- BST has completed AF2
			bsthead = 1;
		elseif(player:getQuestStatus(0,91) >= 1 and player:getMainJob() == 7 and not(player:hasItem(GallantCoronet) == 1)) then -- PLD has completed AF2
			pldhead = 1;
		elseif(player:getQuestStatus(1,52) >= 1 and player:getMainJob() == 2 and not(player:hasItem(TempleCrown) == 1)) then    -- MNK has completed AF2
			mnkhead = 1;
		elseif(player:getQuestStatus(0,88) >= 1 and player:getMainJob() == 3 and not(player:hasItem(HealersCap) == 1)) then     -- WHM has completed AF2
			whmhead = 1;
		elseif(player:getQuestStatus(0,85) >= 1 and player:getMainJob() == 5 and not(player:hasItem(WarlocksTights) == 1)) then -- RDM has completed AF2
			rdmlegs = 1;
		end
	end;

if(og == 1 or bsthead == 1 or pldhead == 1 or mnkhead == 1 or whmhead == 1 or rdmlegs == 1)then
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
			elseif(bsthead == 1) then
				-- BST AF head
				player:addItem(BeastHelm);
				player:specialMessage(ITEM_OBTAINED,BeastHelm);
			elseif(pldhead == 1) then
				-- PLD AF head
				player:addItem(GallantCoronet);
				player:specialMessage(ITEM_OBTAINED,GallantCoronet);
			elseif(mnkhead == 1) then
				-- MNK AF head
				player:addItem(TempleCrown);
				player:specialMessage(ITEM_OBTAINED,TempleCrown);
			elseif(whmhead == 1) then
				-- WHM AF head
				player:addItem(HealersCap);
				player:specialMessage(ITEM_OBTAINED,HealersCap);
			elseif(rdmlegs == 1) then
				-- RDM AF legs
				player:addItem(WarlocksTights);
				player:specialMessage(ITEM_OBTAINED,WarlocksTights);			
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