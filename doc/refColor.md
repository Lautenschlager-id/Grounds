Color converters

## Variables
<table>
  <tr>
    <th>Name</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>color.YELLOW</td>
    <td>Hex</td>
    <td>0xF9EC27</td>
  </tr>
   <tr>
    <td>color.RED</td>
    <td>Hex</td>
    <td>0xF94226</td>
  </tr>
   <tr>
    <td>color.LIGHT_RED</td>
    <td>Hex</td>
    <td>0xD1605D</td>
  </tr>
   <tr>
    <td>color.BLUE</td>
    <td>Hex</td>
    <td>0x34A4E5</td>
  </tr>
   <tr>
    <td>color.DEEP_BLUE</td>
    <td>Hex</td>
    <td>0x4F7F9A</td>
  </tr>
   <tr>
    <td>color.DARK_BLUE</td>
    <td>Hex</td>
    <td>0x2D80AF</td>
  </tr>
   <tr>
    <td>color.GRAY</td>
    <td>Hex</td>
    <td>0x969696</td>
  </tr>
   <tr>
    <td>color.SALMON</td>
    <td>Hex</td>
    <td>0xAC6C64</td>
  </tr>
   <tr>
    <td>color.BROWN</td>
    <td>Hex</td>
    <td>0x89635A</td>
  </tr>
   <tr>
    <td>color.BEIGE</td>
    <td>Hex</td>
    <td>0x937A53</td>
  </tr>
   <tr>
    <td>color.TURQUOISE</td>
    <td>Hex</td>
    <td>0x59D1C8</td>
  </tr>
   <tr>
    <td>color.ROSE</td>
    <td>Hex</td>
    <td>0x816669</td>
  </tr>
   <tr>
    <td>color.MOSS_GREEN</td>
    <td>Hex</td>
    <td>0x689636</td>
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
    <td>color.hexToRgb</td>
    <td>#hex (Hex) A hexadecimal value</td>
    <td>#1 (Int) R(red) of the HEX<br>#2 (Int) G(green) of the HEX<br>#3 (Int) B(blue) of the HEX</td>
    <td>Converts hexadecimal to RGB</td>
  </tr>
  <tr>
    <td>color.rgbToHsl</td>
    <td>#r (Int) The R(red) value<br>#g (Int) The G(green) value<br>#b (Int) The B(blue) value</td>
    <td>#1 (Table) {h = hue value, s = Saturation, l = Lightness}</td>
    <td>Converts RGB to HSL</td>
  </tr>
  <tr>
    <td>color.hslToRgb</td>
    <td>#h (Int) The H(hue) value<br>#s (Int) The S(Saturation) value<br>#l (Int) The L(Lightness) value</td>
    <td>#1 (Int) R(red) value<br>#2 (Int) G(green) value<br>#3 (Int) B(blue) value</td>
    <td>Converts HSL to RGB</td>
  </tr>
  <tr>
    <td>color.rgbToHex</td>
    <td>#r (Int) The R(red) value<br>#g (Int) The G(green) value<br>#b (Int) The B(blue) value</td>
    <td>#1 (Hex) The hex value of the given #r #g #b value</td>
    <td>Converts RGB to HEX</td>
  </tr>
</table>