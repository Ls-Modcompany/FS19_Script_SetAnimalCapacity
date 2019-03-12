# FS19_Script_SetAnimalCapacity

## General
With this script you can change the capacitys of the animalhusbandries.


## Usage
For use this script you need this in your modDesc.xml:

```
<extraSourceFiles>	
  <sourceFile filename="setAnimalCapacity.lua" /> 
</extraSourceFiles>
```

In the script you can set the values in line 29-34:

```
--		Change parameters here:				       water		straw		  food		foodSpillage	pallets
SetAnimalCapacity.parameters["CHICKEN"] = {5000, 		5000, 		5000, 		5000, 		  5000};
SetAnimalCapacity.parameters["COW"]     = {5000, 		5000, 		5000, 		5000, 		  5000};
SetAnimalCapacity.parameters["SHEEP"]   = {5000, 		5000, 		5000, 		5000, 		  5000};
SetAnimalCapacity.parameters["PIG"]     = {5000, 		5000, 		5000, 		5000, 		  5000};
SetAnimalCapacity.parameters["HORSE"]   = {5000, 		5000, 		5000, 		5000, 		  5000};
```

You have the permission to add and use this script in your map, but in no other mod!
