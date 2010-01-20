-----------------------------------
--	Author: Aurelias
--	Screaming Pond
--  Crimson Orb Quest, all works apart from Event IDs and actual Curse
-----------------------------------


-----------------------------------
--onTrigger Action--
-----------------------------------
function onTrigger(player,npc)
	orb = player:getVar("screamingpond")

	if(player:hasKeyItem(0x83) ==1 and orb == 0) then --checks for White Orb
		player:addKeyItem(0x84); -- adds the Pink Orb
		player:removeKeyItem(0x83); --removes the White Orb
		player:specialMessage(909); -- Dipping the orb message
		player:specialMessage(910,0,0,0,132); --Transformation message
		--print("Pink Orb Obtained");
		player:setVar("screamingpond",1) --Tells server that this pond has been 'used',so the player cant spam the same pool

	elseif(player:hasKeyItem(0x84) ==1 and orb == 0) then --checks for Pink Orb
		player:addKeyItem(0x85); -- adds the Red Orb
		player:removeKeyItem(0x84); --removes the Pink Orb
		player:specialMessage(909); -- Dipping the orb message
		player:specialMessage(911,0,0,0,133); --Transformation message
		--print("Red Orb Obtained");
		player:setVar("screamingpond",1)

	elseif(player:hasKeyItem(0x85) ==1 and orb == 0) then --checks for Red Orb
		player:addKeyItem(0x86); -- adds the Blood Orb
		player:removeKeyItem(0x85); --removes the Red Orb
		player:specialMessage(909); -- Dipping the orb message
		player:specialMessage(912,0,0,0,134); --Transformation message
		--print("Blood Orb Obtained");
		player:setVar("screamingpond",1)
	
	elseif(player:hasKeyItem(0x86) ==1 and orb == 0) then --checks for Blood Orb
		player:addKeyItem(0x87); -- adds the Cursed Orb
		player:removeKeyItem(0x86); --removes the Blood Orb
		player:specialMessage(909); -- Dipping the orb message
		player:specialMessage(913,0,0,0,135); --Transformation message
		player:specialMessage(914); -- Cursed message
		--print("Cursed Orb Obtained");
		player:setVar("screamingpond",1)
		player:setVar("wall_of_banishing",3) --The user has the last orb, tells the server this part of the quest is over
	else
		player:specialMessage(907);
	end
end;