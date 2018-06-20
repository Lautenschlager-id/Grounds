Systems of the game for performance improvements

## Variables
<table>
  <tr>
    <th>Name</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>events</td>
    <td>Table</td>
    <td>All the standard official events to be linked to the mode game event, for example eventLoop</td>
  </tr>
  <tr>
    <td>currentTime</td>
    <td>Double</td>
    <td>The current time of the map</td>
  </tr>
  <tr>
    <td>leftTime</td>
    <td>Double</td>
    <td>The left time of the map</td>
  </tr>
</table>

## Functions
<table>
  <tr>
    <th>Name</th>
    <th>Parameters</th>
    <th>Returns</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>system.loadTable</td>
    <td>#s (String) The supposed table to be loaded</td>
    <td>#1 (Table/?) The value of the loaded table</td>
    <td>Loads a table given in string, for example "_G.print"</td>
  </tr>
  <tr>
    <td>system.getTranslation</td>
    <td>#index (String) The path of the translation string, for example "messages.hello"<br>#n (String) The player name if there is a mode[mode].info[n].langue var (Default = nil)</td>
    <td>#1 (String) The text required from the mode[mode].translation table</td>
    <td>Gets a text that exists in the translation table</td>
  </tr>
  <tr>
    <td>system.looping</td>
    <td>#f (Function) The function to be executed<br>#tick (Int) The ticks [1:40] to execute the function #f</td>
    <td>#1 (Table) All the timers in a table (Useful to loop and remove)</td>
    <td>Creates a faster eventLoop</td>
  </tr>
</table>