local ObjectManager = require("managers.object.object_manager")

pvp = ScreenPlay:new {
  numberOfActs = 1,
    questString = "pvp",
    states = {onleave = 1, overt = 2},
    questdata = Object:new {
      activePlayerName = "initial",
      }
}
  
registerScreenPlay("pvp", true)
  
function pvp:start()
      self:spawnActiveAreas()
      self:spawnSceneObjects()
      self:spawnMobiles()
end

function pvp:spawnSceneObjects()
  spawnSceneObject("jakku", "object/static/particle/particle_distant_ships_dogfight_tb_vs_bw.iff", -6021, 75, 5514, 0, math.rad(30) )
  spawnSceneObject("jakku", "object/static/particle/particle_distant_ships_dogfight_tb_vs_bw_2.iff", -6201, 75, 5654, 0, math.rad(-52) )
  spawnSceneObject("jakku", "object/static/particle/particle_distant_ships_dogfight_tb_vs_bw_3.iff", -6345, 75, 5753, 0, math.rad(34) )  
  spawnSceneObject("jakku", "object/static/particle/particle_distant_ships_dogfight_tb_vs_bw_3.iff", -5925, 75, 6181, 0, math.rad(-140) )
  spawnSceneObject("jakku", "object/static/particle/particle_distant_ships_dogfight_t_vs_x.iff", -5942, 80, 5715, 0, math.rad(-130) )
  spawnSceneObject("jakku", "object/static/particle/particle_distant_ships_dogfight_t_vs_x_2.iff", -6021, 60, 5819, 0, math.rad(-30) )
  spawnSceneObject("jakku", "object/static/particle/particle_distant_ships_dogfight_t_vs_x_3.iff", -5727, 80, 5518, 0, math.rad(-30) )
  spawnSceneObject("jakku", "object/static/particle/particle_distant_ships_dogfight_ti_vs_aw_3.iff", -6324, 60, 6008, 0, math.rad(102) )
  spawnSceneObject("jakku", "object/static/particle/particle_distant_ships_dogfight_ti_vs_aw_2.iff", -6114, 76, 6065, 0, math.rad(-170) )
  spawnSceneObject("jakku", "object/static/particle/particle_distant_ships_dogfight_ti_vs_aw.iff", -5804, 80, 5720, 0, math.rad(-70) )


end

function pvp:spawnMobiles()
 --   spawnMobile("jakku", "dark_jedi_sentinel",1, 4325,7,-5097,0,0)
end
  
function pvp:spawnActiveAreas()
  local pSpawnArea = spawnSceneObject("jakku", "object/active_area.iff", -5945, 20, 5774, 0, 0, 0, 0, 0)
    
  if (pSpawnArea ~= nil) then
    local activeArea = LuaActiveArea(pSpawnArea)
          activeArea:setCellObjectID(0)
          activeArea:setRadius(512)
          createObserver(ENTEREDAREA, "pvp", "notifySpawnArea", pSpawnArea)
          createObserver(EXITEDAREA, "pvp", "notifySpawnAreaLeave", pSpawnArea)
      end
end
 
--checks if player enters the zone, and what to do with them.
function pvp:notifySpawnArea(pActiveArea, pMovingObject)
  
  if (not SceneObject(pMovingObject):isCreatureObject()) then
    return 0
  end
  
  return ObjectManager.withCreatureObject(pMovingObject, function(player)
    if (player:isAiAgent()) then
      return 0
    end
    
    if (player:isImperial() or player:isRebel()) then     
      player:sendSystemMessage("You have entered the Battle of Jakku!")
    end
    
    
    if (player:isNeutral()) then
      player:sendSystemMessage("You must be a member of a faction to join the Battle of Jakku!")
      player:teleport(4331, 9.1, -5130, 0)
      end
    return 0    
  end)
end


function pvp:notifySpawnAreaLeave(pActiveArea, pMovingObject)
  
  if (not SceneObject(pMovingObject):isCreatureObject()) then
    return 0
  end
  
  return ObjectManager.withCreatureObject(pMovingObject, function(player)
    if (player:isAiAgent()) then
      return 0
    end
    
 -- Could separate out by faction and deliver alternate exit points.  
    if (player:isInCombat()) then
      player:sendSystemMessage("You have deserted in the heat of battle. For this you will be sent to the Arena of Atonement.")
      player:teleport(4444, 7, -5168, 0)
      else
        player:sendSystemMessage("You are now leaving the battle area!")
        player:teleport(4331, 9.1, -5130, 0)
      end           
    return 0
  end)
end


