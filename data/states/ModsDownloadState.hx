var bg;

function create() {
    bg = add(new FlxSprite(0, 0, Paths.image("menus/menuDesat")));
    bg.color = 0xFFb265bd;
}

function update(elapsed) {
    if (controls.BACK) FlxG.switchState(new MainMenuState());
}