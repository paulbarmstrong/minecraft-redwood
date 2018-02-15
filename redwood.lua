--[[

	Author: Paul Armstrong
	Date of creation: May 2017
	
	Description:
		This script tells a robot to chop down trees in Minecraft. ComputerCraft
		is a mod for Minecraft which adds terminal-style computers which can run
		programs in the lua programming language. The mod includes "turtles",
		which are mobile computers that can interact with the Minecraft world.
		
		The purpose of this script is to have turtles chop down large redwood
		trees on their own. These trees can be hundreds of blocks high, and are
		two blocks wide and two blocks long. While cutting down a tree, the turtle
		must keep track of the height of the trees and must perform occasional
		refueling. When the turtle returns to the base of the cut down tree, it
		will replant the tree, exchange resources with a storage system, then
		wait for the tree to regrow.

		Information on the turtle API provided by ComputerCraft:
		http://computercraft.info/wiki/Turtle_(API)
]]--


-- Will cause the turtle to perform a 180 degree turn
function halfturn()
	turtle.turnLeft()
	turtle.turnLeft()
end

-- If fuel is below a threshold, turtle will refuel
function fuelCheck()
	turtle.select(1)
	while (turtle.getFuelLevel() < 200) do
		turtle.refuel(1)
	end
end

-- Discard all stacks of the item present in the passed in slot
function discard(slot)
	for (d=1,16) do
		if (d~=slot) then
			turtle.select(d)
			if (turtle.compareTo(slot) == true) then
				turtle.dropDown(64)
			end
		end
	end
end

-- Keep trying to go forward until successful
-- (Ensures that each function call results in 1 forward step)
function go()
	while (turtle.forward() == false) do
		turtle.dig()
	end
end


-- The beginning of the code when executed
-- Loop until I come and manually terminate
while true do
	fuelCheck()
	turtle.select(2)
	
	-- Wait for the tree to grow
	while (turtle.detect() == false) do
		os.sleep(5)
	end
	
	-- Chop the left side of the base of the tree
	turtle.dig()
	turtle.forward()
	turtle.digDown()
	turtle.down()
	turtle.dig()
	turtle.up()
	count = 0
	turtle.dig()
	
	-- While keeping track of the height, chop the left side of the
	-- tree from the bottom up
	while (turtle.detectUp() == true) do
		count = count + 1
		turtle.digUp()
		turtle.up()
		turtle.dig()
	end
	
	-- Turn around and move to the right side
	fuelCheck()
	turtle.turnLeft()
	turtle.dig()
	turtle.forward()
	turtle.turnRight()
	turtle.dig()
	
	-- Using the stored height of the tree, cut down the right side
	-- of the tree
	for (i = 1, count) do
		turtle.digDown()
		turtle.down()
		turtle.dig()
	end

	-- Replant the tree (requires four saplings to be placed in a square)
	fuelCheck()
	turtle.digDown()
	turtle.select(2)
	turtle.placeDown()
	turtle.forward()
	turtle.digDown()
	turtle.placeDown()
	turtle.turnRight()
	turtle.forward()
	turtle.digDown()
	turtle.placeDown()
	turtle.turnRight()
	turtle.forward()
	turtle.digDown()
	turtle.placeDown()
	go()

	-- Exchange wood, fuel, and saplings
	turtle.select(1)
	turtle.suckDown()
	discard(1)
	turtle.turnRight()
	go()
	turtle.select(2)
	turtle.suckDown()
	discard(2)
	go()
	discard(3)
	turtle.select(3)
	turtle.dropDown()
	
	-- Return to waiting location
	halfturn()
	go()
	go()
	turtle.turnLeft()
end

