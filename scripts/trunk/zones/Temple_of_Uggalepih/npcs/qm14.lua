-----------------------------------
--	Author: ReaperX
--  I don't know for sure what this ??? does or what its message is, but
--  "Something is written here, but you cannot make out the words" seems to fit.
-----------------------------------
package.loaded["scripts/zones/Temple_of_Uggalepih/TextIDs"] = nil;
require("scripts/zones/Temple_of_Uggalepih/TextIDs");

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
player:specialMessage(MISSIONS+2) -- "Something is written here, but you cannot make out the words"
end;
  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
end;