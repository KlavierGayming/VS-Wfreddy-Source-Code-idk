//SERGIO EVENT

package;

import flixel.FlxCamera;
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

class MinigameTwo extends MusicBeatState
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

	public var camHUD:FlxCamera;
	public var camGame:FlxCamera;
	public var myCAM:FlxCamera;

	var bg:FlxSprite;
	
	var lines:FlxSprite;
	var bf:FlxSprite;

	var obstacle:FlxSprite;
	var obstacletwo:FlxSprite;
	var obstaclethree:FlxSprite;
	var obstaclefour:FlxSprite;

	var gf:FlxSprite;

	var kidone:FlxSprite;
	var kidtwo:FlxSprite;



	var balloons:FlxSprite;


	var door:FlxSprite;
	


	override public function create():Void
	{
		//BIRDY DECORATIONS YK

		camGame = new FlxCamera();
		camHUD = new FlxCamera();
		myCAM = new FlxCamera();
		camHUD.bgColor.alpha = 0;
		myCAM.bgColor.alpha = 0;

		FlxG.cameras.reset(camGame);
		FlxG.cameras.add(camHUD);
		FlxG.cameras.add(myCAM);

		FlxCamera.defaultCameras = [camGame];
		
		



		staticeffect = new FlxSprite(0, 0);
		staticeffect.frames = Paths.getSparrowAtlas('static','shared');
		staticeffect.animation.addByPrefix('idle', 'static_effect', 24, true);

		bf = new FlxSprite(500, 200);
		bf.frames = Paths.getSparrowAtlas('secretminigame/bfminigame','shared');
		bf.animation.addByPrefix('idle', 'idle', 24, true);
		bf.animation.addByPrefix('left', 'left', 24, true);
		bf.animation.addByPrefix('right', 'right', 24, true);

		gf = new FlxSprite(500, -100);
		gf.frames = Paths.getSparrowAtlas('secretminigame/gfminigame','shared');
		gf.animation.addByPrefix('idle', 'idle', 24, true);

		balloons = new FlxSprite(500, 10);
		balloons.loadGraphic(Paths.image('secretminigame/balloons','shared'));
		balloons.setGraphicSize(Std.int(balloons.width * 2.6));

		kidone = new FlxSprite(600, 300);
		kidone.frames = Paths.getSparrowAtlas('secretminigame/kid','shared');
		kidone.animation.addByPrefix('idle', 'idle', 24, true);

		kidtwo = new FlxSprite(160, 400);
		kidtwo.frames = Paths.getSparrowAtlas('secretminigame/kid','shared');
		kidtwo.animation.addByPrefix('idle', 'idle', 24, true);
		
		

		bg = new FlxSprite(0, 0);
		bg.loadGraphic(Paths.image('secretminigame/minigameroom','shared'));
		

		obstacle = new FlxSprite(0, 0);
		obstacle.makeGraphic(50, FlxG.height, FlxColor.ORANGE);
		obstacletwo = new FlxSprite(0, 0);
		obstacletwo.makeGraphic(FlxG.width, 50, FlxColor.ORANGE);
		obstaclethree = new FlxSprite(1226, 0);
		obstaclethree.makeGraphic(50, FlxG.height, FlxColor.ORANGE);
		obstaclefour = new FlxSprite(0, 700);
		obstaclefour.makeGraphic(FlxG.width, 50, FlxColor.ORANGE);
		

	

		lines = new FlxSprite(0, 0);
		lines.loadGraphic(Paths.image('shadowbonniebgs/lines','shared'));


		door = new FlxSprite(500, 668);
		door.makeGraphic(200, 100, FlxColor.BROWN);
		
		
		
		add(bg);
		add(obstacle);
		add(obstacletwo);
		add(obstaclethree);
		add(obstaclefour);

		

		add(kidone);
		add(kidtwo);


		add(door);

		
		
		add(bf);
		add(balloons);

		add(lines);
		
		
		add(staticeffect);


		
		staticeffect.animation.play('idle');
		bf.animation.play('right');
		gf.animation.play('idle');
		kidone.animation.play('idle');
		kidtwo.animation.play('idle');
		staticeffect.alpha = 0.2;
		lines.cameras = [camHUD];
		staticeffect.cameras = [camHUD];
		bg.visible = false;

		obstaclethree.flipX = true;
		obstaclefour.flipY = true;

		
		

		
		




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

		FlxG.camera.target = bf;

		
		obstacle.immovable = true;
		obstacletwo.immovable = true;
		obstaclethree.immovable = true;
		obstaclefour.immovable = true;
		
		

		if(FlxG.keys.pressed.W)
		{
			bf.y = bf.y - 3;
		}
		else if(FlxG.keys.pressed.S)
		{
			bf.y = bf.y + 3;
		}
		else if(FlxG.keys.pressed.A)
		{
			bf.x = bf.x - 3;
		}
		else if(FlxG.keys.pressed.D)
		{
			bf.x = bf.x + 3;
		}

	
		if(FlxG.keys.justPressed.A)
		{
			bf.animation.play('left');
		}
		else if(FlxG.keys.justPressed.D)
		{
			bf.animation.play('right');
		}

		
		FlxG.collide(bf, obstacle);
		FlxG.collide(bf, obstacletwo);
		FlxG.collide(bf, obstaclethree);
		FlxG.collide(bf, obstaclefour);
		
		
		

		super.update(elapsed);
	}

	
}


