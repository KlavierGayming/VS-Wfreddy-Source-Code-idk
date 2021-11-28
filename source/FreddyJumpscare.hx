import flixel.system.debug.Window;
import polymod.fs.SysFileSystem;
import lime.system.System;
import flixel.input.keyboard.FlxKey;
import haxe.Exception;
import openfl.geom.Matrix;
import openfl.display.BitmapData;
import openfl.utils.AssetType;
import lime.graphics.Image;
import flixel.graphics.FlxGraphic;
import openfl.utils.AssetManifest;
import openfl.utils.AssetLibrary;
import flixel.system.FlxAssets;

import lime.app.Application;
import lime.media.AudioContext;
import lime.media.AudioManager;

import openfl.Lib;
import Section.SwagSection;
import Song.SwagSong;
import WiggleEffect.WiggleEffectType;
import flixel.FlxBasic;
import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxGame;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.FlxSubState;
import flixel.addons.display.FlxGridOverlay;
import flixel.addons.effects.FlxTrail;
import flixel.addons.effects.FlxTrailArea;
import flixel.addons.effects.chainable.FlxEffectSprite;
import flixel.addons.effects.chainable.FlxWaveEffect;
import flixel.addons.transition.FlxTransitionableState;
import flixel.graphics.atlas.FlxAtlas;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.math.FlxPoint;
import flixel.math.FlxRect;
import flixel.system.FlxSound;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.ui.FlxBar;
import flixel.util.FlxCollision;
import flixel.util.FlxColor;
import flixel.util.FlxSort;
import flixel.util.FlxStringUtil;
import flixel.util.FlxTimer;
import haxe.Json;
import lime.utils.Assets;
import openfl.display.BlendMode;
import openfl.display.StageQuality;
import openfl.filters.ShaderFilter;

#if windows
import Discord.DiscordClient;
#end
#if windows
import Sys;
import sys.FileSystem;
#end

using StringTools;



class FreddyJumpscare extends MusicBeatSubstate
{
	public static var boyfriend:Boyfriend;

	var jumpscare:FlxSprite;
	var staticeffect:FlxSprite;

	public var camHUD:FlxCamera;
	private var camGame:FlxCamera;


	

	

	
	override public function create():Void {
		
		
		super.create();

		camGame = new FlxCamera();
		camHUD = new FlxCamera();
		camHUD.bgColor.alpha = 0;

		FlxG.cameras.reset(camGame);
		FlxG.cameras.add(camHUD);

		FlxCamera.defaultCameras = [camGame];


		jumpscare = new FlxSprite(0, 0);
		jumpscare.frames = Paths.getSparrowAtlas('jumpscares/jump_fred','shared');
		jumpscare.animation.addByPrefix('idle', 'BF dies', 24, false);
		jumpscare.animation.addByPrefix('death', 'BF Dead Loop', 24, false);
		jumpscare.animation.addByPrefix('confirm', 'BF Dead confirm', 24, false);
		
		jumpscare.cameras = [camHUD];
		add(jumpscare);

		jumpscare.visible = false;


		staticeffect = new FlxSprite(0, 0);
		staticeffect.frames = Paths.getSparrowAtlas('static','shared');
		staticeffect.animation.addByPrefix('idle', 'static_effect', 24, true);
		staticeffect.cameras = [camHUD];
		add(staticeffect);

		staticeffect.visible = false;
		

		

		new FlxTimer().start(0.1, function(jump:FlxTimer)
		{
			jumpscare.visible = true;
			jumpscare.animation.play('idle');
			FlxG.sound.play(Paths.sound('freddy_jump', 'shared'));
			camHUD.shake(0.02, 1.5);
			new FlxTimer().start(0.1, function(shake:FlxTimer)
			{
				Lib.application.window.move(Lib.application.window.x + 10, Lib.application.window.y + 0);
				new FlxTimer().start(0.05, function(tmr:FlxTimer)
				{
					Lib.application.window.move(Lib.application.window.x - 10, Lib.application.window.y + 0);
				});
			}, 15);
			
			new FlxTimer().start(1.5, function(jump:FlxTimer)
			{
				jumpscare.animation.play('death');
				FlxG.sound.play(Paths.sound('static', 'shared'));
				staticeffect.animation.play('idle');
				staticeffect.visible = true;
				
				new FlxTimer().start(3, function(tmr:FlxTimer)
				{
					
					FlxG.sound.play(Paths.sound('freddybox', 'shared'));
					staticeffect.alpha = 0.5;
					
				});
					
			});
		});

		

		


		
		
	}
	override public function update(elapsed:Float):Void {
		super.update(elapsed);


		if (FlxG.keys.justPressed.ENTER)
		{
			
			LoadingState.loadAndSwitchState(new PlayState());
		}

		

		
		


	}
}
