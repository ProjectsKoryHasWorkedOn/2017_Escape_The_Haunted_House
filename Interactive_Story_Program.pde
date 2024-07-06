/** -------------------------------------------------- **/
/** A INTERACTIVE STORY GAME **/
// - Tested to work on: 
//   - Processing version 3.0 to version 3.3.4
//   - Red Hat Linux OS & Windows 10 OS
// - Group project by: Corey & Sara.
// - Development period: The month of May.
// - Yet to implement:
//   - N/A - everything important and not important has been implemented.

/** AUTHORS **/
// - The idea to make an interactive story came from: Sara
// - The program was put together by: Corey
// - Authors for aspects to the code:
//   - The starting screen sound, haunted house, graphics for the navigation system, and text for the navigation system was put together by: Sara
//   - The text based navigation system was put together by: Chrisir
//   - Everything else (code-wise) was put together by: Corey
// - Authors for images, sounds, and similar assets:
//   - The authors of the assets are referenced in the documentation.
// - Authors for other aspects to the program:
//   - The license file was put together by: Corey
//   - The documentation - plot planning was put together by: Sara
//   - The documentation - cue cards were put together by: Corey & Sara
//   - The rest of the documentation was put together by: Corey

/** INSTRUCTIONS TO RUN SOURCE CODE **/
// - Install the latest version of Processing as it should be better than the older versions. 
// - Install the "minim" sound library via the Sketch > Import Library > Libraries tab
// - Run the executable (if the program is compiled) or hit the play button on the Interactive_Story_Program screen (if the program has not been compiled)
/** -------------------------------------------------- **/

/** IMPORT THE LIBRARIES **//** [-------START-------] **/
// Import the menu bar libraries
import processing.awt.PSurfaceAWT; 
import java.awt.event.*;
import java.awt.*;

// Import the minim sound library
import ddf.minim.*; /** [-------END-------] **/

/** -------------------------------------------------- **/

/** DECLARE THE DATA STRUCTURES **//** [-------START-------] **/
// Declare the canvas size settings
final int CANVAS_WIDTH = 1000; // Should be set to 1000
final int CANVAS_HEIGHT = 800; // Should be set to 800

// Reason for recommending a fixed canvas size: 
// - The elements scale nicely so this is not the reason
// - I used images instead of backgrounds so the canvas size does not need to be fixed so this is not the reason
// - Reason for not increasing: I do not draw unnecessary elements (like extra clouds or bushes) - increasing works but extra elements will now be drawn to make up for the increase.
// - Reason for not decreasing: The canvas size is already small enough - decreasing the size any more would negatively affect the view text aspect to the screen - decreasing does not work at all.

// Declare a few variables to store the different states of the program
final int STARTING_SCREEN_STATE = 0; // Must be set to 0
final int PLAYING_SCREEN_STATE = 1; // Must be set to 1
final int LOSING_SCREEN_STATE = 2; // Must be set to 2
final int VICTORY_SCREEN_STATE = 3; // Must be set to 3

// Declare the names of the mouse and icon image files
final String PROGRAM_ICON_IMAGE_FILENAME = "hauntedHouseIcon.png"; // Haunted house icon filename set to the name of the file
final String MOUSE_CURSOR_IMAGE_FILENAME = "mouseCursor.png"; // Mouse cursor filename set to the name of the file

// Declare the names of the monster image files
final String PINK_MONSTER_IMAGE_FILENAME = "pinkMonster.png"; // Pink monster filename set to the name of the file
final String BAT_IMAGE_FILENAME = "bat.png"; // Bat image filename set to the name of the file
final String CAT_IMAGE_FILENAME = "cat.png"; // Cat image filename set to the name of the file
final String DEMON_IMAGE_FILENAME = "demon.png"; // Demon image filename set to the name of the file
final String DEVIL_IMAGE_FILENAME = "devil.png"; // Devil image filename set to the name of the file
final String GHOST_IMAGE_FILENAME = "ghost.png"; // Ghost image filename set to the name of the file
final String SKELETON_IMAGE_FILENAME = "skeleton.png"; // Skeleton image filename set to the name of the file
final String SLIME_MONSTER_IMAGE_FILENAME = "slimeMonster.png"; // Slime Monster image filename set to the name of the file
final String SPIDER_IMAGE_FILENAME = "spider.png"; // Spider image filename set to the name of the file
final String ZOMBIE_IMAGE_FILENAME = "zombie.png"; // Zombie image filename set to the name of the file
final String GILL_MAN_IMAGE_FILENAME = "gillMan.png"; // Gill Man image filename set to the name of the file
final String SERIAL_KILLER_IMAGE_FILENAME = "serialKiller.png"; // Serial killer image filename set to the name of the file

