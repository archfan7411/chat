local prefix = ""
minetest.register_on_sending_chat_messages(function(message)
     if message then
        local realprefix = prefix .. " "
        if prefix == "" then
            realprefix = ""
        end
        minetest.send_chat_message(realprefix..message)
     end
     return true
end)
minetest.register_chatcommand("chat", {
    description = "Sets command to pipe messages through - none to disable the feature.",
    func = function(param)
        if param ~= "" and string.sub(param, 1, 1) ~= "/" then
            param = "/" .. param
        end
        prefix = param or ""
        minetest.display_chat_message("Current prefix: " .. prefix)
    end,
})
minetest.register_chatcommand("chatstat", {
    description = "Get the current command you are piping messages through.",
    func = function(_)
        if not param or param == "" then
            minetest.display_chat_message("You are not piping messages through any command.")
        else
            minetest.display_chat_message("You are piping messages through " .. prefix .. "\nFor example, if you chat 'Hello there', ''"..prefix.." Hello there' will be sent.")
        end
    end
})