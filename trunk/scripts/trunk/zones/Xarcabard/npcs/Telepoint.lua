-----------------------------------
--	Author: Tenjou,Trin
--  	Vahzl Telepoint
-----------------------------------



-----------------------------------
--onTrigger Action-- (Trin)
-----------------------------------
function onTrigger(player,npc)
	if(player:hasKeyItem(0x163) ~= 1) then
		player:addKeyItem(0x163);
		player:specialMessage(23,0x163);
		--print("Key Item Obtained");
  	else
		player:specialMessage(839);
  	end

end; 
 

-----------------------------------
-- onTrade Action (Tenjou)
-----------------------------------
function onTrade(player,npc,trade)

---------------------------------
--- Trade code here ... ---------------------
---------------------------------

end; 
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
end;