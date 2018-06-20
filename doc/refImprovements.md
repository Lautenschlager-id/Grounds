Overrides for performance purposes

## Functions
<table>
  <tr>
    <th>Name</th>
    <th>New parameters</th>
    <th>Returns</th>
    <th>Alteration</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>table.concat</td>
    <td>#f (Function(index, value)) The function to be executed in each iterated value<br><br>@list,sep,f,i,j</td>
    <td>#1 (String) A string with all the values of the table inserted</td>
    <td>Added the #f parameter, so the manipulation becomes easier and faster</td>
    <td>Concatenates all the indexes of a table, each value separated with a set string and a possible function to edit the value in a given format</td>
  </tr>
  <tr>
    <td>tfm.exec.newGame</td>
    <td>@code</td>
    <td>#1 (Boolean) If the map was loaded</td>
    <td>Now you can set #code as nil and it loads a random map; It has a timer, so you cannot call it before the first 6 seconds of each new map</td>
    <td>Loads a map</td>
  </tr>
  <tr>
    <td>tfm.exec.addImage</td>
    <td>@image,target,x,y,player</td>
    <td>#1 (Int) The image ID (or -1 if the function failed)</td>
    <td>The ID is added in a global table to be deleted when a new mode is loaded, or in a module refresh</td>
    <td>Loads an image</td>
  </tr>
  <tr>
    <td>tfm.exec.removeImage</td>
    <td>@imageID</td>
    <td></td>
    <td>The ID in the global table is deleted, so it will not be re-deleted in a further ocasion</td>
    <td>Removes an image</td>
  </tr>
  <tr>
    <td>ui.addTextArea</td>
    <td>@id,text,player,x,y,w,h,bg,border,alpha,fixed</td>
    <td></td>
    <td>The ID is added in a global table to be deleted when a new mode is loaded, or in a module refresh</td>
    <td>Adds a text area</td>
  </tr>
  <tr>
    <td>tfm.exec.chatMessage</td>
    <td>@txt,player</td>
    <td></td>
    <td>Now there is not a text length limit in #txt</td>
    <td>Displays a message in the chat</td>
  </tr>
  <tr>
    <td>system.loadPlayerData</td>
    <td>@player</td>
    <td>#1 (Boolean) Whether the data is loading</td>
    <td>While the module is not official it loads the eventPlayerDataLoaded with an empty data. After, it loads correctly</td>
    <td>Loads the player data</td>
  </tr>
  <tr>
    <td>system.savePlayerData</td>
    <td>@player,data</td>
    <td>#1 (Boolean) Whether the data has been saved</td>
    <td>Data is saved when the module is official only</td>
    <td>Saves the player data</td>
  </tr>
</table>