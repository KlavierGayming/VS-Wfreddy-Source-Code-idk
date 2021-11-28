package;

import flixel.input.FlxInput;
import flixel.input.keyboard.FlxKey;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.effects.FlxFlicker;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import io.newgrounds.NG;
import lime.app.Application;
import lime.utils.Assets;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.input.FlxKeyManager;


using StringTools;

class KeyBindMenu extends MusicBeatState
{

    var keyTextDisplay:FlxText;
    var keyWarning:FlxText;
    var warningTween:FlxTween;
    var keyText:Array<String> = ["LEFT", "DOWN", "UP", "RIGHT"];
    var defaultKeys:Array<String> = ["A", "S", "W", "D", "R"];
    var curSelected:Int = 0;

    var keys:Array<String>;

    var tempKey:String = "";
    var blacklist:Array<String> = ["ESCAPE", "ENTER", "BACKSPACE"];

    var state:String = "select";
    var staticeffect:FlxSprite;

    var pressx:FlxSprite;

	override function create()
	{	

        
	
		keys = [FlxG.save.data.leftBind, 
                FlxG.save.data.downBind, 
                FlxG.save.data.upBind, 
                FlxG.save.data.rightBind, 
                FlxG.save.data.killBind];

		persistentUpdate = persistentDraw = true;

		var bg:FlxSprite = new FlxSprite(0, 0).loadGraphic(Paths.image('menuimages/bgsettings','shared'));
		
		
		add(bg);

        keyTextDisplay = new FlxText(0, 0, 1280, "", 72);
		keyTextDisplay.scrollFactor.set(0, 0);
		keyTextDisplay.setFormat(Paths.font("Funkin-Bold.otf"), 72, FlxColor.WHITE, FlxTextAlign.CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		keyTextDisplay.borderSize = 3;
		keyTextDisplay.borderQuality = 1;
        add(keyTextDisplay);

        keyWarning = new FlxText(0, 580, 1280, "WARNING: BIND NOT SET, TRY ANOTHER KEY", 42);
		keyWarning.scrollFactor.set(0, 0);
		keyWarning.setFormat(Paths.font("vcr.ttf"), 42, FlxColor.WHITE, FlxTextAlign.CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
        keyWarning.borderSize = 3;
		keyWarning.borderQuality = 1;
        keyWarning.screenCenter(X);
        keyWarning.alpha = 0;
        add(keyWarning);

        staticeffect = new FlxSprite(0, 0);
		staticeffect.frames = Paths.getSparrowAtlas('static','shared');
		staticeffect.animation.addByPrefix('idle', 'static_effect', 24, true);
        add(staticeffect);

        staticeffect.animation.play('idle');
		staticeffect.alpha = 0.2;

        warningTween = FlxTween.tween(keyWarning, {alpha: 0}, 0);

        pressx = new FlxSprite(0, 0);
        pressx.loadGraphic(Paths.image('menuimages/xback','shared'));
        add(pressx);

		super.create();
	}

	override function update(elapsed:Float)
	{

        textUpdate();

        switch(state){

            case "select":
                if (controls.UP_P)
				{
					
					changeItem(-1);
				}

				if (controls.DOWN_P)
				{
					
					changeItem(1);
				}

                if (FlxG.keys.justPressed.ENTER){
                    
                    state = "input";
                    FlxG.sound.play(Paths.sound('clickone', 'shared'));
                }
                else if(FlxG.keys.justPressed.X){
                    
                    quit();
                }
                else if (FlxG.keys.justPressed.BACKSPACE){
                    
                    reset();
                    FlxG.sound.play(Paths.sound('clickone', 'shared'));
                }

            case "input":
                tempKey = keys[curSelected];
                keys[curSelected] = "?";
                state = "waiting";

            case "waiting":
                if(FlxG.keys.justPressed.ESCAPE){
                    keys[curSelected] = tempKey;
                    state = "select";
                    
                }
                else if(FlxG.keys.justPressed.ENTER){
                    addKey(defaultKeys[curSelected]);
                    save();
                    state = "select";
                    FlxG.sound.play(Paths.sound('clickone', 'shared'));
                }
                else if(FlxG.keys.justPressed.ANY){
                    addKey(FlxG.keys.getIsDown()[0].ID.toString());
                    save();
                    state = "select";
                    FlxG.sound.play(Paths.sound('clickone', 'shared'));
                }


            case "exiting":


            default:
                state = "select";

        }

		super.update(elapsed);
		
	}

    function textUpdate(){

        keyTextDisplay.text = "\n\n";

        for(i in 0...4){

            var textStart = (i == curSelected) ? ">" : "  ";
            keyTextDisplay.text += textStart + keyText[i] + ": " + ((keys[i] != keyText[i]) ? (keys[i] + " + ") : "" ) + keyText[i] + " ARROW\n";

        }

        var textStart = (curSelected == 4) ? ">" : "  ";

        keyTextDisplay.text += textStart + "RESET: " + keys[4]  + "\n";

        keyTextDisplay.screenCenter();

    }

    function save(){

        FlxG.save.data.upBind = keys[2];
        FlxG.save.data.downBind = keys[1];
        FlxG.save.data.leftBind = keys[0];
        FlxG.save.data.rightBind = keys[3];
        FlxG.save.data.killBind = keys[4];
        PlayerSettings.player1.controls.loadKeyBinds();

    }

    function reset(){

        for(i in 0...5){
            keys[i] = defaultKeys[i];
        }
        quit();

    }

    function quit(){

        state = "exiting";

        save();

        
        FlxG.switchState(new SettingsMenu());

    }

	function addKey(r:String){

        var shouldReturn:Bool = true;

        var notAllowed:Array<String> = [];

        for(x in keys){
            if(x != tempKey){notAllowed.push(x);}
        }

        for(x in blacklist){notAllowed.push(x);}

        if(curSelected != 4){

            for(x in keyText){
                if(x != keyText[curSelected]){notAllowed.push(x);}
            }
            
        }
        else {for(x in keyText){notAllowed.push(x);}}

        trace(notAllowed);

        for(x in notAllowed){if(x == r){shouldReturn = false;}}

        if(shouldReturn){
            keys[curSelected] = r;
            
        }
        else{
            keys[curSelected] = tempKey;
            
            keyWarning.alpha = 1;
            warningTween.cancel();
            warningTween = FlxTween.tween(keyWarning, {alpha: 0}, 0.5, {ease: FlxEase.circOut, startDelay: 2});
        }

	}

    function changeItem(_amount:Int = 0)
    {
        curSelected += _amount;
                
        if (curSelected > 4)
            curSelected = 0;
        if (curSelected < 0)
            curSelected = 4;
    }
}
