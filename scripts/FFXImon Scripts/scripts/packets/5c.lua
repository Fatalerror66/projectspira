-- PACKET TYPE 0x5C
-- Basic print function to display parameters
require("scripts/packets/common");

function OnIncomingPacket(packet) 
	print(string.format("Param 1: %X",packet:getIntAt(0x04)));
	print(string.format("Param 2: %X",packet:getIntAt(0x08)));
	print(string.format("Param 3: %X",packet:getIntAt(0x0c)));
	print(string.format("Param 4: %X",packet:getIntAt(0x10)));
	print(string.format("Param 5: %X",packet:getIntAt(0x14)));
	print(string.format("Param 6: %X",packet:getIntAt(0x18)));
	print(string.format("Param 7: %X",packet:getIntAt(0x1c)));
	print(string.format("Param 8: %X",packet:getIntAt(0x20)));

	io.output(io.open("5C_Params.txt","w+"))--change w+ to a+ to keep this from overwriting
	io.write("-- Auto-Generated text file from FFXImonV3 \n-- By: Mana \n--------------------------------------------------------------------- \nplayer:updateEvent(",packet:getIntAt(0x04),",",packet:getIntAt(0x08),",",packet:getIntAt(0x0c),",",packet:getIntAt(0x10),",",packet:getIntAt(0x14),",",packet:getIntAt(0x18),",",packet:getIntAt(0x1c),",",packet:getIntAt(0x20),") \n--Finish \n--------------------------------------------------------------------- \n")
	io.close()
end;