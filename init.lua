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
