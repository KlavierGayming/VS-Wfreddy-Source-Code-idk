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

class FreddyFreeplay extends MusicBeatState
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


	// Animatronics

	var fedy:FlxSprite;
	var pup:FlxSprite;
	var fanfsevenloregodisheremabois:FlxSprite;


	

	override public function create():Void
	{
		//BIRDY DECORATIONS YK
		
		bg = new FlxSprite(-1010, -600);
		bg.loadGraphic(Paths.image('menuimages/freeplaybg','shared'));

		ui = new FlxSprite(0, 0);
		ui.loadGraphic(Paths.image('menuimages/freeplayui','shared'));
		uiglitch = new FlxSprite(0, 0);
		uiglitch.loadGraphic(Paths.image('menuimages/freeplayuitwo','shared'));

		phaseone = new FlxSprite(0, 0);
		phaseone.loadGraphic(Paths.image('menuimages/curphase','shared'));
		phasetwo = new FlxSprite(0, 0);
		phasetwo.loadGraphic(Paths.image('menuimages/curphase_two','shared'));
		phasethree = new FlxSprite(0, 0);
		phasethree.loadGraphic(Paths.image('menuimages/curphase_three','shared'));

		descone = new FlxSprite(0, 0);
		descone.loadGraphic(Paths.image('menuimages/desc_one','shared'));
		desctwo = new FlxSprite(0, 0);
		desctwo.loadGraphic(Paths.image('menuimages/desc_two','shared'));
		descthree = new FlxSprite(0, 0);
		descthree.loadGraphic(Paths.image('menuimages/desc_three','shared'));

		songone = new FlxSprite(100, 100);
		songone.loadGraphic(Paths.image('menuimages/song_one','shared'));
		songtwo = new FlxSprite(100, 190);
		songtwo.loadGraphic(Paths.image('menuimages/song_two','shared'));
		songthree = new FlxSprite(100, 270);
		songthree.loadGraphic(Paths.image('menuimages/song_three','shared'));



		staticeffect = new FlxSprite(0, 0);
		staticeffect.frames = Paths.getSparrowAtlas('static','shared');
		staticeffect.animation.addByPrefix('idle', 'static_effect', 24, true);


		fedy = new FlxSprite(0, 0);
		fedy.frames = Paths.getSparrowAtlas('menuimages/freddy_shake','shared');
		fedy.animation.addByPrefix('idle', 'Freddy shake', 24, true);

		pup = new FlxSprite(0, 0);
		pup.frames = Paths.getSparrowAtlas('menuimages/puppet_freeplay','shared');
		pup.animation.addByPrefix('idle', 'Puppet shake', 24, true);

		fanfsevenloregodisheremabois = new FlxSprite(0, 0);
		fanfsevenloregodisheremabois.frames = Paths.getSparrowAtlas('menuimages/bonnie_freeplay','shared');
		fanfsevenloregodisheremabois.animation.addByPrefix('idle', 'bonnie shake', 24, true);



		fade = new FlxSprite(0, 0);
		fade.makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		fade.width = FlxG.width;
		fade.height = FlxG.height;

		goback = new FlxSprite(0, 0);
		goback.loadGraphic(Paths.image('menuimages/xback','shared'));

		gobutton = new FlxSprite(500, 600);
		gobutton.loadGraphic(Paths.image('menuimages/go','shared'));

		lineeffect = new FlxSprite(0, 0);
		lineeffect.loadGraphic(Paths.image('shadowbonniebgs/lines','shared'));



		
		



		FlxG.sound.music.fadeOut(1, 0);
		


		

		



		
		
		
		add(bg);
		add(fedy);
		add(pup);
		add(fanfsevenloregodisheremabois);

		add(ui);
		add(uiglitch);
		add(phaseone);
		add(phasetwo);
		add(phasethree);
		add(descone);
		add(desctwo);
		add(descthree);
		add(songone);
		add(songtwo);
		add(songthree);


		add(goback);
		add(gobutton);
		add(lineeffect);
		
		
		add(staticeffect);
		add(fade);


		
		staticeffect.animation.play('idle');
		staticeffect.alpha = 1;
		fade.alpha = 0;

		phaseone.visible = false;
		phasetwo.visible = false;
		phasethree.visible = false;
		descone.visible = false;
		desctwo.visible = false;
		descthree.visible = false;
		uiglitch.visible = false;
		fedy.visible = false;
		pup.visible = false;
		fanfsevenloregodisheremabois.visible = false;
		ui.visible = true;


		

		fedy.animation.play('idle', true);
		pup.animation.play('idle', true);
		fanfsevenloregodisheremabois.animation.play('idle', true);

		lineeffect.visible = false;

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

	override function update(elapsed:Float)
	{

		
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
		if(FlxG.mouse.overlaps(gobutton))
		{
			gobutton.color = FlxColor.GREEN;
			if(FlxG.mouse.justPressed)
			{
				if(descone.visible == true && desctwo.visible == false && descthree.visible == false)
				{
					FlxTween.tween(fade, {alpha: 1}, 1, {ease: FlxEase.circOut, type: ONESHOT});
					new FlxTimer().start(2, function(tmr:FlxTimer)
					{
						PlayState.SONG = Song.loadFromJson("nightshift-freeplay","nightshift-freeplay");
			            PlayState.isStoryMode = true;
			            PlayState.storyDifficulty = 1;

			            PlayState.storyWeek = 10;
			            LoadingState.loadAndSwitchState(new PlayState());
									
					});
				}
				else if(descone.visible == false && desctwo.visible == true && descthree.visible == false)
				{
					FlxTween.tween(fade, {alpha: 1}, 1, {ease: FlxEase.circOut, type: ONESHOT});
					new FlxTimer().start(2, function(tmr:FlxTimer)
					{
						PlayState.SONG = Song.loadFromJson("flashinglights-freeplay","flashinglights-freeplay");
			            PlayState.isStoryMode = true;
			            PlayState.storyDifficulty = 1;

			            PlayState.storyWeek = 10;
			            LoadingState.loadAndSwitchState(new PlayState());
									
					});
				}
				else if(descone.visible == false && desctwo.visible == false && descthree.visible == true)
				{
					FlxTween.tween(fade, {alpha: 1}, 1, {ease: FlxEase.circOut, type: ONESHOT});
					new FlxTimer().start(2, function(tmr:FlxTimer)
					{
						PlayState.SONG = Song.loadFromJson("shadows-freeplay","shadows-freeplay");
			            PlayState.isStoryMode = true;
			            PlayState.storyDifficulty = 1;

			            PlayState.storyWeek = 10;
			            LoadingState.loadAndSwitchState(new PlayState());
									
					});
				}
			}
		}
		else
		{
			gobutton.color = FlxColor.WHITE;
		}


		if(FlxG.mouse.overlaps(songone))
		{
			songone.alpha = 0.5;
			if(FlxG.mouse.justPressed)
			{
				FlxG.sound.play(Paths.sound('clickone','shared'));
				phaseone.visible = true;
				phasetwo.visible = false;
				phasethree.visible = false;

				descone.visible = true;
				desctwo.visible = false;
				descthree.visible = false;

				ui.visible = true;
				uiglitch.visible = false;

				staticeffect.alpha = 0.1;
				staticeffect.color = FlxColor.WHITE;

				fedy.visible = true;
				pup.visible = false;
				fanfsevenloregodisheremabois.visible = false;


				fedy.x = 300;
				new FlxTimer().start(0.1, function(tmr:FlxTimer)
				{
					FlxTween.tween(fedy, {x: 0}, 1, {type: ONESHOT, ease: FlxEase.circOut});
				});

				lineeffect.visible = false;
				FlxG.sound.music.fadeOut(0.2, 0);

				new FlxTimer().start(0.1, function(tmr:FlxTimer)
				{
					FlxG.sound.music.loadEmbedded(Paths.inst("Nightshift"));
				    FlxG.sound.music.fadeIn(2, 0, 1);
				});
			}
		}
		else
		{
			songone.alpha = 1;
		}

		if(FlxG.mouse.overlaps(songtwo))
		{
			songtwo.alpha = 0.5;
			if(FlxG.mouse.justPressed)
			{
				FlxG.sound.play(Paths.sound('clickone','shared'));
				phaseone.visible = false;
				phasetwo.visible = true;
				phasethree.visible = false;

				descone.visible = false;
				desctwo.visible = true;
				descthree.visible = false;

				ui.visible = true;
				uiglitch.visible = false;

				fedy.visible = false;
				pup.visible = true;
				fanfsevenloregodisheremabois.visible = false;

				pup.x = 300;
				new FlxTimer().start(0.1, function(tmr:FlxTimer)
				{
					FlxTween.tween(pup, {x: 0}, 1, {type: ONESHOT, ease: FlxEase.circOut});
				});

				staticeffect.alpha = 0.1;
				staticeffect.color = FlxColor.WHITE;

				lineeffect.visible = false;

				FlxG.sound.music.fadeOut(0.2, 0);

				new FlxTimer().start(0.1, function(tmr:FlxTimer)
				{
					FlxG.sound.music.loadEmbedded(Paths.inst("Flashinglights"));
				    FlxG.sound.music.fadeIn(2, 0, 1);
				});



                
			}
		}
		else
		{
			songtwo.alpha = 1;
		}

		if(FlxG.mouse.overlaps(songthree))
		{
			songthree.alpha = 0.5;
			if(FlxG.mouse.justPressed)
			{
				FlxG.sound.play(Paths.sound('clickone','shared'));
				phaseone.visible = false;
				phasetwo.visible = false;
				phasethree.visible = true;

				descone.visible = false;
				desctwo.visible = false;
				descthree.visible = true;

				ui.visible = false;
				uiglitch.visible = true;

				fedy.visible = false;
				pup.visible = false;
				fanfsevenloregodisheremabois.visible = true;

				fanfsevenloregodisheremabois.x = 300;
				new FlxTimer().start(0.1, function(tmr:FlxTimer)
				{
					FlxTween.tween(fanfsevenloregodisheremabois, {x: 0}, 1, {type: ONESHOT, ease: FlxEase.circOut});
				});

				staticeffect.alpha = 0.2;
				staticeffect.color = FlxColor.PURPLE;

				lineeffect.visible = true;

				new FlxTimer().start(0.1, function(tmr:FlxTimer)
				{
					FlxG.sound.music.loadEmbedded(Paths.inst("Shadows"));
					FlxG.sound.music.fadeIn(2, 0, 1);
				});
			}
		}
		else
		{
			songthree.alpha = 1;
		}

		

		super.update(elapsed);
	}

	
}


