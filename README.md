# chat
Minetest CSM to allow for easier team chat in games like CTF or PK.

# How to use
The main command of this CSM is `.chat`. It works differently depending on what you pass as parameters:

If you pass a command or command name (such as "me" or "/msg Player", forward slash optional) all your chat messages from then until you relog or clear the prefix will be piped through that command. For example, if you do `.chat msg archfan` then all your messages will be messaged to the user archfan.

If you run `.chat` with *no* parameters, it will clear the prefix and you will be able to chat normally.
