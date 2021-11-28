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

class InitialMenu extends MusicBeatState
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
	var title:FlxSprite;
	var fade:FlxSprite;
	var go:FlxSprite;


	var nose:FlxSprite;

	override public function create():Void
	{
		//BIRDY DECORATIONS YK
		
		



		staticeffect = new FlxSprite(0, 0);
		staticeffect.frames = Paths.getSparrowAtlas('static','shared');
		staticeffect.animation.addByPrefix('idle', 'static_effect', 24, true);

		bg = new FlxSprite(-90, -100);
		bg.frames = Paths.getSparrowAtlas('menuimages/start_freddy','shared');
		bg.animation.addByPrefix('idle', 'Start Screen BG art', 24, true);

		title = new FlxSprite(590, -50);
		title.loadGraphic(Paths.image('menuimages/menulogo','shared'));
		title.setGraphicSize(Std.int(title.width / 1.4));
		title.alpha = 0;

		nose = new FlxSprite(380, 250);
		nose.loadGraphic(Paths.image('nose','shared'));

		go = new FlxSprite(600, 500);
		go.loadGraphic(Paths.image('menuimages/enterbegin','shared'));
		title.alpha = 0;
		
		fade = new FlxSprite(0, 0);
		fade.makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		fade.width = FlxG.width;
		fade.height = FlxG.height;

	

        new FlxTimer().start(7, function(tmr:FlxTimer)
		{
			FlxTween.tween(FlxG.camera, {zoom: FlxG.camera.zoom + 0.03}, 3, {ease: FlxEase.circOut, type: ONESHOT});
			new FlxTimer().start(5, function(tmr:FlxTimer)
			{
				FlxTween.tween(FlxG.camera, {zoom: FlxG.camera.zoom - 0.03}, 3, {ease: FlxEase.circOut, type: ONESHOT});
			});
		}, 0);


		
		add(bg);
		
		add(title);
		add(go);
		add(staticeffect);
		add(fade);
		add(nose);


		
		staticeffect.animation.play('idle');
		staticeffect.alpha = 1;
		fade.alpha = 0;

		bg.animation.play('idle');

		

		new FlxTimer().start(0.1, function(tmr:FlxTimer)
		{
			FlxTween.tween(staticeffect, {alpha: 0.1}, 1, {ease: FlxEase.circOut, type: ONESHOT});
		});
		new FlxTimer().start(3, function(tmr:FlxTimer)
		{
			FlxTween.tween(title, {angle: title.angle - 10}, 2, {ease: FlxEase.circOut, type: ONESHOT});
		});
		

		new FlxTimer().start(6, function(tmr:FlxTimer)
		{
			FlxTween.tween(title, {angle: title.angle + 20}, 2, {ease: FlxEase.circOut, type: ONESHOT});
			new FlxTimer().start(3, function(tmr:FlxTimer)
			{
				FlxTween.tween(title, {angle: title.angle - 20}, 2, {ease: FlxEase.circOut, type: ONESHOT});
			});
		}, 0);
		




		FlxG.mouse.visible = true;



		new FlxTimer().start(1, function(tmr:FlxTimer)
		{
			FlxTween.tween(title, {alpha: 1}, 1, {ease: FlxEase.circOut, type: ONESHOT});
		});
		new FlxTimer().start(2, function(tmr:FlxTimer)
		{
			FlxTween.tween(go, {alpha: 1}, 1, {ease: FlxEase.circOut, type: ONESHOT});
		});



		

		
		
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

		super.create();

		// NGio.noLogin(APIStuff.API);

		#if ng
		var ng:NGio = new NGio(APIStuff.API, APIStuff.EncKey);
		trace('NEWGROUNDS LOL');
		#end

		FlxG.save.bind('funkin', 'ninjamuffin99');

		KadeEngineData.initSave();

		Highscore.load();

		if (FlxG.save.data.weekUnlocked != null)
		{
			// FIX LATER!!!
			// WEEK UNLOCK PROGRESSION!!
			// StoryMenuState.weekUnlocked = FlxG.save.data.weekUnlocked;

			if (StoryMenuState.weekUnlocked.length < 4)
				StoryMenuState.weekUnlocked.insert(0, true);

			// QUICK PATCH OOPS!
			if (!StoryMenuState.weekUnlocked[0])
				StoryMenuState.weekUnlocked[0] = true;
		}

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
			FlxG.sound.playMusic(Paths.music('freakyMenu'), 0.5);

			FlxG.sound.music.fadeIn(4, 0, 0.7);
		}

		
	}

	

	var transitioning:Bool = false;

	override function update(elapsed:Float)
	{

		if(FlxG.keys.justPressed.ENTER)
		{
			FlxG.sound.play(Paths.sound('confirmMenu', 'preload'));
			go.visible = false;
			new FlxTimer().start(0.1, function(tmr:FlxTimer)
			{
				go.visible = true;
					
							
			});
			new FlxTimer().start(0.2, function(tmr:FlxTimer)
			{
				go.visible = false;
				new FlxTimer().start(0.1, function(tmr:FlxTimer)
				{
					go.visible = true;
					
							
				});
	
					
			}, 0);
		

			

			
			new FlxTimer().start(1, function(tmr:FlxTimer)
			{
				FlxTween.tween(staticeffect, {alpha: 1}, 1, {ease: FlxEase.circOut, type: ONESHOT});
				FlxTween.tween(fade, {alpha: 1}, 1, {ease: FlxEase.circOut, type: ONESHOT});
				FlxG.sound.music.fadeOut(1, 0);
			    new FlxTimer().start(3, function(tmr:FlxTimer)
				{
					FlxG.switchState(new AnimatronicMenu());
						
				});

				
			});
		}
		

		if(FlxG.mouse.overlaps(nose))
		{
			if(FlxG.mouse.justPressed)
			{
				FlxG.sound.play(Paths.sound('honk', 'shared'), 1, false);
			}
		}

		
		

		super.update(elapsed);
	}

	
}


