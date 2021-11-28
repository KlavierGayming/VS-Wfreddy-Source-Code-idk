//SERGIO EVENT

package;

import lime.system.System;
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

class AnimatronicMenu extends MusicBeatState
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

	var bgone:FlxSprite;
	var bgtwo:FlxSprite;
	var bgthree:FlxSprite;
	var bgfour:FlxSprite;

	var title:FlxSprite;
	var newgame:FlxSprite;
	var freeplaybutton:FlxSprite;
	var settingsbutton:FlxSprite;
	var exitbutton:FlxSprite;

	var staticeffect:FlxSprite;

	var fade:FlxSprite;

	var keys:Array<String>;

	var staticsound:FlxSound;

	var sureexit:FlxSprite;
	var togglething:FlxSprite;

	override public function create():Void
	{
		//BIRDY DECORATIONS YK
		
		bgone = new FlxSprite(0, 0);
		bgone.loadGraphic(Paths.image('mainmenu/menu1','shared'));
		bgtwo = new FlxSprite(0, 0);
		bgtwo.loadGraphic(Paths.image('mainmenu/menu2','shared'));
		bgthree = new FlxSprite(0, 0);
		bgthree.loadGraphic(Paths.image('mainmenu/menu3','shared'));
		bgfour = new FlxSprite(0, 0);
		bgfour.loadGraphic(Paths.image('mainmenu/menu4','shared'));

		title = new FlxSprite(-80, -20);
		title.loadGraphic(Paths.image('menuimages/menulogo','shared'));
		title.setGraphicSize(Std.int(title.width / 1.5));

		newgame = new FlxSprite(30, 320);
		newgame.loadGraphic(Paths.image('menuimages/newgame','shared'));

		freeplaybutton = new FlxSprite(30, 400);
		freeplaybutton.loadGraphic(Paths.image('menuimages/freeplay','shared'));

		settingsbutton = new FlxSprite(30, 480);
		settingsbutton.loadGraphic(Paths.image('menuimages/settings','shared'));

		exitbutton = new FlxSprite(30, 560);
		exitbutton.loadGraphic(Paths.image('menuimages/exit','shared'));

		sureexit = new FlxSprite(-300, -200);
		sureexit.loadGraphic(Paths.image('menuimages/warningexit','shared'));
		sureexit.setGraphicSize(Std.int(sureexit.width / 2));
		sureexit.alpha = 0;

		togglething = new FlxSprite(0, 0);
		togglething.loadGraphic(Paths.image('menuimages/toggle','shared'));






		staticeffect = new FlxSprite(0, 0);
		staticeffect.frames = Paths.getSparrowAtlas('static','shared');
		staticeffect.animation.addByPrefix('idle', 'static_effect', 24, true);


		fade = new FlxSprite(0, 0);
		fade.makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		fade.width = FlxG.width;
		fade.height = FlxG.height;



		staticsound = FlxG.sound.load(Paths.sound('fnafstatic', 'shared'), 0.5, true);



		new FlxTimer().start(7, function(tmr:FlxTimer)
		{
			FlxTween.tween(FlxG.camera, {zoom: FlxG.camera.zoom + 0.03}, 3, {ease: FlxEase.circOut, type: ONESHOT});
			new FlxTimer().start(5, function(tmr:FlxTimer)
			{
				FlxTween.tween(FlxG.camera, {zoom: FlxG.camera.zoom - 0.03}, 3, {ease: FlxEase.circOut, type: ONESHOT});
			});
		}, 0);
		



		


		FlxG.sound.playMusic(Paths.music('fnaftwo'), 0.5);
		FlxG.sound.music.fadeIn(1, 0, 1);

		



		
		
		
		add(bgone);
		add(bgtwo);
		add(bgthree);
		add(bgfour);
		add(togglething);
		add(title);
		add(newgame);
		add(freeplaybutton);
		add(settingsbutton);
		add(exitbutton);
		
		add(sureexit);
		
		add(staticeffect);

		add(fade);

		bgone.visible = true;
		bgtwo.visible = false;
		bgthree.visible = false;
		bgfour.visible = false;


		
		staticeffect.animation.play('idle');
		staticeffect.alpha = 1;
		fade.alpha = 1;

		new FlxTimer().start(0.1, function(tmr:FlxTimer)
		{
			FlxTween.tween(staticeffect, {alpha: 0.1}, 1, {ease: FlxEase.circOut, type: ONESHOT});
			FlxTween.tween(fade, {alpha: 0}, 0.5, {ease: FlxEase.circOut, type: ONESHOT});
		});

		new FlxTimer().start(20, function(tmr:FlxTimer)
		{
			bgone.visible = false;
			bgtwo.visible = true;
			bgthree.visible = false;
			bgfour.visible = false;
			FlxG.camera.shake(0.02, 1);
			staticsound.play();
			new FlxTimer().start(5, function(tmr:FlxTimer)
			{
				bgone.visible = false;
			    bgtwo.visible = false;
			    bgthree.visible = true;
			    bgfour.visible = false;
				FlxG.camera.shake(0.02, 1);
				staticsound.play();
				new FlxTimer().start(1, function(tmr:FlxTimer)
				{
					bgone.visible = true;
					bgtwo.visible = false;
					bgthree.visible = false;
					bgfour.visible = false;
					staticsound.stop();
				});
			});
			new FlxTimer().start(10, function(tmr:FlxTimer)
			{
				bgone.visible = false;
				bgtwo.visible = false;
				bgthree.visible = false;
				bgfour.visible = true;
				FlxG.camera.shake(0.02, 1);
				staticsound.play();
				new FlxTimer().start(1, function(tmr:FlxTimer)
				{
					bgone.visible = true;
					bgtwo.visible = false;
					bgthree.visible = false;
					bgfour.visible = false;
					staticsound.stop();
				});
			});
			new FlxTimer().start(1, function(tmr:FlxTimer)
			{
				bgone.visible = true;
				bgtwo.visible = false;
				bgthree.visible = false;
				bgfour.visible = false;
				staticsound.stop();
			});
		}, 0);
		new FlxTimer().start(5, function(tmr:FlxTimer)
		{
			bgone.visible = false;
			bgtwo.visible = true;
			bgthree.visible = false;
			bgfour.visible = false;
			FlxG.camera.shake(0.02, 1);
			staticsound.play();
			new FlxTimer().start(1, function(tmr:FlxTimer)
			{
				bgone.visible = true;
				bgtwo.visible = false;
				bgthree.visible = false;
				bgfour.visible = false;
				staticsound.stop();
			});
		});
		new FlxTimer().start(10, function(tmr:FlxTimer)
		{
			bgone.visible = false;
			bgtwo.visible = false;
			bgthree.visible = true;
			bgfour.visible = false;
			FlxG.camera.shake(0.02, 1);
			staticsound.play();
			
			new FlxTimer().start(1, function(tmr:FlxTimer)
			{
				bgone.visible = true;
				bgtwo.visible = false;
				bgthree.visible = false;
				bgfour.visible = false;
				staticsound.stop();
			});
		});
		new FlxTimer().start(15, function(tmr:FlxTimer)
		{
			bgone.visible = false;
			bgtwo.visible = false;
			bgthree.visible = false;
			bgfour.visible = true;
			FlxG.camera.shake(0.02, 1);
			staticsound.play();
			new FlxTimer().start(1, function(tmr:FlxTimer)
			{
				bgone.visible = true;
				bgtwo.visible = false;
				bgthree.visible = false;
				bgfour.visible = false;
				staticsound.stop();
			});
		});




		FlxG.mouse.visible = true;

		keys = [FlxG.save.data.leftBind, 
			FlxG.save.data.downBind, 
			FlxG.save.data.upBind, 
			FlxG.save.data.rightBind, 
			FlxG.save.data.killBind];



		FlxG.save.data.upBind = keys[2];
        FlxG.save.data.downBind = keys[1];
        FlxG.save.data.leftBind = keys[0];
        FlxG.save.data.rightBind = keys[3];
        FlxG.save.data.killBind = keys[4];
        PlayerSettings.player1.controls.loadKeyBinds();



		



		

		
		
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

	override function update(elapsed:Float)
	{
		

		if(FlxG.keys.justPressed.ENTER)
		{
			

			
			new FlxTimer().start(1, function(tmr:FlxTimer)
			{
				FlxTween.tween(staticeffect, {alpha: 1}, 1, {ease: FlxEase.circOut, type: ONESHOT});
			    new FlxTimer().start(3, function(tmr:FlxTimer)
				{
					FlxG.switchState(new FreddyMenu());
						
				});
			});
			
		}

		if(FlxG.keys.justPressed.G)
		{
			FlxG.save.data.downscroll = !FlxG.save.data.downscroll;
			FlxG.sound.play(Paths.sound('clickone', 'shared'));
		}
		if(FlxG.keys.justPressed.H)
		{
			FlxG.switchState(new KeyBindMenu());
			
		}
		

		if(FlxG.mouse.overlaps(newgame))
		{
			newgame.alpha = 0.5;
			freeplaybutton.alpha = 1;
			settingsbutton.alpha = 1;
			exitbutton.alpha = 1;
			if(FlxG.mouse.justPressed)
			{
				new FlxTimer().start(1, function(tmr:FlxTimer)
				{
					FlxTween.tween(staticeffect, {alpha: 1}, 1, {ease: FlxEase.circOut, type: ONESHOT});
					new FlxTimer().start(3, function(tmr:FlxTimer)
					{
						FlxG.switchState(new FreddyMenu());
								
					});
				});
				FlxG.sound.play(Paths.sound('clickone','shared'));
			}
		}
		else if(FlxG.mouse.overlaps(freeplaybutton))
		{
			newgame.alpha = 1;
			freeplaybutton.alpha = 0.5;
			settingsbutton.alpha = 1;
			exitbutton.alpha = 1;
			if(FlxG.mouse.justPressed)
			{
				new FlxTimer().start(1, function(tmr:FlxTimer)
				{
					FlxTween.tween(staticeffect, {alpha: 1}, 1, {ease: FlxEase.circOut, type: ONESHOT});
					new FlxTimer().start(3, function(tmr:FlxTimer)
					{
						FlxG.switchState(new FreddyFreeplay());
									
					});
				});
				FlxG.sound.play(Paths.sound('clickone','shared'));
			}

		}
		else if(FlxG.mouse.overlaps(settingsbutton))
		{
			newgame.alpha = 1;
			freeplaybutton.alpha = 1;
			settingsbutton.alpha = 0.5;
			exitbutton.alpha = 1;
			if(FlxG.mouse.justPressed)
			{
				new FlxTimer().start(0.5, function(tmr:FlxTimer)
				{
					FlxG.switchState(new SettingsMenu());
				});
				FlxG.sound.play(Paths.sound('clickone','shared'));
			}

		}
		else if(FlxG.mouse.overlaps(exitbutton))
		{
			newgame.alpha = 1;
			freeplaybutton.alpha = 1;
			settingsbutton.alpha = 1;
			exitbutton.alpha = 0.5;
			if(FlxG.mouse.justPressed)
			{
				new FlxTimer().start(0.01, function(tmr:FlxTimer)
				{
					FlxTween.tween(sureexit, {alpha: 1}, 0.5, {ease: FlxEase.circOut, type: ONESHOT});
						
				});
				FlxG.sound.play(Paths.sound('clickone','shared'));
			}
	
		}
		else
		{
			newgame.alpha = 1;
			freeplaybutton.alpha = 1;
			settingsbutton.alpha = 1;
			exitbutton.alpha = 1;
		}

		if(sureexit.alpha == 1)
		{
			if(FlxG.keys.justPressed.Y)
			{
				System.exit(0);
				FlxG.sound.play(Paths.sound('clickone','shared'));
			}
			if(FlxG.keys.justPressed.N)
			{
				new FlxTimer().start(0.01, function(tmr:FlxTimer)
				{
					FlxTween.tween(sureexit, {alpha: 0}, 0.5, {ease: FlxEase.circOut, type: ONESHOT});
							
				});
				FlxG.sound.play(Paths.sound('clickone','shared'));
			}

		}
		if(FlxG.keys.justPressed.F)
		{
			
			FlxG.sound.play(Paths.sound('clickone','shared'));
			FlxG.fullscreen = true;
			FlxG.camera.color = FlxColor.GRAY;
		}

		if(FlxG.keys.justPressed.M)
		{
				
			FlxG.switchState(new Minigame());
		}
		

		super.update(elapsed);
	}

	
}