// Declare the names of the decoration image files
final String SUN_IMAGE_FILENAME = "sun.png"; // Sun image filename set to the name of the file
final String BUSH_IMAGE_FILENAME = "bush.png"; // Bush image filename set to the name of the file
final String TREE_IMAGE_FILENAME = "tree.png"; // Tree image filename set to the name of the file

// Declare the names of the background image files
final String PLAYING_BACKGROUND_ATTIC_IMAGE_FILENAME = "playingScreenAttic.jpg";
final String PLAYING_BACKGROUND_BASEMENT_IMAGE_FILENAME = "playingScreenBasement.jpg";
final String PLAYING_BACKGROUND_BEDROOM1_IMAGE_FILENAME = "playingScreenBedroom1.jpg";
final String PLAYING_BACKGROUND_BEDROOM2_IMAGE_FILENAME = "playingScreenBedroom2.jpg";
final String PLAYING_BACKGROUND_BEDROOM3_IMAGE_FILENAME = "playingScreenBedroom3.jpg";
final String PLAYING_BACKGROUND_FOYER_IMAGE_FILENAME = "playingScreenFoyer.jpg";
final String PLAYING_BACKGROUND_HALLWAY1_IMAGE_FILENAME = "playingScreenHallway1.jpg";
final String PLAYING_BACKGROUND_HALLWAY2_IMAGE_FILENAME = "playingScreenHallway2.jpg";
final String PLAYING_BACKGROUND_KITCHEN_IMAGE_FILENAME = "playingScreenKitchen.jpg";
final String PLAYING_BACKGROUND_LIBRARY_IMAGE_FILENAME = "playingScreenLibrary.jpg";
final String LOSING_BACKGROUND_0_IMAGE_FILENAME = "losingScreenBackground0.jpg"; // Background 0 filename set to the name of the file
final String LOSING_BACKGROUND_1_IMAGE_FILENAME = "losingScreenBackground1.jpg"; // Background 1 filename set to the name of the file
final String LOSING_BACKGROUND_2_IMAGE_FILENAME = "losingScreenBackground2.jpg"; // Background 2 filename set to the name of the file
final String LOSING_BACKGROUND_3_IMAGE_FILENAME = "losingScreenBackground3.jpg"; // Background 3 filename set to the name of the file
final String LOSING_BACKGROUND_4_IMAGE_FILENAME = "losingScreenBackground4.jpg"; // Background 4 filename set to the name of the file
final String LOSING_BACKGROUND_5_IMAGE_FILENAME = "losingScreenBackground5.jpg"; // Background 5 filename set to the name of the file

// Declare the names of the font files 
final String FONT_FILE_FILENAME = "hauntedFont.TTF"; // Font filename set to the name of the file

// Declare the names of the text files
final String LICENSE_FILENAME = "License.txt"; // License filename set to the name of the file
final String DOCUMENTATION_FILENAME = "Documentation.pdf"; // Documentation filename set to name of the file (converted to PDF)

// Declare the names of the SFX sound files
final String SILENT_SOUND_FILENAME = "silence.mp3"; // Blank sound file that is used to stop playing sounds set to the name of the file
final String JUMP_SCARE_SOUND_FILENAME = "pinkMonsterScream.mp3"; // Jump scare SFX filename set to the name of the file
final String LIGHTNING_STRIKE_SOUND_FILENAME = "lightningStrike.mp3"; // Lightning SFX set to the name of the file
final String RAIN_SOUND_FILENAME = "rain.mp3"; // Rain SFX set to the name of the file
final String BAT_SOUND_FILENAME = "bat.mp3"; // Bat SFX filename set to the name of the file
final String CAT_SOUND_FILENAME = "cat.mp3"; // Cat SFX filename set to the name of the file
final String DEMON_SOUND_FILENAME = "demon.mp3"; // Demon SFX filename set to the name of the file
final String DEVIL_SOUND_FILENAME = "devil.mp3"; // Devil SFX filename set to the name of the file
final String GHOST_SOUND_FILENAME = "ghost.mp3"; // Ghost SFX filename set to the name of the file
final String SKELETON_SOUND_FILENAME = "skeleton.mp3"; // Skeleton SFX filename set to the name of the file
final String SLIME_MONSTER_SOUND_FILENAME = "slimeMonster.mp3"; // Slime Monster SFX filename set to the name of the file
final String SPIDER_SOUND_FILENAME = "spider.mp3"; // Spider SFX filename set to the name of the file
final String ZOMBIE_SOUND_FILENAME = "zombie.mp3"; // Zombie SFX filename set to the name of the file
final String GILL_MAN_SOUND_FILENAME = "gillMan.mp3"; // Gill Man SFX filename set to the name of the file
final String PINK_MONSTER_ROAR_FILENAME = "pinkMonsterRoar.mp3"; // Pink monster roar SFX filename set to the name of the file
final String SERIAL_KILLER_SOUND_FILENAME = "serialKiller.mp3"; // Serial Killer SFX filename set to the name of the file
final String PINK_MONSTER_LAUGH_FILENAME = "pinkMonsterLaugh.mp3"; // Pink monster SFX set to the name of the file

