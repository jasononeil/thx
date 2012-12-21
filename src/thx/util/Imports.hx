/**
 * ...
 * @author Franco Ponticelli
 */

package thx.util;
import haxe.macro.Context;
import haxe.macro.Expr;

class Imports
{
	/** Include all classes in the given package.  A shortcut for haxe.macro.Compiler.include() */
	@:macro public static function pack(pack : String, ?recursive : Bool = true) : Expr
	{
		haxe.macro.Compiler.include(pack, recursive);
		return
		{
			expr : EConst(CString(pack)),
			pos : Context.currentPos() 
		};
	}
}