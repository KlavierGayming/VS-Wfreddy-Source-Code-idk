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

class FreddyMenu extends MusicBeatState
{
	static var initialized:Bool = false;

	var weekData:Array<Dynamic> = [
		['Tutorial'],
		['Bopeebo', 'Fresh', 'Dad Battle'],
		['Spookeez', 'South', "Monster"],
		['Pico', 'Philly Nice', "Blammed"],
		['Satin Panties', "High", "Milf"],
		['Cocoa', 'Eggnog', 'Winter Horrorland'],
		['Senpai', 'Roses', 'Thorns'],
		['Nightshift', 'Flashinglights', 'Shadows']
	];

	var blackScreen:FlxSprite;
	var credGroup:FlxGroup;
	var credTextShit:Alphabet;
	var textGroup:FlxGroup;
	var ngSpr:FlxSprite;

	var curWacky:Array<String> = [];

	var wackyImage:FlxSprite;

	//BIRDY MENU VARIABLES

	var freddybg:FlxSprite;

	var staticeffect:FlxSprite;

	var songlist:FlxSprite;

	var weekname:FlxSprite;
	
	var normalmode:FlxSprite;
	var easymode:FlxSprite;
	var hardmode:FlxSprite;

	var goback:FlxSprite;

	var gobutton:FlxSprite;


	var prevbutton:FlxSprite;
	var nextbutton:FlxSprite;

	var fade:FlxSprite;
	var curWeek:Int = 7;

