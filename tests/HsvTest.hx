package;

import why.color.*;
import tink.unit.Assert.*;

@:asserts
class HsvTest {
	public function new() {}
	
	@:variant(why.color.Hsv.BLACK, '#000000')
	@:variant(why.color.Hsv.WHITE, '#FFFFFF')
	@:variant(why.color.Hsv.RED, '#FF0000')
	@:variant(why.color.Hsv.GREEN, '#00FF00')
	@:variant(why.color.Hsv.BLUE, '#0000FF')
	public function const(v:Hsv, hex:String) {
		return assert(v.toHex() == hex);
	}
}