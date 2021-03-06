----------------------------------------------------------------------
-- A set of useful code snippets for various projects
-- with the Corona SDK 
-- @author purplepigeon
-- @date 2014-04-18
----------------------------------------------------------------------

-- Convenience function to set the default anchor points
-- for new DisplayObjects
function setDefaultAnchor( x, y ) 
  display.setDefault( "anchorX", x )
  display.setDefault( "anchorY", y )    
end

-- Standard touch and drag function 
-- that can be used to move display objects
-- Example: 
-- local c = display.newCircle( x, y, 10 )
-- c:addEventListener( "touch", dragAndDrop )
--
function dragAndDrop( event )
  local target = event.target
  local phase  = event.phase
    
  if phase == "began" then
    -- grab focus
    display.getCurrentStage():setFocus( target )
  elseif phase == "moved" then
    -- update the position
    target.x, target.y = event.x, event.y
  elseif phase == "ended" or phase == "cancelled" then
    -- release focus
    display.getCurrentStage():setFocus( nil )
  end
  return false
end
function scaleInOut( obj, timeIn, timeOut, scaleIn, scaleOut)
    local function _return( obj )
      transition.to(obj, { time = timeOut, xScale=scaleOut, yScale=scaleOut } )
    end
    transition.to(obj, { time = timeIn, xScale=scaleIn, yScale=scaleIn, onComplete=_return } )
end

function fadeOutIn( obj, timeIn, timeOut, alphaIn, alphaOut)
    local function _return( obj )
      transition.to(obj, { time = timeOut, alpha=alphaOut } )
    end
    transition.to(obj, { time = timeIn, alpha=alphaIn, onComplete=_return } )
end
