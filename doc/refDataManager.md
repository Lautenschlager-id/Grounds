Data Manager

## Functions
<table>
  <tr>
    <th>Name</th>
    <th>Parameters</th>
    <th>Returns</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>dataManager.using</td>
    <td>#module (String) The module to be managed<br>#data (Table) The table with the module data format (variables and values)</td>
    <td>#1 (Table) All the functions of management</td>
    <td>Generates a data manager for the specified module</td>
  </tr>
  <tr>
    <td>self:struct</td>
    <td>#player (String) The player name<br>#data (String) The data linked to the specified player</td>
    <td>#1 (Boolean) Whether the structure was created or not</td>
    <td>Creates a structure for the specified player for data management</td>
  </tr>
  <tr>
    <td>self:getData</td>
    <td>#player (String) The player name<br>#index (String) The _index_ data of the specified player</td>
    <td>#1 The specified data obtained from the structure of the player. If there's no _index_, the whole data string is returned</td>
    <td>Gets the data of the specified player</td>
  </tr>
  <tr>
    <td>self:setValue</td>
    <td>#player (String) The player name<br>#values (Table) The indexes and values to be changed<br>#save (Boolean) Whether the data must be saved after the edition or not</td>
    <td>#1 (String) The whole data string</td>
    <td>Sets the value of a data index in the structure of the player</td>
  </tr>
  <tr>
    <td>self:save</td>
    <td>#player (String) The player name<br>#data (String) A string data to be saved instead of the one in the system</td>
    <td>#1 (Boolean) Whether the data was saved or not</td>
    <td>Saves the player data</td>
  </tr>
  <tr>
    <td>self:garbage</td>
    <td>#player (String) The player name<br>#remove (Boolean) Whether the garbage must be removed or not</td>
    <td>#1 (String) The garbage<br>#2 (Boolean) Whether the garbage was removed or not</td>
    <td>Removes the garbage [non formated data] from the player data</td>
  </tr>
  <tr>
    <td>dataManager.delete</td>
    <td>#module (String/Table) The module(s) to be removed from the data<br>#data (String) The data string</td>
    <td>#1 (String) The data without the specified module</td>
    <td>Removes a whole module data from the data string</td>
  </tr>
</table>