	override public function create():Void
	{
		//BIRDY DECORATIONS YK
		
		freddybg = new FlxSprite(0, 0);
		freddybg.frames = Paths.getSparrowAtlas('menuimages/fedy','shared');
		freddybg.animation.addByPrefix('idle', 'BF idle dance white', 24, true);
		freddybg.animation.addByPrefix('confirm', 'BF HEY!!', 24, false);



		staticeffect = new FlxSprite(0, 0);
		staticeffect.frames = Paths.getSparrowAtlas('static','shared');
		staticeffect.animation.addByPrefix('idle', 'static_effect', 24, true);



		songlist = new FlxSprite(0, 0);
		songlist.loadGraphic(Paths.image('menuimages/songmenu','shared'));

		nextbutton = new FlxSprite(900, 80);
		nextbutton.loadGraphic(Paths.image('menuimages/next','shared'));
		nextbutton.setGraphicSize(Std.int(nextbutton.width + 6));
		prevbutton = new FlxSprite(850, 80);
		prevbutton.loadGraphic(Paths.image('menuimages/prev','shared'));
		prevbutton.setGraphicSize(Std.int(prevbutton.width + 6));

		weekname = new FlxSprite(0, 0);
		weekname.loadGraphic(Paths.image('menuimages/curweekname','shared'));

		normalmode = new FlxSprite(0, 0);
		normalmode.loadGraphic(Paths.image('menuimages/normaldif','shared'));
		easymode = new FlxSprite(0, 0);
		easymode.loadGraphic(Paths.image('menuimages/easydif','shared'));
		hardmode = new FlxSprite(0, 0);
		hardmode.loadGraphic(Paths.image('menuimages/harddif','shared'));

		goback = new FlxSprite(0, 0);
		goback.loadGraphic(Paths.image('menuimages/xback','shared'));

		gobutton = new FlxSprite(500, 600);
		gobutton.loadGraphic(Paths.image('menuimages/go','shared'));

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
		



		


		

		



		
		
		
		add(freddybg);
		add(weekname);
		add(songlist);
		add(goback);
		add(gobutton);
		add(normalmode);
		add(easymode);
		add(hardmode);
		add(nextbutton);
		add(prevbutton);
		add(staticeffect);
		add(fade);


		freddybg.animation.play('idle');
		staticeffect.animation.play('idle');
		staticeffect.alpha = 1;
		normalmode.visible = true;
		easymode.visible = false;
		hardmode.visible = false;
		fade.alpha = 0;

		new FlxTimer().start(0.1, function(tmr:FlxTimer)
		{
			FlxTween.tween(staticeffect, {alpha: 0.1}, 1, {ease: FlxEase.circOut, type: ONESHOT});
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
			
		}

		
	}

	

	var transitioning:Bool = false;
	var selectedWeek:Bool = false;

	

	override function update(elapsed:Float)
	{
		
	

		if(FlxG.keys.justPressed.ENTER)
		{
			freddybg.animation.play('confirm');

			FlxG.sound.play(Paths.sound('confirmMenu', 'preload'));
			FlxG.sound.play(Paths.sound('robot', 'shared'), 1, false);

			
			new FlxTimer().start(1, function(tmr:FlxTimer)
			{
				FlxTween.tween(staticeffect, {alpha: 1}, 1, {ease: FlxEase.circOut, type: ONESHOT});
				FlxTween.tween(fade, {alpha: 1}, 1, {ease: FlxEase.circOut, type: ONESHOT});
				FlxG.sound.music.fadeOut(1, 0);
			    new FlxTimer().start(3, function(tmr:FlxTimer)
				{
					if(normalmode.visible == true && hardmode.visible == false && easymode.visible == false)
					{
						

						FlxG.switchState(new CutsceneOne());
						
					}
					else if(normalmode.visible == false && hardmode.visible == true && easymode.visible == false)
					{
						// PlayState.SONG = Song.loadFromJson("nightshift-hard","nightshift-hard");
			            // PlayState.isStoryMode = true;
			            // PlayState.storyDifficulty = 1;

			            // PlayState.storyWeek = 8;
			            // LoadingState.loadAndSwitchState(new PlayState());
						FlxG.switchState(new CutsceneOneHard());
					}
					else if(normalmode.visible == false && hardmode.visible == false && easymode.visible == true)
					{
						// PlayState.SONG = Song.loadFromJson("nightshift-easy","nightshift-easy");
			            // PlayState.isStoryMode = true;
			            // PlayState.storyDifficulty = 1;

			            // PlayState.storyWeek = 9;
			            // LoadingState.loadAndSwitchState(new PlayState());
						FlxG.switchState(new CutsceneOneEasy());
					}
						
				});
			});
		}
		if(FlxG.keys.justPressed.X)
		{
			FlxG.sound.play(Paths.sound('clickone','shared'));
			new FlxTimer().start(1, function(tmr:FlxTimer)
			{
				FlxTween.tween(staticeffect, {alpha: 1}, 1, {ease: FlxEase.circOut, type: ONESHOT});
				new FlxTimer().start(3, function(tmr:FlxTimer)
				{
					FlxG.switchState(new AnimatronicMenu());
							
				});
			});
		}
		

		if(FlxG.mouse.overlaps(nextbutton))
		{
			nextbutton.color = FlxColor.PURPLE;

			if(FlxG.mouse.justPressed)
			{
				FlxG.sound.play(Paths.sound('clickone','shared'));
			}
		}
		else
		{
			nextbutton.color = FlxColor.WHITE;
		}

		if(FlxG.mouse.overlaps(prevbutton))
		{
			prevbutton.color = FlxColor.PURPLE;
			if(FlxG.mouse.justPressed)
			{
				FlxG.sound.play(Paths.sound('clickone','shared'));
			}
		}
		else
		{
			prevbutton.color = FlxColor.WHITE;
		}

		if(FlxG.mouse.overlaps(gobutton))
		{
			gobutton.color = FlxColor.GREEN;
			if(FlxG.mouse.justPressed)
			{
				freddybg.animation.play('confirm');

			    FlxG.sound.play(Paths.sound('confirmMenu', 'preload'));
				FlxG.sound.play(Paths.sound('robot', 'shared'));

			
			    new FlxTimer().start(1, function(tmr:FlxTimer)
			    {
				    FlxTween.tween(staticeffect, {alpha: 1}, 1, {ease: FlxEase.circOut, type: ONESHOT});
				    FlxTween.tween(fade, {alpha: 1}, 1, {ease: FlxEase.circOut, type: ONESHOT});
				    FlxG.sound.music.fadeOut(1, 0);
			        new FlxTimer().start(3, function(tmr:FlxTimer)
				    {
					    if(normalmode.visible == true && hardmode.visible == false && easymode.visible == false)
					    {
						    FlxG.switchState(new CutsceneOne());
					    }
					    else if(normalmode.visible == false && hardmode.visible == true && easymode.visible == false)
					    {
						    FlxG.switchState(new CutsceneOneHard());
					    }
					    else if(normalmode.visible == false && hardmode.visible == false && easymode.visible == true)
					    {
						    FlxG.switchState(new CutsceneOneEasy());
					    }
						
				    });
			    });
			}
		}
		else
		{
			gobutton.color = FlxColor.WHITE;
		}
		

		if(FlxG.mouse.overlaps(nextbutton) && normalmode.visible == true && easymode.visible == false && hardmode.visible == false)
		{
			if(FlxG.mouse.justPressed)
			{
				normalmode.visible = false;
			    easymode.visible = false;
			    hardmode.visible = true;
			}
		}
		else if(FlxG.mouse.overlaps(nextbutton) && normalmode.visible == false && easymode.visible == false && hardmode.visible == true)
		{
			if(FlxG.mouse.justPressed)
			{
				normalmode.visible = false;
			    easymode.visible = true;
			    hardmode.visible = false;
			}
		}
		else if(FlxG.mouse.overlaps(nextbutton) && normalmode.visible == false && easymode.visible == true && hardmode.visible == false)
		{
			if(FlxG.mouse.justPressed)
			{
				normalmode.visible = true;
			    easymode.visible = false;
			    hardmode.visible = false;
			}
		}



		if(FlxG.mouse.overlaps(prevbutton) && normalmode.visible == true && easymode.visible == false && hardmode.visible == false)
		{
			if(FlxG.mouse.justPressed)
			{
				normalmode.visible = false;
				easymode.visible = true;
				hardmode.visible = false;
			}
		}
		else if(FlxG.mouse.overlaps(prevbutton) && normalmode.visible == false && easymode.visible == false && hardmode.visible == true)
		{
			if(FlxG.mouse.justPressed)
			{
				normalmode.visible = true;
				easymode.visible = false;
				hardmode.visible = false;
			}
		}
		else if(FlxG.mouse.overlaps(prevbutton) && normalmode.visible == false && easymode.visible == true && hardmode.visible == false)
		{
			if(FlxG.mouse.justPressed)
			{
				normalmode.visible = false;
				easymode.visible = false;
				hardmode.visible = true;
			}
		}

		super.update(elapsed);
	}

	
}


