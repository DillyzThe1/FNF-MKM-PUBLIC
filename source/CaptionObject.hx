package;

import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxSpriteGroup;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import openfl.display.BitmapData;

class CaptionObject extends FlxSpriteGroup {
    var captionBG:FlxSprite;
    var captionText:FlxText;

    public var text(get, set):String;

    public function new(?textDefault:String = "", ?cams:Array<FlxCamera> = null) {
        super();
        if (cams == null)
            cams = [FlxG.camera];

        captionBG = new FlxSprite(0, 0).makeGraphic(1, 1, FlxColor.BLACK);
        captionBG.scrollFactor.set(0, 0);
		add(captionBG);

        captionText = new FlxText(FlxG.width/2, FlxG.height * 0.875, 0, "", 32, true);
		captionText.setBorderStyle(OUTLINE, FlxColor.BLACK, 4, 1.15);
		captionText.alignment = CENTER;
        captionText.scrollFactor.set(0, 0);
		add(captionText);

        this.cameras = cams;
        this.text = textDefault;
        this.scrollFactor.set(0, 0);
    }

    var boundsX:Float = 25;
    var boundsY:Float = 7.5;

    @:noCompletion
    public function set_text(?newText:String = "") {
        if (newText == "") {
            captionText.visible = captionBG.visible = false;
            return "";
        }
        captionText.visible = captionBG.visible = true;

        captionText.text = newText.toLowerCase();
        captionText.screenCenter(X);

        captionText.x += FlxG.random.int(-10, 5);

        captionText.y = (FlxG.height * 0.875) + 16;
        captionText.y -= captionText.height/2;

        if (captionText.y + captionText.height > FlxG.height)
            captionText.y = FlxG.height - captionText.height;

        captionBG.makeGraphic(Std.int(captionText.width + boundsX * 2), Std.int(captionText.height + boundsY * 2), FlxColor.BLACK);
        captionBG.setPosition(captionText.x - boundsX, captionText.y - boundsY);
        captionBG.alpha = 0.375;

        captionText.angle = captionBG.angle = 0;

        return captionText.text;
    }

    @:noCompletion
	function get_text():String
		return captionText.text;

    public override function update(e:Float) {
        super.update(e);

        captionText.x += FlxG.random.int(-5, 5) * FlxG.random.int(-5, 5);
        captionText.y += FlxG.random.int(-5, 5) * FlxG.random.int(-5, 5);
        captionText.angle += FlxG.random.int(-5, 5) * FlxG.random.int(-5, 5);
        captionBG.setPosition(captionText.x - boundsX, captionText.y - boundsY);
        captionBG.angle = captionText.angle;

        captionText.scale.x = 1 + FlxG.random.int(-1, 1)/7.5;
        captionText.scale.y = 1 + FlxG.random.int(-1, 1)/15;
        captionBG.scale.set(captionText.scale.x, captionText.scale.y);
    }
}