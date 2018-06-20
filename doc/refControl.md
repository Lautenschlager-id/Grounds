System control

## Variables
<table>
  <tr>
    <th>Name</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>system.newGameTimer</td>
    <td>Int</td>
    <td>If the os.time() is smaller than the value in this variable, a new game will not be allowed</td>
  </tr>
  <tr>
    <td>system.officialMode</td>
    <td>Table[2](String, String)</td>
    <td>If the room is hosting an official mode (Survivor, Racing, Defilante, etc) it saves the mode name and a simple string for entertainment</td>
  </tr>
  <tr>
    <td>system.playerMessage</td>
    <td>String</td>
    <td>The initial message the room hosts (using ":Text"), if hosts</td>
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
    <td>system.setAdmins</td>
    <td></td>
    <td>#1 (Table) All the fixed module admins set as *true*</td>
    <td>Creates a table with the fixed module admins, called when a mode is (re)initialized</td>
  </tr>
</table>