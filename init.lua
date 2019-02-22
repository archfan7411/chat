function string.startswith(str, sub)
    return string.sub(str, 1, sub.length) == check
end

local prefix = ""
minetest.register_on_sending_chat_messages(function(message)
    if prefix then 
        if message and not string.startswith(message, "/") and not string.startswith(message, ".") then
            local realprefix = prefix .. " "
            if prefix == "" then
                realprefix = ""
            end
            minetest.send_chat_message(realprefix..message)
        end
        return true
    end
    return false
end)

minetest.register_chatcommand("chat", {
    description = "Sets command to pipe messages through - none to disable the feature.",
    func = function(param)
        if param ~= "" and string.sub(param, 1, 1) ~= "/" then
            param = "/" .. param
        end
        prefix = string.trim(param) or ""
        minetest.display_chat_message(minetest.colorize("#00ff00", "Current prefix: "..prefix.."\nIf you type 'Hello there', '"..prefix.." Hello there' will be sent."))
    end,
          
