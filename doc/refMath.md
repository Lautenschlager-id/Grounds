Mathematical System

## Functions
<table>
  <tr>
    <th>Name</th>
    <th>Parameters</th>
    <th>Returns</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>math.isNegative</td>
    <td>#x (Double) The number to be verified<br>#iN (String/Double) The value set when #x is negative (Default = #x)<br>#iP (String/Double) The value set when #x is positive (Default = #x)</td>
    <td>#1 (String/Double) #iP if #x is positive, but #iN if negative</td>
    <td>Verfies whether #x is negative or positive and returns the respective parameter</td>
  </tr>
  <tr>
    <td>math.percent</td>
    <td>#x (Double) Current number<br>#y (Double) Final number<br>#v (Double) Maximum number (Default = 100)</td>
    <td>#1 (Double) How many percent #x is from #y with #v as maximum value</td>
    <td>Percentage between #x and #y</td>
  </tr>
  <tr>
    <td>math.pythag</td>
    <td>#x1 (Int) First X coordinate<br>#y1 (Int) First Y coordinate<br>#x2 (Int) Second X coordinate<br>#y2 (Int) Second Y coordinate<br>#range (Double) Limit range of the verification</td>
    <td>#1 (Boolean) Whether the point #x1,#y1 is inside of a circle in #x2,#y2 with #range range or not</td>
    <td>Checks if a point is inside a circle with a given range</td>
  </tr>
  <tr>
    <td>math.setLim</td>
    <td>#value (Double) The value to be normalized<br>#min (Double) The minimum number<br>#max (Double) The maximum number</td>
    <td>#1 (Double) The value normalized, where when #value < #min = #min and #value > #max = #max or #value itself</td>
    <td>Normalizes the number so it does not stay out of the given range [#min:#max]</td>
  </tr>
    <tr>
  <td>math.intersects</td>
    <td>#x1 (Int) The first X coordinate<br>#y1 (Int) The first Y coordinate<br>#x2 (Int) The second X coordinate<br>#y2 (Int) The second Y coordinate<br>#x3 (Int) The third X coordinate<br>#y3 (Int) The third Y coordinate</td>
    <td>#1 (Boolean) If the first point is located between the other two points</td>
    <td>Checks if a point intersects a given rectangle</td>
  </tr>
  <tr>
    <td>math.minmax</td>
    <td>#a (Double) The first number<br>#b (Double) The second number</td>
    <td>#1 (Double) The biggest value between the parameters<br>#2 (Double) The lowest value between the parameters</td>
    <td>Sorted the parameters decrescently</td>
  </tr>
  <tr>
    <td>math.rotatePoint</td>
    <td>#x (Int) The X coordinate<br>#y (Int) The Y coordinate<br>#angle (Int) The angle in degrees to rotate the point</td>
    <td>#1 (Int) The X coordinate rotated in #angle degrees<br>#2 (Int) The Y coordinate rotated in #angle degrees</td>
    <td>Rotates a point in a given angle</td>
  </tr>
  <tr>
    <td>math.round</td>
    <td>#x (Double) The number to be rounded</td>
    <td>#1 (Double) The rounded number</td>
    <td>Rounds the given number in 0.5 seconds, for example 10.34=10, and 10.78=10.5</td>
  </tr>
</table>