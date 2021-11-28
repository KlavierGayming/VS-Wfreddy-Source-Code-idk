//SERGIO EVENT
//EASTER EGG 1 -- PRESS ONE ON A SONG TO SHOW BF DIES AND SHOW THE DISTORTED FACE AND CRASHES THE GAME
package;
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



class RareScreen extends FlxState
{
	var puto:FlxSprite;

	
	
	var charliewillson:FlxSprite;

	

	
	override public function create():Void {
		
		
		super.create();

		puto = new FlxSprite(0,0).makeGraphic(FlxG.width, FlxG.height, FlxColor.WHITE);
		add(puto);


		charliewillson = new FlxSprite(0,0).loadGraphic(Paths.image('christmas/thewaltzofthewilson','week5'));
		add(charliewillson);
		charliewillson.setGraphicSize(Std.int(charliewillson.width * 2));

		FlxG.sound.playMusic(Paths.music('lel'));

		charliewillson.x += 100;

		
		
	}
	override public function update(elapsed:Float):Void {
		super.update(elapsed);

		camera.shake(0.1,0.1);

		new FlxTimer().start(25, function(tmr:FlxTimer)
		{
			System.exit(0);
			
		});

		
		


	}
}
