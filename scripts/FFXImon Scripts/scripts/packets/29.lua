-- PACKET TYPE 0x29
-- SIMPLE MESSAGE PACKET

require("scripts/packets/common");

function OnIncomingPacket(packet) 

	printf(" Packettype = %x \n",packet:getCharAt(0));

end;