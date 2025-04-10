import sys.Http;

var bg;
var modList;
var modText;
var leftText;
var rightText;
var curSelected:Int = 0;

function create() {
	var modsListData = new Http("https://raw.githubusercontent.com/KittySleeper/Kitty-s-Mod-Downloader/refs/heads/backend/modList.json");
	modsListData.onData = function(data:String) {
		modList = Json.parse(data);
	}
	modsListData.request();

	bg = add(new FlxSprite(0, 0, Paths.image("menus/menuDesat")));
	bg.color = 0xFFb265bd;

	modText = add(new Alphabet(0, 0, "Minecraft Gamer", true, false));

    changeSelection();

	leftText = add(new Alphabet(modText.x, modText.y, ">", true, false)); leftText.flipX = true;
	leftText.x -= leftText.width + 25;

	rightText = add(new Alphabet(modText.lastSprite.x, modText.y, ">", true, false));
	rightText.x += rightText.width + 20;
}

function update(elapsed) {
    if (controls.LEFT_P) changeSelection(-1);
	if (controls.RIGHT_P) changeSelection(1);
	if (controls.BACK) FlxG.switchState(new MainMenuState());

    leftText.x = lerp(leftText.x, (controls.LEFT) ? modText.x - (leftText.width + 35) : modText.x - (leftText.width + 25), 0.25);
    rightText.x = lerp(rightText.x, (controls.RIGHT) ? modText.lastSprite.x + (rightText.width + 35) : modText.lastSprite.x + (rightText.width + 20), 0.25);
}

function changeSelection(amt:Int = 0) {
	curSelected = FlxMath.wrap(curSelected + amt, 0, modList.mods.length - 1);
    modText.text = StringTools.trim(modList.mods[curSelected].name);
    modText.setPosition(FlxG.width / 2 - modText.width / 2, FlxG.height * 0.7);
}