// Declare the names of the background music sound files
final String STARTING_SCREEN_SOUND_FILENAME = "startingScreen.mp3"; // Starting screen background music set to the name of the file
final String PLAYING_SCREEN_SOUND_FILENAME = "playingScreen.mp3"; // Playing screen background music set to the name of the file
final String LOSING_SCREEN_SOUND_FILENAME = "losingScreen.mp3"; // Losing screen background music filename set to the name of the file
final String VICTORY_SOUND_FILENAME = "victoryScreen.mp3"; // Victory screen background music set to the name of the file

// Declare a few constants / indexes of thisLine
final int UNDEFINED = -1;
final int LABEL_INDEX = 0;
final int QUESTION = 1;  

// Declare more constants / indexes for thisLine that vary according to how many components there are
final int THREE_COMPONENTS_POINTER = 2;  
final int FOUR_COMPONENTS_TEXT_1 = 2; 
final int FOUR_COMPONENTS_BUTTON_POINTER = 3;
final int SIX_COMPONENTS_TEXT_1 = 2;
final int SIX_COMPONENTS_TEXT_2 = 3; 
final int SIX_COMPONENTS_POINTER_1 = 4; 
final int SIX_COMPONENTS_POINTER_2 = 5; 
final int EIGHT_COMPONENTS_TEXT_1 = 2;
final int EIGHT_COMPONENTS_TEXT_2 = 3; 
final int EIGHT_COMPONENTS_TEXT_3 = 4;
final int EIGHT_COMPONENTS_POINTER_1 = 5;
final int EIGHT_COMPONENTS_POINTER_2 = 6;
final int EIGHT_COMPONENTS_POINTER_3 = 7; 
final int TEN_COMPONENTS_TEXT_1 = 2;
final int TEN_COMPONENTS_TEXT_2 = 3;
final int TEN_COMPONENTS_TEXT_3 = 4;
final int TEN_COMPONENTS_TEXT_4 = 5;
final int TEN_COMPONENTS_POINTER_1 = 6;
final int TEN_COMPONENTS_POINTER_2 = 7;
final int TEN_COMPONENTS_POINTER_3 = 8; 
final int TEN_COMPONENTS_POINTER_4 = 9;

// Declare the x-position of the fixed text column
final int COLUMN_X_POS =495; // One important x-position of a column

// Declare x-positions of the text columns
int[] valuesX = {2, 33, 155, COLUMN_X_POS, -1, -1, -1, -1, -1, -1, -1, -1}; // Array for the x-positions of the columns

// Declare data structures to sort through and store the text file
String[] gameText; // Each room / situation / question in the text adventure program is represented by one line in the array called gameText
String[] thisLine; // Declare an array to look at the text files components. Each line holds: a description; button texts; line numbers; and a command pointer. Each component of a line is seperated by a #.

// Declare a HashMap to store a collection of objects
HashMap<String, Integer> hashMap = new HashMap(); 

