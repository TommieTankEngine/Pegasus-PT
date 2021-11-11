--Do not edit unless you know what you're doing--
peacetime = false;
function sendMsg(src, msg)
  TriggerClientEvent('chat:addMessage', src, { args = {"^6[^9Pegasus PT^6] ~y~" .. msg} });
end
RegisterCommand("peacetime", function(source, args, rawCommand)
  local src = source;
  if IsPlayerAceAllowed(src, "Pegasus_PT") then
    peacetime = not peacetime;
    TriggerClientEvent('Pegasus:PT', -1, peacetime);
    if peacetime then 
      sendMsg(-1, "~y~PeaceTime is ^2ON!");
      TriggerClientEvent('PeaceTimeOn', source, PTON); 
    else 
      sendMsg(-1, "~y~PeaceTime is now ^1OFF!");
      TriggerClientEvent('PeaceTimeOff', source, PTOFF);
    end
      else
      TriggerClientEvent('NotifyEvent', source, notifyevent);
  end
end)
