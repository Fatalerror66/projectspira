-- PACKET TYPE 0x81
-- Basic print function to display packet information for a type 81 packet
-- remove the "--" to have a line print to the console
require("scripts/packets/common");

function OnIncomingPacket(packet) 
	io.output(io.open("Fishing/fishing.txt","a+"))
	local rodName = nil
	local fishName = nil
	n = 0
--	print("Timer: ",packet:getShortAt(0x02))
--	print("Stamina: ",packet:getShortAt(0x04))
--	print(string.format("Music: %02X",packet:getCharAt(0x0c)))
--	print(string.format("Unknown: %02X",packet:getCharAt(0x0d)))
--	print(string.format("Unknown: %02X",packet:getCharAt(0x0e)))
--	print(string.format("Unknown: %02X",packet:getCharAt(0x0f)))
--	print(string.format("Target ID: %02X",packet:getShortAt(0x06)))
--	print(string.format("Fish ID: %02X",packet:getIntAt(0x08)))
	
	if packet:getIntAt(0x08) == 0x210b1009 then
		fishName = "moat carp"
		rodName = "composite"
	elseif packet:getIntAt(0x08) == 0x1e0d160a then
		fishName = "moat carp"
		rodName = "Bamboo"
	elseif packet:getIntAt(0x08) == 0x1e0c170a then
		fishName = "moat carp"
		rodName = "Yew"
	elseif packet:getIntAt(0x08) == 0x1e0c180a then
		fishName = "moat carp"
		rodName = "willow"
	elseif packet:getIntAt(0x08) == 0x2811110a then
		fishName = "moat carp"
	elseif packet:getIntAt(0x08) == 0x290b100a then
		fishName = "moat carp"
		rodName = "Halcyon"
	elseif packet:getIntAt(0x08) == 0x29101807 then
		fishName = "crayfish"
		rodName = "Halcyon"
	elseif packet:getIntAt(0x08) == 0x2d131807 then
		fishName = "crayfish"
		rodName = "Glass Fiber"
	elseif packet:getIntAt(0x08) == 0x281A1A07 then
		fishName = "crayfish"
	elseif packet:getIntAt(0x08) == 0x1E161E07 then
		fishName = "crayfish"
		rodName = "Hume"
	elseif packet:getIntAt(0x08) == 0x14141F06 then
		fishName = "crayfish"
		rodName = "Mithran"
	elseif packet:getIntAt(0x08) == 0x21101806 then
		fishName = "crayfish"
		rodName = "Composite"
	elseif packet:getIntAt(0x08) == 0x23131806 then
		fishName = "crayfish"
		rodName = "Single Hook"
	elseif packet:getIntAt(0x08) == 0x14142806 then
		fishName = "crayfish"
		rodName = "Clothespole"
	elseif packet:getIntAt(0x08) == 0x2B121807 then
		fishName = "crayfish"
		rodName = "Carbon"
	elseif packet:getIntAt(0x08) == 0x1E151F07 then
		fishName = "crayfish"
		rodName = "Tarutaru"
	elseif packet:getIntAt(0x08) == 0x1E142007 then
		fishName = "crayfish"
		rodName = "Fastwater"
	elseif packet:getIntAt(0x08) == 0x1E132107 then
		fishName = "crayfish"
		rodName = "Bamboo"
	elseif packet:getIntAt(0x08) == 0x1E122207 then
		fishName = "crayfish"
		rodName = "Yew"
	elseif packet:getIntAt(0x08) == 0x1E122407 then
		fishName = "crayfish"
		rodName = "Willow"
	elseif packet:getIntAt(0x08) == 0x210d130c then
		fishName = "tricolor carp"
		rodName = "composite"
	elseif packet:getIntAt(0x08) == 0x1e0e1b0d then
		fishName = "tricolor carp"
		rodName = "Yew"
	elseif packet:getIntAt(0x08) == 0x1e0f1a0d then
		fishName = "tricolor carp"
		rodName = "Bamboo"
	elseif packet:getIntAt(0x08) == 0x1e0e1c0d then
		fishName = "tricolor carp"
		rodName = "willow"
	elseif packet:getIntAt(0x08) == 0x2814140d then
		fishName = "tricolor carp"
	elseif packet:getIntAt(0x08) == 0x290d130d then
		fishName = "tricolor carp"
		rodName = "Halcyon"
	elseif packet:getIntAt(0x08) == 0x210c120e then
		fishName = "gold carp"
		rodName = "composite"
	elseif packet:getIntAt(0x08) == 0x2813130f then
		fishName = "gold carp"
	elseif packet:getIntAt(0x08) == 0x28121209 then
		fishName = "monke-onke"
	elseif packet:getIntAt(0x08) == 0x1e0d1b0f then
		fishName = "gold carp"
		rodName = "willow"
	elseif packet:getIntAt(0x08) == 0x290C120F then
		fishName = "gold carp"
		rodName = "Halcyon"
	elseif packet:getIntAt(0x08) == 0x1e0f190f then
		fishName = "gold carp"
		rodName = "Bamboo"
	elseif packet:getIntAt(0x08) == 0x29101709 then
		fishName = "dark bass"
		rodName = "Halcyon"
	elseif packet:getIntAt(0x08) == 0x290d1303 then
		fishName = "rusty Bucket"
		rodName = "Halcyon"
	elseif packet:getIntAt(0x08) == 0x28191909 then
		fishName = "dark bass"
	elseif packet:getIntAt(0x08) == 0x290E1809 then
		fishName = "black eel"
		rodName = "Halcyon"
	elseif packet:getIntAt(0x08) == 0x1E0F140A then 
		fishName = "moat carp"
		rodName = "Hume"
	elseif packet:getIntAt(0x08) == 0x1E11170D then 
		fishName = "tricolor carp"
		rodName = "Hume"
	elseif packet:getIntAt(0x08) == 0x1E10160F then 
		fishName = "gold carp"
		rodName = "Hume"
	elseif packet:getIntAt(0x08) == 0x140F180C then 
		fishName = "tricolor carp"
		rodName = "Mithran"
	elseif packet:getIntAt(0x08) == 0x140E170E then 
		fishName = "gold carp"
		rodName = "Mithran"
	elseif packet:getIntAt(0x08) == 0x140D1409 then 
		fishName = "moat carp"
		rodName = "Mithran"
	elseif packet:getIntAt(0x08) == 0x230C1009 then 
		fishName = "moat carp"
		rodName = "Single Hook"
	elseif packet:getIntAt(0x08) == 0x140D1B09 then 
		fishName = "moat carp"
		rodName = "Clothespole"
	elseif packet:getIntAt(0x08) == 0x2B0C100A then 
		fishName = "moat carp"
		rodName = "Carbon"
	elseif packet:getIntAt(0x08) == 0x2D0C100A then 
		fishName = "moat carp"
		rodName = "Glass fiber"
	elseif packet:getIntAt(0x08) == 0x1E0E140A then 
		fishName = "moat carp"
		rodName = "Tarutaru"
	elseif packet:getIntAt(0x08) == 0x1E0D150A then 
		fishName = "moat carp"
		rodName = "Fastwater"
	else
		fishName = "???"
		zoneName = "???"
	end