// Declare the initial program settings
/** Int settings **/
// Simple integer settings (set to 0)
int selectedStartingScreenAnimationSetting = 0; // Declare a variable to store the settings for whether nothing (0), rain (1), lightning (2), names (3), or the trippy sky (4) should be drawn. Should be set to 0.
int pointer = 0; // // Declare a pointer to keep track of where we are in the text file. The initial value is 0 which means that you start at the very first line 
int textStart = 0; // Conditions to start displaying the text. Leave to 0.
int jumpScareRunTimer = 0; // The initial timer be set to 0
int jumpScareStopTimer = 0; // The initial stop timer should be set to 0
int jumpScareCounter = 0; // The counter for how many types you click should initially be 0
int jumpScareProbability = 0; // A placeholder for the probability of the jump scare appearing should initially be set to 0
int playStartingScreenSoundAfterXsecondsTimer = 0; // The timer should start at 0.
int countNumberOfScreensFlashed = 0; // Declare this variable to change between the sets of flashing screens should be set to 0
int playLosingScreenSoundAfterXSecondsTimer = 0; // The timer should start at 0.
int selectedMonsterSetting = 0; // Should be set to 0. Set randomly irrespectively.
int playRainSFXAgainAfterXSecondsTimer = 0; // The timer should start at 0.
int selectedDeathThreatSetting = 0; // No death thrat has been selected yet so this should be set to 0. Set randomly irrespectively.
int selectedBackgroundSetting = 0; // No background has been selected so this should be set to 0. Set randomly irrespectively.
int playVictoryScreenSoundAfterXSecondsTimer = 0; // The timer should start at 0.
int playPlayScreenSoundAfterXSecondsTimer = 0; // The timer should start at 0.

// Slightly more complex integer settings (case by case scenario):
int currentStateSetting = STARTING_SCREEN_STATE; // The initial state of the program should be set to the STARTING_SCREEN_STATE. The states are STARTING_SCREEN_STATE, PLAYING_SCREEN_STATE, LOSING_SCREEN_STATE, VICTORY_SCREEN_STATE
int textState = 1; // Set the state for whether a table or the text should be displayed. 0 means display table on load. 1 means display text starting from pointer 0. Set to 1.
int jumpScareStopAfterXSeconds = 2; // The amount to increment the jump scare stop timer by should be set to 2. So the jump scare timer must be displayed for 2 seconds before you can get rid of it.
int incrementRainSoundTimerByX = 5; // Must be set to the length of the sound file. The sound file is 5 seconds in length at the moment so this is set to 5.
int numberOfBackgroundsSetting = 5; // Must be set to the number of backgrounds which counting from 0 is 5. Changing this value to anything higher will require more backgrounds to be added in the source code.
int numberOfMonstersSetting = 11; // Must be set to the number of monsters which counting from 0 is 11. Changing this value to anything higher will require more monsters to be added in the source code.
int numberOfDeathThreatsSetting = 20; // Must be set to the number of death threats which counting from 0 is 11. Changing this value will require more threats to be added in the source code.
int incrementLosingScreenSoundTimerByX = 60; // Must be set to the length of the losing screen sound file which is 60 seconds in this case
int defaultLikelihoodOfScare = 80; // Set the likelihood for the jump scare appearing after every click. A 1 in 60 chance seems pretty unlikely for the odds of the jump scare
int likelihoodOfScareSetting = defaultLikelihoodOfScare; // 1 in LikelihoodOfScare of the jump scare popping up. 
int incrementStartScreenSoundTimerByX = 125; // Must be set to the length of the sound file which is 125 seconds
int incrementVictoryScreenSoundTimerByX = 147; // Must be set to the length of the sound file which is 147 seconds in this case
int incrementPlayingScreenSoundTimerByX = 58; // Must be set to the length of the sound file which is 83 seconds
int hauntedHouseXPos = CANVAS_WIDTH/2 - 280; // The default XPos of the house
int hauntedHouseYPos = CANVAS_HEIGHT/2-200; // The default YPos of the house
float hauntedHouseScaleSize = 0.7; // The default scale size of the house

/** String settings **/
// Simple string settings:
String deathThreat = ""; // Declare a variable to store the selected death threat. No death threat has been selected yet so this should be set to ""
String victoryScreenLockStatus = "Locked"; // Declare a variable to display whether the victory screen has been unlocked. Should be set to "Locked" as it has not yet been unlocked.

/** Float settings **/
// Simple float settings:
float flashScreenStartTimer = 0; // A timer for the flash screen start time. Should initially be set to 0. I set it to run at the program time irrespectively

// Complex float settings:
float flashScreenIncrementTimerByX = 35.0; // A timer that is used to sequence multiple flashing screens sets, the default increment time is 3.5 seconds

