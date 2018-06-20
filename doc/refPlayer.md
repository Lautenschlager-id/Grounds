Player dealing and detection

## Functions
<table>
  <tr>
    <th>Name</th>
    <th>Parameters</th>
    <th>Returns</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>system.isPlayer</td>
    <td>#n (String) The player name</td>
    <td>#1 (Boolean) Whether the player is valid or not</td>
    <td>Verifies if the player is not a souris and has played Transformice for at least 5 days.</td>
  </tr>
  <tr>
    <td>system.players</td>
    <td>#alivePlayers (Boolean) Whether the function should host the player names or not</td>
    <td>#1 [if #alivePlayers == true](Table) A table with all the players alive<br>#1 [if #alivePlayers == false](Int)
 The amount of players alive<br>#2 (Int) The amount of players in the room</td>
    <td>Verifies the alive and current players in the room</td>
  </tr>
</table>