--	Composite rod fish ID - 0x0D000000 = pseudo fish ID (base)
--	Discovered Lu Shang's rod has a pattern
	if packet:getCharAt(0x09) == packet:getCharAt(0x0a) then
		rodName = "Lu Shang's"
	elseif rodName == nil then
		rodName = "???"
	end
	print(fishName)
	print(rodName)
	io.write(string.format("Fish: %s \n",fishName))
	io.write(string.format("Rod: %s \n",rodName))

	io.write(string.format("Timer Hex: %02X \n",packet:getShortAt(0x02)))
	io.write(string.format("Timer Decimal: %i \n",packet:getShortAt(0x02)))
	
	io.write(string.format("Possible stamina %02X \n",packet:getShortAt(0x04)))
	-- variables used for printing the packet contents to the console
	consolePacket = ""
	consolePacket2 = ""
	while n <= ((packet:getCharAt(0x01)*2)-1) do
		while n <= 15 do
			-- first line of the packet
			io.write(string.format("%02X ", packet:getCharAt(n))) -- write to file
			consolePacket = (consolePacket .. string.format("%02X ", packet:getCharAt(n))) -- print to console
			n = (n+1)
		end
		io.write(" \n")
		while n <= ((packet:getCharAt(0x01)*2)-1) do
			-- second line of packet
			io.write(string.format("%02X ", packet:getCharAt(n))) -- write to file
			consolePacket2 = (consolePacket2 .. string.format("%02X ", packet:getCharAt(n))) -- print to console
			n = (n+1)
		end
	end
	io.write(" \n")
	-- prints generated packet data to console
	print("81.Sz.Timer.Stami.TarID.  Fish ID  .Mu.??.??.??")     
	print(consolePacket)
	print(consolePacket2)
	io.close()

	local fishID = string.format("%02X", packet:getIntAt(0x08))
	if fishName == "???" then
		print("Unknown Fish Name/ID")
		local newFunction = assert(io.open("Fishing/81 Function.lua", "a+"),"error opening file 81 Function.lua")
		local newFunctionRead = newFunction:read("*all")
		if (string.find(newFunctionRead,fishID)) == nil then
			newFunction:write(string.format("\n	elseif packet:getIntAt(0x08) == 0x"))
			newFunction:write(string.format("%s then \n",fishID))
			newFunction:write(string.format("		fishName = \n"))
			if rodName == "???" then
				newFunction:write(string.format("		rodName = \n"))
			else
				newFunction:write(string.format("		rodName = %s \n",rodName))
			end
			print("Created script file for unknown Fish ID" )
		else
			print("A custom script already exists for this Fish ID")
		end
		newFunction:close()
	else
		local f = assert(io.open("Fishing/" .. fishName .. ".txt", "a+"),"error opening file " .. fishName .. ".txt")
		local t = f:read("*all")
		if (string.find(t,fishID)) == nil then
			f:write(string.format("\nRod: %s \n",rodName))
			f:write(string.format("Fish ID: %s \n", fishID))
			f:write(string.format("Stamina: %i \n", packet:getShortAt(0x04)))
			print("Added " .. rodName .. " and ID: " .. fishID .. " to " .. fishName .. ".txt" )
		else
			print("Rod/ID combo already exists in " .. fishName .. ".txt")
		end
		f:close()
	end
	
	local staminaLog = assert(io.open("Fishing/Stamina Log/" .. fishName .. ".txt", "a+"),"error opening file " .. fishName .. ".txt")
	staminaLog:write(string.format("Stamina: %i \n", packet:getShortAt(0x04)))
	staminaLog:close()
	
end;