/** Boolean settings **/
// Simple boolean settings:
boolean skipDeath = false; // Allows you to restart quicker by skipping the lose screen animation
boolean errorsFound = false; // The error checking function has not run yet so this should be false
boolean dragCenter = false; // Allows you to use the mouseWheel to navigate up and down the table. Set to false as you are not doing that straight away.
boolean victoryScreenLoadedBeforeSetting = false; // The victory screen should not initially load and this should hence be set to false. 
boolean isSFXPlayingSetting = false; // Sound is not initially playing through the audio players so this should be set to false
boolean isBackgroundMusicPlayingSetting = false; // Sound is not initially playing through the audio players so this should be set to false
boolean muteSoundsSetting = false; // The sound should not initially be muted so this should be set to false
boolean clearTheCanvasSetting = false; // The canvas should not be fully cleared when the program is initially run so this should be set to false
boolean partialClearTheCanvasSetting = false; // The canvas should not be partially cleared when the program is initially run so this should be set to false
boolean startPlayingBackgroundMusicAgainSetting = false; // The background music should not initially be played again so this should be set to false
boolean displayJumpScareSetting = false; // The jump scare will not initially run so this should be false
boolean alreadyDisplayedJumpScareSetting = false; // The jump scare will not initially run so this should initially be false
boolean playedJumpScareSoundAlreadySetting = false; // The jump scare does not immediately play so this should initially be false
boolean manuallySelectStartingScreenAnimationSetting = false; // You should not manually select the animation as soon as the program starts. This variable should be set to false.
boolean isStartingScreenTimerSet = false; // Declare a controller to ensure that the starting screen music starts and is not out of sync should be set to false
boolean hasStartingRainTimeBeenSetSetting = false; //  Declare a controller to ensure that the starting rain time starts and is not thrown out of sync should be set to false
boolean rainCurrentlyPlayingSetting = false; // // Declare a controller to ensure that the rain SFX only plays once should be set to false
boolean commandToLoadTheLoseScreenAgain = false; // Declare a controller so that the losing screen can be drawn again should be set to false.
boolean flashScreenStartTimerDeclaredSetting = false; // Declare a controller that will set the FlashScreenStartTimer to the program time should be set to false
boolean isFlashScreenDoneSetting = false; // The flash screen has not started yet and is hence not done. This should be set to false.
boolean monsterSoundsPlayedOnceSetting = false; //  Declare a variable to ensure that the Monster SFX is only placed once should be set to false
boolean victorySoundFirstRunSetting = false; // Declare a controller to see if the victory sound has been run should be set to false
boolean displayFinalMonsterSetting = false; // The monster display conditions. The monster has not been displayed yet so this should be set to false
boolean monsterSoundRunSetting = false; // Declare a controller so that the final monster SFX only plays once should be set to false
boolean loseScreenFirstRunSetting = false; // Declare a controller to see if the losing screen sound has been run should be set to false
boolean playScreenFirstRunSetting = false; // Declare a controller to see if the playing screen sound has been run should be set to false

// Declare the program icon and mouse cursor image data structures - I load the images as soon as the program starts
PImage programIconImage; // The program icon image
PImage mouseCursorImage; // The program cursor image 

// Declare the monster image data structures - I load the images as soon as the program starts
PImage batImage; // Monster Image 0 - Bat
PImage catImage; // Monster Image 1 - Cat
PImage demonImage; // Monster Image 2 - Demon
PImage devilImage; // Monster Image 3 - Devil
PImage ghostImage; // Monster Image 4 - Ghost
PImage skeletonImage; // Monster Image 5 - Skeleton
PImage slimeMonsterImage; // Monster Image 6 - Slime Monster
PImage spiderImage; // Monster Image 7 - Spider
PImage zombieImage; // Monster Image 8 - Zombie
PImage gillManImage; // Monster Image 9 - Gill Man
PImage pinkMonsterImage; // Monster Image 10 - The pink monster image (also used elsewhere)
PImage serialKillerImage; // Monster Image 11 - Serial Killer

// Declare the background image data structures - I load the images as soon as the program starts
PImage playingScreenBackgroundAttic; // Attic background
PImage playingScreenBackgroundBasement; // Basement background
PImage playingScreenBackgroundBedroom1; // Bedroom 1 background
PImage playingScreenBackgroundBedroom2; // Bedroom 2 background 
PImage playingScreenBackgroundBedroom3; // Bedroom 3 background 
PImage playingScreenBackgroundFoyer; // Foyer background
PImage playingScreenBackgroundHallway1; // Hallway 1 background
PImage playingScreenBackgroundHallway2; // Hallway 2 background 
PImage playingScreenBackgroundKitchen; // Kitchen background
PImage playingScreenBackgroundLibrary; // Library background
PImage losingScreenBackground0Image; // Background 0
PImage losingScreenBackground1Image; // Background 1
PImage losingScreenBackground2Image; // Background 2
PImage losingScreenBackground3Image; // Background 3
PImage losingScreenBackground4Image; // Background 4
PImage losingScreenBackground5Image; // Background 5 

