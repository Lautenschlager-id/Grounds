# V4.2

## Github
→ "API" file fragmented in a folder "API"<br>
→ "Events" file fragmented in a folder "Events"<br>
→ "Builder" and "Sys" improved<br>

## System
→ Set a submode using the character "#". (Was "\*")<br>
→ Set a miscellaneous attribute using the character "\*". (Was "#")<br>
→ Set a standard language using the character "!" and the language (Ex: !en, !br)<br>
→ Standard "eventChatCommand" function rewritten<br>
→→ Three new commands: "!me", "!setMisc [number] [refresh]" and "!setRoomLanguage [language]"

## API
→ Added a "system.roomLanguage" variable that hosts the &langue, if exists<br>
→ Added a "string.trim" function<br>
→ Function "disableChatCommand" improved, now it accepts more than 1 command<br>
→ Function "normalizeTranslation" improved<br>
→ Added a "table.merge" function


## #Grounds
→ Implemented a "displayWaterBar" function for performance purposes<br>
→→ The water bar was improved<br>
→ New maps<br>
→ Command "np" improved (now it loads correctly official maps. You can also load G random categories using G[Cat])<br>
→ Changed colors of some G categories<br>
→ Added new XML ground attribute *move="Z"* as alternative to lava Z system

## #Presents
→ Initial message fixed<br>
→ Text fixeds

## #Godmode
→ Banner is removed correctly now

## #Sharpie
→ Hard mode explodes faster now<br>
→ Text fixeds

## #Universe
→ Moons in standard rooms are not duplicated anymore<br>
→ Profiles (P) must be displayed correctly now<br>
→ Creator message is not duplicated anymore

## #Dev
→ The automatic foreground image loaded via XML codes using the "img" attribute is now a fix-foreground image, i.e., doesn't move in big maps<br>
→ Now you can't throw objects (!throw) when you are dead<br>
→→ You can throw objects twice per second<br>
→ Now you can create images, objects and timers with a name that already exists, but the old one is going to be destroyed<br>
→ Commands are now hidden<br>
→ Set backgrounds are not removed when a new map is loaded<br>
→ New character system (*!character [who] [depth] [imgLeft] [imgRight] [x] [y]*)