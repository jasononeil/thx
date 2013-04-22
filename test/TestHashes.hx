/**
 * ...
 * @author Franco Ponticelli
 */

import utest.Assert;
import utest.Runner;
import utest.ui.Report;
import haxe.ds.*;

using DynamicsT;
using Hashes;

class TestHashes
{
	public static function addTests(runner : Runner)
	{
		runner.addCase(new TestHashes());
	}
	
	public static function main()
	{
		var runner = new Runner();
		addTests(runner);
		Report.create(runner);
		runner.run();
	}
	
	public function new(){}
	
	public function testCreate()
	{
		var hash = { name : "haxe", author : "nicolas" }.toHash();
		Assert.equals("haxe", hash.get("name"));
		Assert.equals("nicolas", hash.get("author"));
	}

	public function testMerge()
	{
		var oldMap = new StringMap();
		oldMap.set("name", "haXe");
		oldMap.set("author", "nicolas");
		oldMap.set("version", "2.08");

		var newMap = new StringMap();
		newMap.set("name", "Haxe");
		newMap.set("version", "3");
		newMap.set("website", "haxe.org");

		oldMap.merge(newMap);

		Assert.equals("Haxe", oldMap.get("name"));
		Assert.equals("3", oldMap.get("version"));
		Assert.equals("nicolas", oldMap.get("author"));
		Assert.equals("haxe.org", oldMap.get("website"));
	}
}