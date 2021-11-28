//SERGIO EVENT

package;

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
import lime.app.Application;
import openfl.Assets;

#if windows
import Discord.DiscordClient;
#end

#if cpp
import sys.thread.Thread;
#end

using StringTools;

class WarningState extends MusicBeatState
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

	

	var staticeffect:FlxSprite;

	var bg:FlxSprite;
	var warning:FlxSprite;
	var cont:FlxSprite;

	override public function create():Void
	{
		//BIRDY DECORATIONS YK
		
		



		staticeffect = new FlxSprite(0, 0);
		staticeffect.frames = Paths.getSparrowAtlas('static','shared');
		staticeffect.animation.addByPrefix('idle', 'static_effect', 24, true);

		bg = new FlxSprite(0, 0);
		bg.loadGraphic(Paths.image('warningBg','shared'));

		warning = new FlxSprite(-300, -150);
		warning.loadGraphic(Paths.image('warningText','shared'));
		warning.setGraphicSize(Std.int(warning.width / 1.5));

		cont = new FlxSprite(-320, -180);
		cont.loadGraphic(Paths.image('pressX','shared'));
		cont.setGraphicSize(Std.int(cont.width / 1.5));




		



		
		



		


		

		



		
		
		
		add(bg);
		add(warning);
		add(cont);
		add(staticeffect);


		
		staticeffect.animation.play('idle');
		staticeffect.alpha = 1;

		warning.alpha = 0;
		cont.alpha = 0;

		new FlxTimer().start(0.1, function(tmr:FlxTimer)
		{
			FlxTween.tween(staticeffect, {alpha: 0.1}, 1, {ease: FlxEase.circOut, type: ONESHOT});
		});
		new FlxTimer().start(0.5, function(tmr:FlxTimer)
		{
			FlxTween.tween(warning, {alpha: 1}, 1, {ease: FlxEase.circOut, type: ONESHOT});
		});
		new FlxTimer().start(1, function(tmr:FlxTimer)
		{
			FlxTween.tween(cont, {alpha: 1}, 1, {ease: FlxEase.circOut, type: ONESHOT});
		});




		FlxG.mouse.visible = true;



		



		

		
		
		#if polymod
		polymod.Polymod.init({modRoot: "mods", dirs: ['introMod']});
		#end
		
		#if sys
		if (!sys.FileSystem.exists(Sys.getCwd() + "/assets/replays"))
			sys.FileSystem.createDirectory(Sys.getCwd() + "/assets/replays");
		#end

		@:privateAccess
		{
			trace("Loaded " + openfl.Assets.getLibrary("default").assetsLoaded + " assets (DEFAULT)");
		}
		
		PlayerSettings.init();

		#if windows
		DiscordClient.initialize();

		Application.current.onExit.add (function (exitCode) {
			DiscordClient.shutdown();
		 });
		 
		#end

		

		// DEBUG BULLSHIT

		#if mobileC
		addVirtualPad(NONE, A);
		#end

		super.create();

		// NGio.noLogin(APIStuff.API);

		#if ng
		var ng:NGio = new NGio(APIStuff.API, APIStuff.EncKey);
		trace('NEWGROUNDS LOL');
		#end

		FlxG.save.bind('funkin', 'ninjamuffin99');

		KadeEngineData.initSave();

		Highscore.load();

		

		#if FREEPLAY
		FlxG.switchState(new FreeplayState());
		#elseif CHARTING
		FlxG.switchState(new ChartingState());
		#else
		new FlxTimer().start(1, function(tmr:FlxTimer)
		{
			startIntro();
		});
		#end
	}

	var logoBl:FlxSprite;
	var gfDance:FlxSprite;
	var danceLeft:Bool = false;
	var titleText:FlxSprite;

	function startIntro()
	{
		if (!initialized)
		{
			var diamond:FlxGraphic = FlxGraphic.fromClass(GraphicTransTileDiamond);
			diamond.persist = true;
			diamond.destroyOnNoUse = false;

			

			// HAD TO MODIFY SOME BACKEND SHIT
			// IF THIS PR IS HERE IF ITS ACCEPTED UR GOOD TO GO
			// https://github.com/HaxeFlixel/flixel-addons/pull/348

			// var music:FlxSound = new FlxSound();
			// music.loadStream(Paths.music('freakyMenu'));
			// FlxG.sound.list.add(music);
			// music.play();
			FlxG.sound.playMusic(Paths.music('static'), 0.5);

			FlxG.sound.music.fadeIn(4, 0, 0.7);
		}

		
	}

	

	var transitioning:Bool = false;

	override function update(elapsed:Float)
	{

		if(FlxG.keys.justPressed.ACCEPT)
		{
		

			

			
			new FlxTimer().start(1, function(tmr:FlxTimer)
			{
				FlxTween.tween(staticeffect, {alpha: 1}, 1, {ease: FlxEase.circOut, type: ONESHOT});
			    new FlxTimer().start(3, function(tmr:FlxTimer)
				{
					FlxG.switchState(new InitialMenu());
						
				});
			});
		}
		

		
		

		super.update(elapsed);
	}

	
}


