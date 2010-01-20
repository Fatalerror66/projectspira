-- PACKET TYPE 0x36
-- Basic print function to display Text ID of event being played
require("scripts/packets/common");

function OnIncomingPacket(packet) 
	zone = 0xe8 --getZone() function needed to auto acquire zone ID
	print("Text ID: ",packet:getShortAt(0x0a));
	print(getNPCName(packet:getIntAt(0x04)))
	name = getNPCName(packet:getIntAt(0x04))
	io.output(io.open(name .. ".lua","w+"))
	io.write("-- Auto-Generated Script from FFXImonV3 \n-- By: Mana \n--------------------------------------------------------------------- \n-- onTrade Action \n--------------------------------------------------------------------- \nfunction onTrade(player,npc,trade) \n")
	if zone >= 0xe6 and zone <= 0xe8 then
		io.write("-- DO NOT DELETE !!! \n-- All sandy NPCs not directly related to Flyers for Regine quest must have this conditional trade script. \n-- it is just a conditional line to say the NPC refused to accept the flyer. \n	if trade:hasItemQty(532,1) == true and player:getQuestStatus(0,16) == 1 then \n		player:specialMessage(")
		if zone == 0xe7 then
			io.write("1767")
		elseif zone == 0xe6 then
			io.write("1488")
		elseif zone == 0xe8 then
			io.write("663")
		end
		io.write(") \n	end \n")
	end
	io.write("end; \n--------------------------------------------------------------------- \n-- onTrigger Action \n--------------------------------------------------------------------- \nfunction onTrigger(player,npc) \nplayer:showText(npc,",packet:getShortAt(0x0a),") \nend; \n")
	io.close()
end;