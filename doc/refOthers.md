Other system functions without categories

## Functions
<table>
  <tr>
    <th>Name</th>
    <th>Parameters</th>
    <th>Returns</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>deactivateAccents</td>
    <td>#str (String) A string to have the accents removed</td>
    <td>#1 (String) The string with the accents removed</td>
    <td>Remove accents (such as ´,~,`) of the string</td>
  </tr>
  <tr>
    <td>disableChatCommand</td>
    <td>#command (String) A command to be deactivated in the chat<br>#... (String) Other commands to be deactivated in the chat</td>
    <td></td>
    <td>Disables the chat command display (String, Upper String, Lower String)</td>
  </tr>
  <tr>
    <td>normalizeTranslation</td>
    <td></td>
    <td></td>
    <td>Sets the mode[mode].langue and normalizes all the translation tables adding missed indexes (the main is the EN table)</td>
  </tr>
  <tr>
    <td>normalizeNumber</td>
    <td>#number (Int) A number to be normalized as string<br>#sep (String) The number separator (Default = " ")</td>
    <td>#1 (String) The normalized number</td>
    <td>Normalizes a number as a string, for example 1000 = 1 000</td>
  </tr>
    <tr>
    <td>pairsByIndexes</td>
    <td>#list (Table) The table to be itered<br>#f (Function) The table.sort function</td>
    <td>#1 (Function) The iterator function</td>
    <td>Iterates a table by string indexes</td>
  </tr>
</table>