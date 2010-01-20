-- PACKET TYPE 0x0E
-- SPAWN PACKET

require("scripts/packets/common");

function OnIncomingPacket(packet) 
if packet:getShortAt(0x08) == 278 then
	print("Name: ",packet:getStringAt(0x34));
	print("NPC ID: ",packet:getIntAt(0x04));
	print("Target ID: ",packet:getShortAt(0x08));
end

	end;