// Declare the decorational image data structures - I load the images as soon as the program starts
PImage sunImage; // Sun image
PImage bushImage; // Bush image
PImage treeImage; // Tree image /**

// Declare the font file data structures - load them as soon as the program starts
PFont SmallHauntedFont;
PFont NormalHauntedFont;
PFont LargeHauntedFont;
PFont HugeHauntedFont;
PFont ProgramTitleHauntedFont; /** [-------END-------] **/

/** -------------------------------------------------- **/

/** DECLARE THE DATA STRUCTURES FOR THE MENU BAR LIBRARY OBJECTS **//** [-------START-------] **/
// Declare the menu bar
MenuBar GameMenu;

// Declare the menu bar drop down lists
Menu FileMenu, ScreenMenu, SettingsMenu, SettingsGlobalMenu, SettingsStartScreenMenu, SettingsLoseScreenMenu, SettingsPlayingScreenMenu;

// Declare the menu bar items
MenuItem FileSafelyExit, FileLicense, FileDocumentation; // File menu
MenuItem ScreenStartingScreen, ScreenPlayingScreen, ScreenLosingScreen, ScreenVictoryScreen; // Screen menu
MenuItem SettingsMuteSounds, SettingsCheat, SettingsIncreaseJumpScareProbability, SettingsResetJumpScareProbability; // Global settings sub menu
MenuItem SettingsDrawSetting1, SettingsDrawSetting2, SettingsDrawSetting3, SettingsDrawSetting4, SettingsDrawSetting5; // Starting screen settings sub menu
MenuItem SettingsViewGameText, SettingsSkipDeathSetting; // Playing screen settings sub menu
MenuItem SettingsLoadAgain; // Losing screen settings sub menu

// Declare the menu bar listener
MenuListener GameMenuListener; /** [-------END-------] **/

/** -------------------------------------------------- **/

/** DECLARE THE DATA STRUCTURES FOR THE SOUND LIBRARY OBJECTS **//** [-------START-------] **/
// Declare the sound library
Minim SoundLibrary;

// The background music audio player
AudioPlayer BackgroundMusic;

// The sound effects audio player
AudioPlayer SFX; /** [-------END-------] **/

/** -------------------------------------------------- **/

/** DECLARE THE DATA STRUCTURES FOR THE STARTING SCREEN CLASSES **//** [-------START-------] **/
// The haunted house class
// HauntedHouse [Class Name] = new HauntedHouse(House_XPos, House_YPos, ScaleSize);
HauntedHouse HauntedHouseSet1 = new HauntedHouse(hauntedHouseXPos, hauntedHouseYPos, hauntedHouseScaleSize);

// The trippy sky class
// TrippySky [Class Name] = new TrippySky(Sky_XPos, Sky_YPos, NumberOfRings);
TrippySky TrippySkyClass1 = new TrippySky(CANVAS_WIDTH/2, CANVAS_HEIGHT/2, 6);

// The randomly generate a name class
// NameMaker [Class Name] = new NameMaker(Starting Time, Increment Starting Time By, the width of the canvas);
NameMaker NameMakerClass1 = new NameMaker(5, 5, CANVAS_WIDTH);

// The animated rain class
// Rain [Class Name] = new Rain(StartingRainTime, NextRainTime, NumberOfRainDrops
//                              RainDropYLocation, RainDropXMinValue, RainDropXMaxValue, MinFallingSpeed, MaxFallingSpeed)
Rain RainClass1 = new Rain(10, incrementRainSoundTimerByX, 7, 80, 100, CANVAS_WIDTH-100, 3, 8); 
Rain RainClass2 = new Rain(10, incrementRainSoundTimerByX, 12, 80, 100, CANVAS_WIDTH-100, 4, 7);
Rain RainClass3 = new Rain(10, incrementRainSoundTimerByX, 12, 80, 100, CANVAS_WIDTH-100, 2, 6);

// The animated lightning class
// Lightning [Class Name] = new Lightning(Initital LightningXPos (random after), Initial LightningYPos (random after), LightningYEndingPosition, DrawLightningAfterXSeconds, DrawLightningAfterXSecondsIncrementValue, Canvas Width);
Lightning LightningClass1 = new Lightning(0, 100, CANVAS_HEIGHT-100, 6, 9, CANVAS_WIDTH);

