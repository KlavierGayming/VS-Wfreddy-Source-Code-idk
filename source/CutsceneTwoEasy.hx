//SERGIO EVENT

package;

import polymod.format.ParseRules.PlainTextParseFormat;
import haxe.display.JsonModuleTypes.JsonTypeParameters;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.display.FlxGridOverlay;
import flixel.addons.transition.FlxTransitionSprite.GraphicTransTileDiamond;
import flixel.addons.transition.FlxTransitionableState;
import flixel.addons.transition.TransitionData;
import flixel.graphics.FlxGraphic;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup;
import flixel.input.gamepad.FlxGamepad;
import flixel.math.FlxPoint;
import flixel.math.FlxRect;
import flixel.system.FlxSound;
import flixel.system.ui.FlxSoundTray;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import io.newgrounds.NG;
import lime.app.Application;
import openfl.Assets;

#if windows
import Discord.DiscordClient;
#end

#if cpp
import sys.thread.Thread;
#end

using StringTools;

class CutsceneTwoEasy extends MusicBeatState
{
	static var initialized:Bool = false;

	var blackScreen:FlxSprite;
	var credGroup:FlxGroup;
	var credTextShit:Alphabet;
	var textGroup:FlxGroup;
	var ngSpr:FlxSprite;

	var curWacky:Array<String> = [];

	var wackyImage:FlxSprite;

	//BIRDY MENU VARIABLES

	var fade:FlxSprite;

	var staticeffect:FlxSprite;

	var bg:FlxSprite;

	var goback:FlxSprite;

	var gobutton:FlxSprite;




	var ui:FlxSprite;
	var uiglitch:FlxSprite;
	var phaseone:FlxSprite;
	var phasetwo:FlxSprite;
	var phasethree:FlxSprite;
	var descone:FlxSprite;
	var descthree:FlxSprite;
	var desctwo:FlxSprite;
	var songone:FlxSprite;
	var songtwo:FlxSprite;
	var songthree:FlxSprite;
	var lineeffect:FlxSprite;

	var lines:FlxSprite;


	

	override public function create():Void
	{

		lines = new FlxSprite(0, 0);
		lines.loadGraphic(Paths.image('shadowbonniebgs/lines','shared'));
		add(lines);

		PlayState.SONG = Song.loadFromJson("flashinglights-easy","flashinglights-easy");
        PlayState.isStoryMode = true;
		PlayState.storyDifficulty = 1;

		PlayState.storyWeek = 4;






		var video:MP4Handler = new MP4Handler();
		video.playMP4(Paths.video('cut2'), new PlayState(), lines, false, false, false);
		
		
		
		

		super.create();

		
	}

	



	override function update(elapsed:Float)
	{

		
		

		

		super.update(elapsed);
	}

	
}


