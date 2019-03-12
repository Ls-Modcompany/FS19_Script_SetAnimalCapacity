-- 
-- setAnimalCapacity
-- 
-- @Interface: --
-- @Author: LS-Modcompany / kevink98
-- @Date: 14.01.2019
-- @Version: 1.1.0.0
-- 
-- @Support: LS-Modcompany
-- 
-- Changelog:
--		
-- 	v1.1.0.0 (14.01.2019):
-- 		- add parameters for all animalTypes
--		
-- 	v1.0.0.0 (09.01.2019):
-- 		- initial fs19 (kevink98)
-- 
-- Notes:
-- 
-- 
-- ToDo:
--
-- 

SetAnimalCapacity = {};
SetAnimalCapacity.parameters = {};

--		Change parameters here:				water		straw		food		foodSpillage	pallets
SetAnimalCapacity.parameters["CHICKEN"] = 	{5000, 		5000, 		5000, 		5000, 		5000};
SetAnimalCapacity.parameters["COW"] = 		{5000, 		5000, 		5000, 		5000, 		5000};
SetAnimalCapacity.parameters["SHEEP"] = 	{5000, 		5000, 		5000, 		5000, 		5000};
SetAnimalCapacity.parameters["PIG"] = 		{5000, 		5000, 		5000, 		5000, 		5000};
SetAnimalCapacity.parameters["HORSE"] = 	{5000, 		5000, 		5000, 		5000, 		5000};

function SetAnimalCapacity:updateAnimalParameters()
    local averageWaterUsagePerDay = 0.0
    local averageStrawUsagePerDay = 0.0
    local averageFoodUsagePerDay = 0.0
    local averageFoodSpillageProductionPerDay = 0.0
    local averagePalletsProductionPerDay = 0.0
    local averageManureProductionPerDay = 0.0
    local averageLiquidManureProductionPerDay = 0.0
    local averageMilkProductionPerDay = 0.0
	
    for _, animal in ipairs(self.animals) do
        local subType = animal:getSubType()
        local input  = subType.input
        local output  = subType.output
        averageWaterUsagePerDay = averageWaterUsagePerDay + input.waterPerDay
        averageStrawUsagePerDay = averageStrawUsagePerDay + input.strawPerDay
        averageFoodUsagePerDay = averageFoodUsagePerDay + input.foodPerDay
        averageFoodSpillageProductionPerDay = averageFoodSpillageProductionPerDay + output.foodSpillagePerDay
        averagePalletsProductionPerDay = averagePalletsProductionPerDay + output.palletsPerDay
        averageManureProductionPerDay = averageManureProductionPerDay + output.manurePerDay
        averageLiquidManureProductionPerDay = averageLiquidManureProductionPerDay + output.liquidManurePerDay
        averageMilkProductionPerDay = averageMilkProductionPerDay + output.milkPerDay
    end
	
    local numAnimals = #self.animals
    averageWaterUsagePerDay = averageWaterUsagePerDay / numAnimals
    averageStrawUsagePerDay = averageStrawUsagePerDay / numAnimals
    averageFoodUsagePerDay = averageFoodUsagePerDay / numAnimals
    averageFoodSpillageProductionPerDay = averageFoodSpillageProductionPerDay / numAnimals
    averagePalletsProductionPerDay = averagePalletsProductionPerDay / numAnimals
    averageManureProductionPerDay = averageManureProductionPerDay / numAnimals
    averageLiquidManureProductionPerDay = averageLiquidManureProductionPerDay / numAnimals
    averageMilkProductionPerDay = averageMilkProductionPerDay / numAnimals
	
    local nbDays = 6.0
    local maxNumAnimals = self.maxNumAnimals
	
    local waterCapacity = SetAnimalCapacity.parameters[self.animalType][1];
    local strawCapacity = SetAnimalCapacity.parameters[self.animalType][2];
    local foodCapacity = SetAnimalCapacity.parameters[self.animalType][3];
    local foodSpillageCapacity = SetAnimalCapacity.parameters[self.animalType][4];
    local palletsCapacity = SetAnimalCapacity.parameters[self.animalType][5];
	
    local manureCapacity = averageManureProductionPerDay * maxNumAnimals
    local liquidManureCapacity =  averageLiquidManureProductionPerDay * maxNumAnimals
    local milkCapacity =  averageMilkProductionPerDay * maxNumAnimals
    
	self.owner:setModuleParameters("water", waterCapacity, averageWaterUsagePerDay)
    self.owner:setModuleParameters("straw", strawCapacity, averageStrawUsagePerDay)
    self.owner:setModuleParameters("food", foodCapacity, averageFoodUsagePerDay)
    self.owner:setModuleParameters("foodSpillage", foodSpillageCapacity, averageFoodSpillageProductionPerDay)
    self.owner:setModuleParameters("pallets", palletsCapacity, averagePalletsProductionPerDay)
    self.owner:setModuleParameters("manure", manureCapacity, averageManureProductionPerDay)
    self.owner:setModuleParameters("liquidManure", liquidManureCapacity, averageLiquidManureProductionPerDay)
    self.owner:setModuleParameters("milk", milkCapacity, averageMilkProductionPerDay)
end

HusbandryModuleAnimal.updateAnimalParameters = Utils.overwrittenFunction(HusbandryModuleAnimal.updateAnimalParameters, SetAnimalCapacity.updateAnimalParameters);