// The simple clouds class
// SimpleClouds [Class Name] = new SimpleClouds(CloudXPos, CloudYPos, CloudColour)
SimpleClouds SimpleCloudsClass1 = new SimpleClouds(100, 100, color(200));
SimpleClouds SimpleCloudsClass2 = new SimpleClouds(300, 120, color(150));
SimpleClouds SimpleCloudsClass3 = new SimpleClouds(500, 100, color(180)); // Combine cloud 1
SimpleClouds SimpleCloudsClass4 = new SimpleClouds(600, 100, color(180)); // Combine cloud 2
SimpleClouds SimpleCloudsClass5 = new SimpleClouds(750, 120, color(100));
SimpleClouds SimpleCloudsClass6 = new SimpleClouds(950, 130, color(130)); // So the canvas can be resized even more /** [-------END-------] **/

/** -------------------------------------------------- **/

/** DECLARE THE DATA STRUCTURES FOR THE PLAYING SCREEN CLASSES **//** [-------START-------] **/
// Declare an array of buttons that are used for the playing screen
Button[] ButtonClass1 = new Button[4];  /** [-------END-------] **/

/** -------------------------------------------------- **/

/** DECLARE THE DATA STRUCTURES FOR THE LOSING SCREEN CLASSES **//** [-------START-------] **/
// The flashing screen class
// Flashing screen(min red colour, max red colour, min green colour, max blue colour, min blue colour, max blue colour
//                 canvas width, canvas height)

ScreenFlasher FlashingScreenClass1 = new ScreenFlasher(100, 256, 0, 0, 0, 0, CANVAS_WIDTH, CANVAS_HEIGHT); // If you want 255 remember to put in 256.  /** [-------END-------] **/

/** -------------------------------------------------- **/

/** DECLARE THE DATA STRUCTURES FOR THE VICTORY SCREEN CLASSES **//** [-------START-------] **/
// The simple clouds class
// SimpleClouds [Class Name] = new SimpleClouds(CloudXPos, CloudYPos, CloudColour)
SimpleClouds SimpleCloudsClass7 = new SimpleClouds(250, 100, color(200));
SimpleClouds SimpleCloudsClass8 = new SimpleClouds(400, 120, color(255));
SimpleClouds SimpleCloudsClass9 = new SimpleClouds(600, 100, color(230)); // Combine cloud 1
SimpleClouds SimpleCloudsClass10 = new SimpleClouds(700, 100, color(230)); // Combine cloud 2
SimpleClouds SimpleCloudsClass11 = new SimpleClouds(850, 120, color(240));

// The car class
// Car [Class Name] = new Car(CarBodyXPos, CarBodyYPos, Car_Speed, Wheel_Turn_Speed, CarBodyColour, CarOuterOuterRimColour, CarOuterRimColour, CarInnerRimColour);
Car CarClass1 = new Car(-200, CANVAS_HEIGHT/2-35, 2.2, 5, color(0), color(255), color(0), color(255)); /** [-------END-------] **/

/** -------------------------------------------------- **/

/** THE SET UP PROGRAM SECTION OF THE PROGRAM **//** [-------START-------] **/
void setup() { 
  /** Set the frame settings **/
  // The title
  surface.setTitle("Haunted House: Choose Your Own Adventure Game");

  // Do not resize setting
  surface.setResizable(false);

  /** Set the canvas settings **/
  size(1000, 800); // Must be based on the vars CANVAS_WIDTH and CANVAS_HEIGHT or the program will not run! 

  /** Set the default program settings **/
  frameRate(60); // Default frame rate
  loop(); // Default settings for the draw function
  smooth(); // Default setting for drawing objects

  /** Load aspects of the program **/
  mutualScreenLoad(); // Load the mutual screen dependencies
  loadThePlayScreen(); // load the playing screen dependencies
  startingScreenLoad(); // Load the starting screen dependencies
  losingScreenLoad(); // Load the losing screen dependencies
  victoryScreenLoad(); // Load the victory screen dependencies

  /** Check for errors **/
  errorChecker(); // Checks for errors with the canvas size + imported text file for the text based navigation system. Prevents the program from running if errors are found.
} /** [-------END-------] **/

/** -------------------------------------------------- **/

