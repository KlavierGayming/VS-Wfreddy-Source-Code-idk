package;

import flixel.FlxG;
using StringTools;

class Config
{
	
	public static var offset:Float;
	public static var accuracy:String;
	public static var healthMultiplier:Float;
	public static var healthDrainMultiplier:Float;
	public static var betterIcons:Bool;
	public static var downscroll:Bool;
	public static var flashings:Bool;
	public static var bbdisable:Bool;
	public static var newInput:Bool;
	
	public static var noRandomTap:Bool;
	public static var disableCutscenes:String;
	public static var disableDodgeSound:Bool;

	public static function resetSettings():Void{

		FlxG.save.data.offset = 0.0;
		FlxG.save.data.accuracy = "simple";
		FlxG.save.data.healthMultiplier = 1.0;
		FlxG.save.data.healthDrainMultiplier = 1.0;
		FlxG.save.data.betterIcons = true;
		FlxG.save.data.downscroll = false;
		FlxG.save.data.flashings = false;
		FlxG.save.data.bbdisable = false;
		FlxG.save.data.newInput = true;
		
		FlxG.save.data.disableCutscenes = 'story';
		FlxG.save.data.disableDodgeSound = false;
		reload();

	}
	
	public static function reload():Void
	{
		offset = FlxG.save.data.offset;
		accuracy = FlxG.save.data.accuracy;
		healthMultiplier = FlxG.save.data.healthMultiplier;
		healthDrainMultiplier = FlxG.save.data.healthDrainMultiplier;
		betterIcons = FlxG.save.data.betterIcons;
		downscroll = FlxG.save.data.downscroll;
		flashings = FlxG.save.data.flashings;
		bbdisable = FlxG.save.data.bbdisable;
		newInput = FlxG.save.data.newInput;
		
		disableCutscenes = FlxG.save.data.disableCutscenes;
		disableDodgeSound = FlxG.save.data.disableDodgeSound;
	}
	
	public static function write(
								offsetW:Float, 
								accuracyW:String, 
								healthMultiplierW:Float, 
								healthDrainMultiplierW:Float, 
								betterIconsW:Bool, 
								downscrollW:Bool,
								flashingsW:Bool, 
								bbdisableW:Bool,
								newInputW:Bool,
								disableCutscenesW:String,
								disableDodgeSoundW:Bool
								):Void
	{

		FlxG.save.data.offset = offsetW;
		FlxG.save.data.accuracy = accuracyW;
		FlxG.save.data.healthMultiplier = healthMultiplierW;
		FlxG.save.data.healthDrainMultiplier = healthDrainMultiplierW;
		FlxG.save.data.betterIcons = betterIconsW;
		FlxG.save.data.downscroll = downscrollW;
		FlxG.save.data.flashings = flashingsW;
		FlxG.save.data.bbdisable = bbdisableW;
		FlxG.save.data.newInput = newInputW;
		
		FlxG.save.data.disableCutscenes = disableCutscenesW;
		FlxG.save.data.disableDodgeSound = disableDodgeSoundW;
		
		reload();

	}
	
	public static function configCheck():Void
	{
		if(FlxG.save.data.offset == null)
			FlxG.save.data.offset = 0.0;
		if(FlxG.save.data.accuracy == null)
			FlxG.save.data.accuracy = "simple";
		if(FlxG.save.data.healthMultiplier == null)
			FlxG.save.data.healthMultiplier = 1.0;
		if(FlxG.save.data.healthDrainMultiplier == null)
			FlxG.save.data.healthDrainMultiplier = 1.0;
		if(FlxG.save.data.betterIcons == null)
			FlxG.save.data.betterIcons = true;
		if(FlxG.save.data.downscroll == null)
			FlxG.save.data.downscroll = false;
		if(FlxG.save.data.flashings == null)
			FlxG.save.data.flashings = false;
		if(FlxG.save.data.bbdisable == null)
			FlxG.save.data.bbdisable = false;
		if(FlxG.save.data.newInput == null)
			FlxG.save.data.newInput = true;
		if(FlxG.save.data.disableCutscenes == null)
			FlxG.save.data.disableCutscenes = 'story';
		if(FlxG.save.data.disableDodgeSound == null)
			FlxG.save.data.disableDodgeSound = false;
		//bruh
		


		if(FlxG.save.data.ee1 == null)
			FlxG.save.data.ee1 = false;
	}
	
}