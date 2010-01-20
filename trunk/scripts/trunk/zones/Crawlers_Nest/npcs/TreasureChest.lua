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
package.loaded["scripts/zones/Crawlers_Nest/TextIDs"] = nil;
require("scripts/zones/Crawlers_Nest/TextIDs");
-------------------------------------------
-- Initialization variables
-------------------------------------------
    treasureLVL = 53;
		 minLVL = 43;
        zoneKey = 0x410; -- 1040
questItemNeeded = 0;
-- Loot
  treasureGilArray = {0.407,4702,20000};
 treasureGemsArray = {0.135,Ametrine,Garnet,Goshenite,LightOpal,Onyx,Peridot,Sphene,Turquoise};
treasureItemsArray = {0.458,GigantAxe};
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
	   eid = 0;
  CrawlerBlood = 0xC9;
-- Enveloped in Darkness
if(player:getQuestStatus(0,85) == 1 and player:hasKeyItem(CrawlerBlood) == 0 and player:getVar("needs_crawler_blood") == 1) then
	eid = 1;
	questItemNeeded = eid;
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
			if( eid == 1) then
				player:addKeyItem(CrawlerBlood);
				player:specialMessage(KEYITEM_OBTAINED,CrawlerBlood);
			else
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
			end
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















-----------------------------------
--	Author: Almendro
--	Treasure Chest
--  Info from: 
--      http://wiki.ffxiclopedia.org/wiki/Picking_your_Coffers_and_Chests 
--      http://ffxi.allakhazam.com/db/jobs.html?fjob=10&mid=1086187627165365190&num=150
-----------------------------------
-- *07/22/2009 - Almendro 
--     
-- To be done:
--     * Check if the moogle event is active so you cant open chests.
--     * The loot drop rate is based on few people who reported on ffxiclopedia so "more data is needed". 
-- Test:
--     Zone C5 -15 0 244
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/ChestLoot");
package.loaded["scripts/zones/Crawlers_Nest/TextIDs"] = nil;
require("scripts/zones/Crawlers_Nest/TextIDs");

     ChestLvl = 53;
        minlv = 43;

-------------------------------------------
-- Keys
-------------------------------------------
     NestChestKey = 0x410; -- 1040
	  skeletonKey = 0x45B; -- 1115
        livingKey = 0x3FF; -- 1023
         thftools = 0x3FE; -- 1022
  
 skSuccessIncrement = 0.2
 lkSuccessIncrement = 0.15
ttkSuccessIncrement = 0.1

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
player:specialMessage(CHEST_LOCKED,NestChestKey);
end;
 
-----------------------------------
-- onTrade Action--
-----------------------------------
function onTrade(player,npc,trade)
count = trade:getItemCount();
  key = trade:hasItemQty(NestChestKey,1);
   sk = trade:hasItemQty(skeletonKey,1);
   lk = trade:hasItemQty(livingKey,1);
  ttk = trade:hasItemQty(thftools,1);
  gil = trade:getGil();
  eid = 0;
  CrawlerBlood = 0xC9;
-- Enveloped in Darkness 
-- third condition added by ReaperX so player will only obtain key item after talking to Curilla again
if(player:getQuestStatus(0,85) == 1 and player:hasKeyItem(CrawlerBlood) == 0) and (player:getVar("needs_crawler_blood") == 1) then
 eid = 1
end

if ((key or sk or lk or ttk) and count and gil == 0) then  -- Player traded a key and zero gil.
	weak = player:getVar("weakenedByCofferTill");          -- This a temporal solution till setPlayerStatus() function is implemented.          
	illu  = getGlobalVar("TreasureChestCrawlersNest");        -- SE impleted this in order to prevent coffer farming. Noone in the same area can open more than 1 coffer per hour except for AF and maps.
	if(os.time() <= weak) then
		player:specialMessage(CHEST_WEAK);
		success = -1;
	elseif( illu > os.time() and eid == 0) then
		player:specialMessage(CHEST_ILLUSION);
		-- here should be a function in order to depop the coffer and pop the coffer in another location after 5 minutes.
		success = -2; -- If traded a key or any THF tool it won't be wasted if chest is illusion time.
	elseif (key) then 									  -- if player trades a Zone Key success is always 100%
		success = 1; 
	elseif ( player:getMainJob() == 6 and player:getMainLvl() >= minlv ) then -- if player is THF with level higher or equal than minimun lv for coffer
		if    (ttk) then
			success = (player:getMainLvl()/ChestLvl) - 0.50 + ttkSuccessIncrement;
		elseif(lk) then
			success = (player:getMainLvl()/ChestLvl) - 0.50 + lkSuccessIncrement;
		elseif(sk) then
			success = (player:getMainLvl()/ChestLvl) - 0.50 + skSuccessIncrement;
		end
	else
		-- Player is not THF (as main job) or doesn't haven enough level to open the coffer
		player:specialMessage(CHEST_FAIL,1,1,1);
		success = -1;
	end
	if(not(success == -2)) then
		diceroll = math.random();
		trade:isComplete();
		if (diceroll <= success) then
		-- Succeded to open the coffer
			player:specialMessage(CHEST_UNLOCKED);
			if(eid == 1) then
				player:addKeyItem(CrawlerBlood);
				player:specialMessage(KEYITEM_OBTAINED,CrawlerBlood);
				player:setVar("needs_crawler_blood",0) -- cleanup
			else
				setGlobalVar("TreasureChestCrawlersNest",os.time() + math.random(CHEST_MIN_ILLUSION_TIME,CHEST_MAX_ILLUSION_TIME));
				local loot = chestLoot(player:getZone());
				--print("loot array: "); -- debug
				--print("[1]", loot[1]); -- debug
				--print("[2]", loot[2]); -- debug
				if (loot[1]=="gil") then
					player:addGil(loot[2]);
					player:specialMessage(GIL_OBTAINED,loot[2]);
				else
					-- Item
					player:addItem(loot[2]);
					player:specialMessage(ITEM_OBTAINED,loot[2]);
				end
			end
		else
		-- Failed to open the coffer.
			if (success ~= -1 ) then -- success -1 means it failed cause of weakness or illusionTime. Other value means it normally failed to open
				-- Now checking if It is a critical failure
				critfailureroll = math.random();
				--print("roll for critical failure",critfailureroll); -- debug
				if (critfailureroll<=0.2) then -- 20% chance
					--print("critical failure:Player is weakened");   -- debug
					-- Here would go a function for setting weakness status to the player for a duration from 5 minutes to 1 hour
					player:setVar("weakenedByCofferTill",os.time() + math.random(300,3600));			
					player:specialMessage(CHEST_TRAP);
				else
					player:specialMessage(CHEST_FAIL,1,1,1);
				end
			end
		end
	end -- traded a key during illusion time you key is not wasted.
end -- traded a key
end;