/** THE DRAW SECTION OF THE PROGRAM **//** [-------START-------] **/
void draw() { 
  // Make sure there are no errors. If there are no errors run the program.
  if (errorsFound == false) {

    // My menu bar actions generally require the canvas to be cleared. Check if the setting to clear the canvas demands a clear.
    if (clearTheCanvasSetting == true) {
      // Run a function to clear the canvas (required so that elements from the previous state do not appear)
      clearTheCanvas();
    }
    // Conditional to partially clear the canvas
    else if (partialClearTheCanvasSetting == true) {
      // Run a function to partially clear the canvas
      partialClearTheCanvas();
    }

    // Display the horrifying jump scare if it is time for it to appear
    if (displayJumpScareSetting == true) {
      jumpScarer();
    }
    // Otherwise do not display the jump scare and load the core program
    else if (displayJumpScareSetting == false) {

      // Alternate between the states
      switch(currentStateSetting) {
      case STARTING_SCREEN_STATE:
        // Go to the starting screen
        showTheStartingScreen();

        // Stop execution
        break; 
      case PLAYING_SCREEN_STATE:
        // Go to the playing screen
        showThePlayScreen();

        // Stop execution
        break;
      case LOSING_SCREEN_STATE:
        // Go to the losing screen
        showTheLosingScreen();

        // Stop execution
        break;
      case VICTORY_SCREEN_STATE:
        // Go to the victory screen
        showTheVictoryScreen();

        // Stop execution
        break;
      }

      // Draw the mouse cursor in front of all the prior elements
      cursor(mouseCursorImage, 0, 0);
    }
  }
} /** [-------END-------] **/

/** -------------------------------------------------- **/

/** THE MOUSE INPUT EVENTS SECTION OF THE PROGRAM **//** [-------START-------] **/
void mouseClicked() { 
  // Special mouse click actions for the states
  // Alternate between the states
  switch(currentStateSetting) {
  case STARTING_SCREEN_STATE:
    // Make the windows change red whenever the mouse is clicked on the starting screen
    if (HauntedHouseSet1.windowsMakeRedSetting == false) {
      HauntedHouseSet1.windowsMakeRedSetting = true;
    } else if (HauntedHouseSet1.windowsMakeRedSetting == true) {
      HauntedHouseSet1.windowsMakeRedSetting = false;
    }

    // Stop execution
    break;

  case PLAYING_SCREEN_STATE:
    // Run a function to see if the mouse is at the position of the buttons
    checkMousePosition();
  }

  // Because I am a awful person I added in a random jump scare event that increases the probability each time the mouse is clicked
  callConditionsToRunTheJumpScare();
} /** [-------END-------] **/

/** -------------------------------------------------- **/

/** THE MOUSE RELEASED EVENTS SECTION OF THE PROGRAM **/
void mouseReleased() { /** [-------START-------] **/
  // Check which screen the user is on
  switch(currentStateSetting) {
  case PLAYING_SCREEN_STATE:
    // Turn drag centre off every time the mouse is released as you have stopped dragging
    dragCenter = false;
  }
} /** [-------END-------] **/

/** -------------------------------------------------- **/

/** THE MOUSE WHEEL EVENTS SECTION OF THE PROGRAM **//** [-------START-------] **/
void mouseWheel(processing.event.MouseEvent event) { 
  // Check which screen the user is on
  switch(currentStateSetting) {
  case PLAYING_SCREEN_STATE:
    // Only run these events if the game text is of a sufficient size (To prevent an out of bounds exception). There must be at least 18 lines to scroll
    if (gameText.length >= 18) {

      // Check which screen the user is on
      if (textState!=0) {
        // Do not scroll the screen on the view text screen
        return;
      }

      // Otherwise continue..
      // Record the count of each mousewheel event
      float e = event.getCount();

      // Change the position of the text
      if (e<0) {
        // Move the position down
        textStart--;
      } else if (e>0) {
        // Move the position up
        textStart++;
      }

      if (textStart<0) {
        // Reset the position
        textStart=0;
      }

      if (textStart>gameText.length-18) {
        // Reset the position
        textStart=gameText.length-18;
      }
    } else {
      // Print message to console
      println("You cannot scroll down unless the text file is large enough to do so! There must be at least 18 lines.");
    }
  }
} /** [-------END-------] **/

/** -------------------------------------------------- **/

/** THE KEY PRESSED EVENTS SECTION OF THE PROGRAM **//** [-------START-------] **/
void keyPressed() { 
  // Check which screen the user is on
  switch(currentStateSetting) {
  case PLAYING_SCREEN_STATE:
    // Check which state the text is in
    switch (textState) {
    case 0:
      // Prevent the ESC key from working as I do not want the user accidently exiting the program while going back
      key=0; // Kill the key
      break;
    case 1:
      // Print message to console
      println("Action Detected - Go To The Table View");

      // Go back to the table view again
      textState=0; 

      // Prevent the ESC key from working as I do not want the user accidently exiting the program while going back
      key=0; // Kill the key
      break;
    }
  }
} /** [-------END-------] **/