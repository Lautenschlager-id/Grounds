Table System

## Functions
<table>
  <tr>
    <th>Name</th>
    <th>Parameters</th>
    <th>Returns</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>table.find</td>
    <td>#list (Table) The table hosting the value searched<br>#value (String/Double) The value to be found in #list<br>#index (String/Int) If you are searching the value in a subtable of #list, inform the index<br>#f (Function) The function to execute in the current iterated value to be verified as #value == value</td>
    <td>#1 (Boolean) Whether the value was found or not in #list<br>#2 (String/Int) The index of the value (If found),
 or 0 if not found</td>
    <td>Searches a value in a table</td>
  </tr>
  <tr>
    <td>table.turnTable</td>
    <td>#x (Table/?) A value to be transformed into table</td>
    <td>#1 (Table) The value as a table (If #x is table, it is returned)</td>
    <td>Put a value in a table</td>
  </tr>
  <tr>
    <td>table.random</td>
    <td>#t (Table) A table with values</td>
    <td>#1 (?) A random value of the table</td>
    <td>Gets a random value of the given table</td>
  </tr>
  <tr>
    <td>table.shuffle</td>
    <td>#t (Table) A table with values</td>
    <td>#1 (Table) The shuffled table</td>
    <td>Shuffles the values of the given table</td>
  </tr>
  <tr>
    <td>table.merge</td>
    <td>#this (Table) A table with values to MIGHT be normalized<br>#src (Table) A standard table to use as base to merge missed data</td>
    <td></td>
    <td>Merges two tables and normalize values. For example #this={a="t",2,3};#src={a="rr",b="545s",{4,3},5} : #this={a="t",b="545s",{2,3},3}</td>
  </tr>
   <tr>
    <td>table.copy</td>
    <td>#list (Table) A table that is going to be copied</td>
    <td>#1 (Table) The copy of #list</td>
    <td>Creates a copy of a table</td>
  </tr>
</table>