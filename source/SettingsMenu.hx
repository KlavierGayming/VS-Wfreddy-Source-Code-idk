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

class SettingsMenu extends MusicBeatState
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
	var ui:FlxSprite;

	// Main Buttons

	var keybinds:FlxSprite;
	var scrollings:FlxSprite;
	var check:FlxSprite;
	var checktwo:FlxSprite;
	var flashings:FlxSprite;
	var bb:FlxSprite;
	var up:FlxSprite;
	var down:FlxSprite;
	var pressp:FlxSprite;
	var downscroll:FlxSprite;
	var upscroll:FlxSprite;

	var backtext:FlxText;


	override public function create():Void
	{
		//BIRDY DECORATIONS YK
		
		



		staticeffect = new FlxSprite(0, 0);
		staticeffect.frames = Paths.getSparrowAtlas('static','shared');
		staticeffect.animation.addByPrefix('idle', 'static_effect', 24, true);

		bg = new FlxSprite(0, 0);
		bg.loadGraphic(Paths.image('menuimages/bgsettings','shared'));

		ui = new FlxSprite(0, 0);
		ui.loadGraphic(Paths.image('menuimages/settingsui','shared'));

		keybinds = new FlxSprite(300, 200);
		keybinds.loadGraphic(Paths.image('menuimages/keybinds','shared'));

		scrollings = new FlxSprite(650, 200);
		scrollings.loadGraphic(Paths.image('menuimages/scrollings','shared'));

		check = new FlxSprite(600, 300);
		check.loadGraphic(Paths.image('menuimages/check','shared'));


		checktwo = new FlxSprite(600, 460);
		checktwo.loadGraphic(Paths.image('menuimages/check','shared'));

		flashings = new FlxSprite(400, 300);
		flashings.loadGraphic(Paths.image('menuimages/flashings','shared'));

		bb = new FlxSprite(400, 460);
		bb.loadGraphic(Paths.image('menuimages/bbdisable','shared'));


		downscroll = new FlxSprite(490, 180);
		downscroll.loadGraphic(Paths.image('menuimages/downscroll','shared'));

		upscroll = new FlxSprite(490, 480);
		upscroll.loadGraphic(Paths.image('menuimages/upscroll','shared'));

		down = new FlxSprite(490, 280);
		down.loadGraphic(Paths.image('menuimages/down','shared'));

		up = new FlxSprite(490, 380);
		up.loadGraphic(Paths.image('menuimages/up','shared'));
		
		pressp = new FlxSprite(450, 400);
		pressp.loadGraphic(Paths.image('menuimages/pressp','shared'));

		backtext = new FlxText(240, 580, 0, "More settings coming soon.", 24, false);
		backtext.color = FlxColor.WHITE;
		backtext.borderColor = FlxColor.BLACK;
		backtext.borderSize = 12;




		



		
		



		


		

		



		
		
		
		add(bg);
		add(ui);

		add(keybinds);
		add(scrollings);
		add(flashings);
		add(bb);

		add(downscroll);
		add(upscroll);
		add(down);
		add(up);
		add(pressp);
		

		add(backtext);
		add(check);
		add(checktwo);
		
		add(staticeffect);


		
		staticeffect.animation.play('idle');
		staticeffect.alpha = 1;

		keybinds.visible = true;
		scrollings.visible = true;
		flashings.visible = true;
		bb.visible = true;
		downscroll.visible = false;
		upscroll.visible = false;
		down.visible = false;
		up.visible = false;
		pressp.visible = true;

		check.alpha = 1;
		check.visible = true;
		checktwo.alpha = 1;
		checktwo.visible = true;
		

		keybinds.alpha = 1;
		scrollings.alpha = 1;
		flashings.alpha = 1;
		bb.alpha = 1;
		downscroll.alpha = 1;
		upscroll.alpha = 1;

		

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
			

			
		}

		
	}

	

	var transitioning:Bool = false;

	override function update(elapsed:Float)
	{

		if(FlxG.save.data.downscroll == true)
		{
			down.alpha = 1;
			up.alpha = 0.5;
		}
		else if(FlxG.save.data.downscroll == false)
		{
			down.alpha = 0.5;
			up.alpha = 1;
		}


		if(FlxG.save.data.flashings == true)
		{
			check.alpha = 1;
			
		}
		else if(FlxG.save.data.flashings == false)
		{
			check.alpha = 0.5;
			
		}


		if(FlxG.save.data.bbdisable == true)
		{
			checktwo.alpha = 1;
		}
		else if(FlxG.save.data.bbdisable == false)
		{
			checktwo.alpha = 0.5;
		}

		if(FlxG.keys.justPressed.X)
		{

			FlxG.sound.play(Paths.sound('clickone', 'shared'));
		

			

			
			new FlxTimer().start(1, function(tmr:FlxTimer)
			{
				FlxTween.tween(staticeffect, {alpha: 1}, 1, {ease: FlxEase.circOut, type: ONESHOT});
			    new FlxTimer().start(3, function(tmr:FlxTimer)
				{
					FlxG.switchState(new AnimatronicMenu());
						
				});
			});
		}

		if(FlxG.mouse.overlaps(keybinds) && keybinds.visible == true)
		{
			keybinds.alpha = 0.5;
			scrollings.alpha = 1;
			flashings.alpha = 1;
			bb.alpha = 1;
			if(FlxG.mouse.justPressed)
			{
				FlxG.switchState(new KeyBindMenu());
			}
		}
		else if(FlxG.mouse.overlaps(scrollings) && scrollings.visible == true)
		{
			keybinds.alpha = 1;
			scrollings.alpha = 0.5;
			flashings.alpha = 1;
			bb.alpha = 1;
			if(FlxG.mouse.justPressed)
			{
				FlxG.sound.play(Paths.sound('clickone', 'shared'));
				keybinds.visible = false;
				scrollings.visible = false;
				flashings.visible = false;
				
				downscroll.visible = true;
				upscroll.visible = true;
				up.visible = true;
				down.visible = true;
				check.visible = false;
				bb.visible = false;
				checktwo.visible = false;
			}
		}
		else if(FlxG.mouse.overlaps(flashings) && flashings.visible == true)
		{
			keybinds.alpha = 1;
			scrollings.alpha = 1;
			flashings.alpha = 0.5;
			bb.alpha = 1;
			if(FlxG.mouse.justPressed)
			{
				FlxG.sound.play(Paths.sound('clickone', 'shared'));
				if(FlxG.save.data.flashings == false)
				{
					FlxG.save.data.flashings = true;
				}
				else
				{
					FlxG.save.data.flashings = false;
				}





			}
		}
		else if(FlxG.mouse.overlaps(bb) && bb.visible == true)
		{
			keybinds.alpha = 1;
			scrollings.alpha = 1;
			flashings.alpha = 1;
			bb.alpha = 0.5;
			if(FlxG.mouse.justPressed)
			{
				FlxG.sound.play(Paths.sound('clickone', 'shared'));
				if(FlxG.save.data.bbdisable == false)
				{
					FlxG.save.data.bbdisable = true;
				}
				else
				{
					FlxG.save.data.bbdisable = false;
				}





			}
		}
		else
		{
			keybinds.alpha = 1;
			scrollings.alpha = 1;
			flashings.alpha = 1;
			bb.alpha = 1;
		}


		if(FlxG.mouse.overlaps(downscroll) && downscroll.visible == true)
		{
			downscroll.alpha = 0.5;
			upscroll.alpha = 1;

			if(FlxG.mouse.justPressed)
			{
				FlxG.sound.play(Paths.sound('clickone', 'shared'));
				FlxG.save.data.downscroll = true;
			}

		}
		else if(FlxG.mouse.overlaps(upscroll) && upscroll.visible == true)
		{
			downscroll.alpha = 1;
			upscroll.alpha = 0.5;
			if(FlxG.mouse.justPressed)
			{
				FlxG.sound.play(Paths.sound('clickone', 'shared'));
				FlxG.save.data.downscroll = false;
			}

		}
		else
		{
			downscroll.alpha = 1;
			upscroll.alpha = 1;

		}

		if(FlxG.keys.justPressed.P && down.visible == true)
		{
			FlxG.sound.play(Paths.sound('clickone', 'shared'));
			
			downscroll.visible = false;
			upscroll.visible = false;
			up.visible = false;
			down.visible = false;
			scrollings.visible = true;
			keybinds.visible = true;
			flashings.visible = true;
			bb.visible = true;
			checktwo.visible = true;
			check.visible = true;
		}

		if(FlxG.mouse.overlaps(scrollings))
		{
			if(FlxG.mouse.justPressed)
			{
				backtext.text = "Press P to go back to settings.";
			
			}
		}

		if(FlxG.keys.justPressed.P)
		{
			backtext.text = "Main settings.";
		}
		

		
		

		super.update(elapsed);
	}

	
}


