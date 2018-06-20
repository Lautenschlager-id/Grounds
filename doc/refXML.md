XML dealers

## Functions
<table>
  <tr>
    <th>Name</th>
    <th>Parameters</th>
    <th>Returns</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>xml.parse</td>
    <td>#currentXml (String) The xml to be parsed</td>
    <td>#1 (Table) A table indexed as [tag]=[value] in the parameter tag of the given XML<br>#2 (String) The &lt;P> properties</td>
    <td>Parses the XML and gets all the parameters in the parameter tag of the #currentXml</td>
  </tr>
  <tr>
    <td>xml.attribFunc</td>
    <td>#currentXml (String) The xml to be parsed<br>#funcs (Table) A table with the [attribute="",func=function] format</td>
    <td>#1 (String) The properties in the &lt;P> tag</td>
    <td>Executes a specific function according to the attribute detected in the parameters, for example [attribute="L",func=function(size)print("Map size: "..size)end]</td>
  </tr>
  <tr>
    <td>xml.addAttrib</td>
    <td>#currentXml (String) The xml to have the parameter added<br>#out (Table) A table using the [tag="",value=""] format<br>#launch (Boolean) Whether the new xml must be loaded automatically or not</td>
    <td>#1 (String) If #launch is false, the edited XML is returned</td>
    <td>Adds attributes in the given XML</td>
  </tr>
  <tr>
    <td>xml.getCoordinates</td>
    <td>#s (String) The value to be parsed</td>
    <td>#1 (Int/Table) If there is an AXIS, it returns its value, otherwise it returns a table with the x,y coordinates</td>
    <td>Gets coordinates in the following format "x1,y1;x2,y2;x3,y3" or, as axis, "x;x1" or "y;y1"</td>
  </tr>
</table>