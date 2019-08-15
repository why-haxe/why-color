package;

import why.color.*;
import tink.unit.Assert.*;

@:asserts
class RgbTest {
	public function new() {}
	
	@:variant(why.color.Rgb.BLACK, '#000000')
	@:variant(why.color.Rgb.WHITE, '#FFFFFF')
	@:variant(why.color.Rgb.RED, '#FF0000')
	@:variant(why.color.Rgb.GREEN, '#00FF00')
	@:variant(why.color.Rgb.BLUE, '#0000FF')
	public function const(v:Rgb, hex:String) {
		return assert(v.toHex() == hex);
	}
}