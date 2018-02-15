# Minecraft Redwood Tree Harvesting Robot Script

## Details

* Author: Paul Armstrong
* Date: May 2017 (but updated and uploaded more recently)
* Progress: 100%

## Demonstration

![animated gif](https://i.imgur.com/PejNyOH.gif)

## Description

This script tells a robot to chop down trees in Minecraft. ComputerCraft is a mod for Minecraft which adds unix terminal-style computers to the game. These computers can run programs in the Lua programming language. The mod includes "turtles" which are mobile computers that can interact with the Minecraft world.

The purpose of this script is to have turtles chop down large redwood trees on their own. Redwood trees are two blocks long, two blocks wide, and hundreds of blocks tall. While cutting down a tree, the turtle must keep track of the height of the tree and must perform occasional refueling. When the turtle returns to the base of the cut down tree, it replants the tree, exchanges resources with a storage system, and then waits for the tree to regrow.

## Usage

To use this script in your ComputerCraft single player or server you will need place down a turtle and turn it on. To put this script onto the turtle you need to put *redwood.lua* into your *minecraft/saves/[Name of your world]/computer/0* folder. After a server restart the turtle should have a file called redwood.

Requirements for the script to work properly:
* First inventory slot contains fuel (ex. charcoal)
* Second inventory slot contains redwood saplings
* There is a chest below the turtle with extra fuel
* There is a chest below and to the left with extra saplings
* There is a chest below and two to the left which will be filled with wood
* There is a 2x2 area of saplings in front of the fuel and saplings chest

## Why

I made this script because I was playing on a Minecraft server with friends and we wanted to have a reliable passive source of wood. There was a lot of trial and error (and turtles lost), but once I had this script working consistently we got more lumber than we would ever need.
