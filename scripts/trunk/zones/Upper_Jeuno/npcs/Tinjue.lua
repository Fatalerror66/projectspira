-----------------------------------
--
--  NPC: Tinjue
--
-----------------------------------

-----------------------------------
-- OnTrade Action
-----------------------------------

function onTrade(player,npc,trade) 

	-- Get all trade items from the stack
	for i=3,table.getn(arg) do
  		--print(i,arg[i])
	end

	--print("trading");

end;

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");

function onTrigger(player,npc) 

	
	npc = (npc:getName()); 
	--print("NPC ID:",npc); 


end;


-----------------------------------
-- More to come...
-----------------------------------