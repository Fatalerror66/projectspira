-----------------------------------
--	Author: SharXeniX
-- 	???
-- 	Quest: "Altana's Sorrow"
-----------------------------------
-- Includes
require("scripts/globals/settings");
package.loaded["scripts/zones/Garlaige_Citadel/TextIDs"] = nil;
require("scripts/zones/Garlaige_Citadel/TextIDs");
-----------------------------------
-- Initialization
BucketofDivinePaint = 0xAD;
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
altanasSorrow = player:getQuestStatus(1,49);			--Get Altana's Sorrow quest status
keyBucket = player:hasKeyItem(BucketofDivinePaint);		--Get "Bucket of divine paint" key item status
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
	if(altanasSorrow == 1 and keyBucket == 0)then
		player:addKeyItem(BucketofDivinePaint);						-- Add "Bucket of divine paint" key item
		player:specialMessage(1101,BucketofDivinePaint);            -- You retrieved a <key_item> from beneath the rubble.
	else
		player:specialMessage(1100);
	end
end; 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
end;