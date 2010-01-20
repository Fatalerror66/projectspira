-- PACKET TYPE 0x0a
-- Basic print function to display zone ID of new area
require("scripts/packets/common");

function OnIncomingPacket(packet) 
	zone = packet:getCharAt(0x30)
	print(string.format("zoneid %X",zone));
end;