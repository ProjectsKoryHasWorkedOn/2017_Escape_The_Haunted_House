/** ------------------------------------------------- **/
/** THE FUNCTION SECTION OF THE PROGRAM **/
// End-users of the program: Do not touch any of the following functions! 
// If you want to change any of the parameters do so at Interactive_Story_Program
// If you want to see the references (where applicable) for the following functions view Interactive_Story_Notes_Modules
/** ------------------------------------------------- **/

/** THE MUTUAL SCREEN FUNCTIONS: LOAD THE GAME MENU BAR **//** [-------START-------] **/
void loadGameMenuBar() {
  // Create the Menu Bar object
  GameMenuListener = new MenuListener();
  GameMenu = new MenuBar();

  // Create the buttons
  FileMenu = new Menu("File");
  ScreenMenu = new Menu("Screen");
  SettingsMenu = new Menu("Settings");

  // Create sub menu buttons
  SettingsStartScreenMenu = new Menu("Starting Screen Settings");
  SettingsPlayingScreenMenu = new Menu("Playing Screen Settings");
  SettingsLoseScreenMenu = new Menu("Losing Screen Settings");
  SettingsGlobalMenu = new Menu("Global Settings");

  // Create all the Menu Items and add the menuListener to check their state
  // The Safely Exit Menu Item
  FileSafelyExit = new MenuItem("Safely Exit");
  FileSafelyExit.addActionListener(GameMenuListener);

  // The Readme Menu Item
  FileLicense = new MenuItem("License");
  FileLicense.addActionListener(GameMenuListener);

  FileDocumentation = new MenuItem("Documentation");
  FileDocumentation.addActionListener(GameMenuListener);

  // The Starting Screen Menu Item
  ScreenStartingScreen = new MenuItem("Starting Screen");
  ScreenStartingScreen.addActionListener(GameMenuListener);

  // The Playing Screen Menu Item
  ScreenPlayingScreen = new MenuItem("Playing Screen");
  ScreenPlayingScreen.addActionListener(GameMenuListener);

  // The Losing Screen Menu Item
  ScreenLosingScreen = new MenuItem("Losing Screen");
  ScreenLosingScreen.addActionListener(GameMenuListener);

  // The Victory Screen Menu Item
  ScreenVictoryScreen = new MenuItem("Victory Screen"+ " *" + victoryScreenLockStatus);
  ScreenVictoryScreen.addActionListener(GameMenuListener);

  // The Global Settings Sub Menu
  SettingsMuteSounds = new MenuItem("Mute / Unmute Sounds Setting");
  SettingsMuteSounds.addActionListener(GameMenuListener);

  SettingsCheat = new MenuItem("Unlock Victory Screen Cheat Setting");
  SettingsCheat.addActionListener(GameMenuListener);

  SettingsIncreaseJumpScareProbability = new MenuItem("Increase Jump Scare Probability");
  SettingsIncreaseJumpScareProbability.addActionListener(GameMenuListener);

  SettingsResetJumpScareProbability = new MenuItem("Reset Jump Scare Probability");
  SettingsResetJumpScareProbability.addActionListener(GameMenuListener);

  // The Starting Screen settings sub menu
  SettingsDrawSetting1 = new MenuItem("Draw Nothing Setting");
  SettingsDrawSetting1.addActionListener(GameMenuListener);

  SettingsDrawSetting2 = new MenuItem("Draw Rain Setting");
  SettingsDrawSetting2.addActionListener(GameMenuListener);

  SettingsDrawSetting3 = new MenuItem("Draw Lightning Setting");
  SettingsDrawSetting3.addActionListener(GameMenuListener);

  SettingsDrawSetting4 = new MenuItem("Draw Names Setting");
  SettingsDrawSetting4.addActionListener(GameMenuListener);

  SettingsDrawSetting5 = new MenuItem("Draw Trippy Sky Setting");
  SettingsDrawSetting5.addActionListener(GameMenuListener);

  // The Playing Screen settings sub menu
  SettingsViewGameText = new MenuItem("View Game Text File");
  SettingsViewGameText.addActionListener(GameMenuListener);

  SettingsSkipDeathSetting = new MenuItem("Skip / Play Death Animation");
  SettingsSkipDeathSetting.addActionListener(GameMenuListener);

  // The Losing Screen settings sub menu
  SettingsLoadAgain = new MenuItem("Draw screen again");
  SettingsLoadAgain.addActionListener(GameMenuListener);

  // Add the menu items to the game menu
  // Add to the file menu
  FileMenu.add(FileSafelyExit);
  FileMenu.add(FileLicense);
  FileMenu.add(FileDocumentation);

  // Add to the screen menu
  ScreenMenu.add(ScreenStartingScreen);
  ScreenMenu.add(ScreenPlayingScreen);
  ScreenMenu.add(ScreenLosingScreen);
  ScreenMenu.add(ScreenVictoryScreen);

  // Add to the settings menu
  SettingsMenu.add(SettingsStartScreenMenu);
  SettingsMenu.add(SettingsPlayingScreenMenu);
  SettingsMenu.add(SettingsLoseScreenMenu);
  SettingsMenu.add(SettingsGlobalMenu);

  // Add the sub menus
  // Starting Screen Setting Sub Menu
  SettingsStartScreenMenu.add(SettingsDrawSetting1);
  SettingsStartScreenMenu.add(SettingsDrawSetting2);
  SettingsStartScreenMenu.add(SettingsDrawSetting3);
  SettingsStartScreenMenu.add(SettingsDrawSetting4);
  SettingsStartScreenMenu.add(SettingsDrawSetting5);

  // Playing Screen Settings Sub Menu
  SettingsPlayingScreenMenu.add(SettingsViewGameText);
  SettingsPlayingScreenMenu.add(SettingsSkipDeathSetting);

  // Losing Screen Settings Sub Menu
  SettingsLoseScreenMenu.add(SettingsLoadAgain);

  // Global Settings Sub Menu
  SettingsGlobalMenu.add(SettingsMuteSounds);
  SettingsGlobalMenu.add(SettingsCheat);
  SettingsGlobalMenu.add(SettingsResetJumpScareProbability);
  SettingsGlobalMenu.add(SettingsIncreaseJumpScareProbability);

  // Add the buttons to the menu
  GameMenu.add(FileMenu);
  GameMenu.add(ScreenMenu);
  GameMenu.add(SettingsMenu);

  // Add the menu to the frame
  PSurfaceAWT awtSurface = (PSurfaceAWT)surface;
  PSurfaceAWT.SmoothCanvas smoothCanvas = (PSurfaceAWT.SmoothCanvas)awtSurface.getNative();
  smoothCanvas.getFrame().setMenuBar(GameMenu);
} /** [-------END-------] **/

/** ------------------------------------------------- **/

/** THE MUTUAL SCREEN FUNCTIONS: MUTUAL SCREEN LOAD **//** [-------START-------] **/
void mutualScreenLoad() {
  // Load the minim sound library
  SoundLibrary = new Minim(this);

  // Load the game menu bar
  loadGameMenuBar();

  // Load the program icon
  programIconImage = loadImage(PROGRAM_ICON_IMAGE_FILENAME);
  surface.setIcon(programIconImage);

  // Load the mouse cursor 
  mouseCursorImage = loadImage(MOUSE_CURSOR_IMAGE_FILENAME);

  // The pink monster
  pinkMonsterImage = loadImage(PINK_MONSTER_IMAGE_FILENAME);

  // Load the font files
  SmallHauntedFont = createFont(FONT_FILE_FILENAME, 12); 
  NormalHauntedFont = createFont(FONT_FILE_FILENAME, 14); 
  LargeHauntedFont = createFont(FONT_FILE_FILENAME, 16); 
  HugeHauntedFont = createFont(FONT_FILE_FILENAME, 20); 
  ProgramTitleHauntedFont = createFont(FONT_FILE_FILENAME, 50);
} /** [-------END-------] **/

/** ------------------------------------------------- **/

/** THE MUTUAL SCREEN FUNCTIONS: GENERAL COMMANDS USED FOR CONSISTENCY **//** [-------START-------] **/
// Centre the text command
void centreText() {
  textAlign(CENTER);
}

// Left text command
void leftText() {
  textAlign(CORNER);
}

// Centre the object command
void centreObject() {
  shapeMode(CENTER);
  rectMode(CENTER);
  ellipseMode(CENTER);
  imageMode(CENTER);
}

// Corner object command
void cornerObject() {
  shapeMode(CORNER);
  rectMode(CORNER);
  ellipseMode(CORNER);
  imageMode(CORNER);
}

void whiteStroke() {
  stroke(255, 255, 255);
}

// Small stroke weight
void smallStrokeWeight() {
  strokeWeight(1);
}

// Large stroke weight
void largeStrokeWeight() {
  strokeWeight(3);
}

// Red command
void redFill(int Input_Opacity) {
  fill(255, 0, 0, Input_Opacity);
}

// Grey command
void greyFill() {
  fill(200, 200, 200);
}

// Green command
void greenFill() {
  fill(0, 150, 0);
}

// Pale blue command
void paleBlueFill() {
  fill(84, 162, 224);
}

// White command
void whiteFill() {
  fill(255, 255, 255);
}

// Black command
void blackFill() {
  fill(0);
}

// The font loader
void fontLoader(PFont inputFontFile) {
  // Load / apply the font
  textFont(inputFontFile);
}

// Set either a dark or light background
void setBackground(boolean Input_BackgroundConditional) {
  // Set the background to be dark or light depending on the settings
  if (Input_BackgroundConditional == false) {
    background(7, 94, 211); // make the background a nice blue
  } else if (Input_BackgroundConditional == true) {
    background(0, 0, 0); // make the background a dark black
  }
} /** [-------END-------] **/

/** ------------------------------------------------- **/

/** THE MUTUAL SCREEN FUNCTIONS: THE ERROR CHECKER **//** [-------START-------] **/
void errorChecker() {
  /** CANVAS SIZE ERROR CHECKER **/
  // Make sure vars CANVAS_WIDTH and CANVAS_HEIGHT equate to size(CANVAS_WIDTH,CANVAS_HEIGHT)
  if ( (width != CANVAS_WIDTH) || (height != CANVAS_HEIGHT) ) {
    // Set the setting
    errorsFound = true;

    // Print error to console
    println("ERROR DETECTED - MAKE SURE size(width, ...) equals final int CANVAS_WIDTH and size(..., height) equals final int CANVAS_HEIGHT");
    println("CANVAS_WIDTH: " + CANVAS_WIDTH + " != width: " + width + " OR " + "CANVAS_HEIGHT: " + CANVAS_HEIGHT + " != height: " + height);
    exit();
  }

  /** GAME TEXT ERROR CHECKER **/
  // Cycle through the game text array
  for (int i = 0; i < gameText.length; i++) {
    // Trim all lines 
    gameText[i]=trim(gameText[i]);

    // Check if any of the lines are empty
    if (gameText[i].equals("")) {
      // Set the setting
      errorsFound = true;

      // Print a message to the console
      println("ERROR DETECTED - ONE OF THE LINES IS EMPTY. REMOVE GAPS BETWEEN LINES IN gameText.txt");
      exit();
    }
  }

  // Cycle through the game text array again if errorsFound = false
  if (errorsFound == false) {

    for (int i = 0; i < gameText.length; i++) {

      // Split up the components of the gameText into lines and then into parts - each part is seperated by a "#"
      thisLine = split(gameText[i], "#"); 

      // Print a message to the console if necessary (how many components does the line have)
      // println (i + ": "+gameText[i]+ "\t -------- has length " + thisLine.length);

      // Check if there are not 4, 5, 7, 9, or 11 components to the line     
      if (thisLine.length !=4 && thisLine.length !=5 && thisLine.length !=7 && thisLine.length !=9 && thisLine.length !=11) {
        // Set the setting
        errorsFound = true;

        // Print error to console
        println("ERROR DETECTED - NOT THE RIGHT NUMBER OF COMPONENTS IN THE LENGTH OF "+ gameText[i]);
        exit();
      }

      // Check if there is a duplicate label 
      if (hashMap.containsKey(thisLine[LABEL_INDEX])) {
        // Set the setting
        errorsFound = true;

        // Print error to the console
        println("ERROR DETECTED - A DUPLICATE LABEL HAS BEEN FOUND IT IS CALLED "+thisLine[LABEL_INDEX]);
        exit();
      }

      // Store the label in the HashMap and associate it with a particular line number
      hashMap.put(thisLine[LABEL_INDEX], i);
    } 

    // Set thisLine back to nothing
    thisLine=null;
  }
} /** [-------END-------] **/

/** ------------------------------------------------- **/

/** THE MUTUAL SCREEN FUNCTIONS: BACKGROUND MUSIC PLAYER + MUTER **//** [-------START-------] **/
void backgroundMusicPlayer(String Input_File_Name, boolean Input_muteSoundsSetting) {
  // Background music playing
  if (isBackgroundMusicPlayingSetting == true) {

    // Stop the audio player
    BackgroundMusic.close();

    // Change the setting
    isBackgroundMusicPlayingSetting = false;
  }
  // Background music not playing
  else if (isBackgroundMusicPlayingSetting == false) {

    if (Input_muteSoundsSetting == false) {

      // Load the audio player with the inputted file name if sound is allowed
      BackgroundMusic = SoundLibrary.loadFile(Input_File_Name);

      // Play the sound inputted
      BackgroundMusic.play();
    } else if (Input_muteSoundsSetting == true) {
      // Print message to console
      println("Sound file: " + Input_File_Name + " stopped");

      // Do nothing for silence.
      // Alternatively (just in case) load "silence.mp3" as this will play nothing
      clearSound();
    }

    // Change the setting
    isBackgroundMusicPlayingSetting = true;
  }
} /** [-------END-------] **/

/** ------------------------------------------------- **/

/** THE MUTUAL SCREEN FUNCTIONS: THE HOUSE DRAW SETTINGS **//** [-------START-------] **/

void FullHouse() {
  // Set full house settings
  HauntedHouseSet1.houseXPos = hauntedHouseXPos;
  HauntedHouseSet1.houseYPos = hauntedHouseYPos;
  HauntedHouseSet1.houseScaleSize = hauntedHouseScaleSize;
  HauntedHouseSet1.displayDoorOnlySetting = false;
}

void HouseDoor() {
  // Set house door settings
  HauntedHouseSet1.houseScaleSize = 1.5;
  HauntedHouseSet1.houseXPos = -100;
  HauntedHouseSet1.houseYPos = 0;
  HauntedHouseSet1.displayDoorOnlySetting = true;
}

/** [-------END-------] **/

/** ------------------------------------------------- **/

/** THE MUTUAL SCREEN FUNCTIONS: SFX PLAYER + MUTER **//** [-------START-------] **/
void SFXPlayer(String Input_File_Name, boolean Input_muteSoundsSetting) {
  // SFX playing
  if (isSFXPlayingSetting == true) {

    // Stop the audio player
    SFX.close();

    // Change the setting
    isSFXPlayingSetting = false;
  }
  // SFX not playing
  else if (isSFXPlayingSetting == false) {

    if (Input_muteSoundsSetting == false) {

      // Load the audio player with the inputted file name if sound is allowed
      SFX = SoundLibrary.loadFile(Input_File_Name);

      // Play the sound inputted
      SFX.play();
    } else if (Input_muteSoundsSetting == true) {
      // Print message to console
      println("Sound file: " + Input_File_Name + " stopped");

      // Do nothing for silence.
      // Alternatively (just in case) load "silence.mp3" as this will play nothing
      clearSound();
    }

    // Change the setting
    isSFXPlayingSetting = false;
  }
} /** [-------END-------] **/

/** ------------------------------------------------- **/

/** THE MUTUAL SCREEN FUNCTIONS: FULLY CLEAR THE CANVAS **//** [-------START-------] **/
void clearTheCanvas() {
  // Close the audio players only if they are running
  println("Restarting the audio players");

  // Clear the sounds
  clearSound();

  // Clear the background
  println("Clearing the background");
  clear();
  setBackground(true);

  // Set the setting to play the background SFX again
  startPlayingBackgroundMusicAgainSetting = true;

  // Redraw elements
  println("Run the draw function again");
  redraw();

  // Set the setting to run this function false now
  clearTheCanvasSetting = false;
} /** [-------END-------] **/

/** ------------------------------------------------- **/

/** THE MUTUAL SCREEN FUNCTIONS: CLEAR THE SOUNDS **//** [-------START-------] **/
void clearSound() {
  // Using the close function results in a null error so I simply play two blank audio files
  // Note that it must be set to false!
  clearBackground();
  clearSFX();
} 

void clearBackground() {
  // Note that it must be set to false!
  backgroundMusicPlayer(SILENT_SOUND_FILENAME, false);
}

void clearSFX() {
  // Stop the rain sound straight away (it seems to break bounds)
  if (rainCurrentlyPlayingSetting == true) {
    // Close the SFX
    SFX.close();
  }

  // Note that it must be set to false!
  SFXPlayer(SILENT_SOUND_FILENAME, false);
} /** [-------END-------] **/

/** ------------------------------------------------- **/

/** THE MUTUAL SCREEN FUNCTIONS: PARTIALLY CLEAR THE CAVAS **//** [-------START-------] **/
void partialClearTheCanvas() {
  // Clear the canvas partially
  clear();
  setBackground(true);
  redraw();

  // Stop clearing the canvas
  partialClearTheCanvasSetting = false;
} /** [-------END-------] **/

/** ------------------------------------------------- **/

/** THE MUTUAL SCREEN FUNCTIONS: THE JUMP SCARER **//** [-------START-------] **/
void callConditionsToRunTheJumpScare() {
  // Each click increase the counter by 1
  jumpScareCounter = jumpScareCounter + 1;

  // Set probability of jump scare randomly for maximum evil
  jumpScareProbability = int(random(jumpScareCounter, jumpScareCounter + likelihoodOfScareSetting)); //  

  // Jump scare time
  if (jumpScareCounter == jumpScareProbability) { // Probability for it to occur is 1 in 30!
    // Print message to console
    println("Jump Scare Random Event");

    // Run the jump scare function
    playedJumpScareSoundAlreadySetting = false;
    displayJumpScareSetting = true;

    // Set the initial start time
    jumpScareRunTimer = int(millis()/1000);

    // Set the initial stop time
    jumpScareStopTimer = int(millis()/1000) + jumpScareStopAfterXSeconds;
  }

  // Turn the jump scare off it has displayed 1 x after you click again
  if ( (displayJumpScareSetting == true) && (alreadyDisplayedJumpScareSetting == true) ) {
    // Stop the jump scare
    alreadyDisplayedJumpScareSetting = false;
    displayJumpScareSetting = false; 

    // Partially clear the canvas
    partialClearTheCanvas();
  }
}

void jumpScarer() {
  // Set the run time to the current time
  jumpScareRunTimer = int(millis()/1000);

  // Set display jump scare to TRUE
  displayJumpScareSetting = true;

  // Set the background
  setBackground(true);

  // Display the pink monster
  imageMode(CENTER);
  image(pinkMonsterImage, CANVAS_WIDTH/2, CANVAS_HEIGHT/2, 500, 500);

  // Set the text settings
  redFill(200);
  fontLoader(HugeHauntedFont);

  // Display the text
  text("You shall not escape me! Unless you click a few times", CANVAS_WIDTH/2, 100);

  // Play the jump scare SFX 1x
  if (playedJumpScareSoundAlreadySetting == false) {
    SFXPlayer(JUMP_SCARE_SOUND_FILENAME, muteSoundsSetting);
    playedJumpScareSoundAlreadySetting = true;
  }

  // Skip the screen only if time has elapsed
  if (jumpScareRunTimer == jumpScareStopTimer) {
    // End the jump scare
    alreadyDisplayedJumpScareSetting = true;

    // Clear some elements
    partialClearTheCanvas();
  } else if (jumpScareRunTimer != jumpScareStopTimer) {
    // You must wait for the timer to pass before you can click the screen away...
  }
} /** [-------END-------] **/

/** ------------------------------------------------- **/

/** STARTING SCREEN FUNCTIONS: LOAD THE STARTING SCREEN **//** [-------START-------] **/
void startingScreenLoad() {
  // Should the program display lightning or rain? 
  if (manuallySelectStartingScreenAnimationSetting == false) {
    selectedStartingScreenAnimationSetting = int(random(5)); // Generate a number between 0 and 4
  }

  // Set the background via an external function
  setBackground(true); // Parameter already set.
}  /** [-------END-------] **/

/** ------------------------------------------------- **/

/** STARTING SCREEN FUNCTIONS: DRAW THE STARTING SCREEN **//** [-------START-------] **/
void showTheStartingScreen() {

  // Play the music again if you switch states via the navigation bar
  if (startPlayingBackgroundMusicAgainSetting == true) {
    // Play the music
    println("Starting the sound again");

    // Reset the timer
    playStartingScreenSoundAfterXsecondsTimer = int(millis()/1000) + 1;

    // Set the setting to false
    startPlayingBackgroundMusicAgainSetting = false;
  }

  // The default command for making sound files loop does not work, i.e. [SoundFile Name].loop();
  // So I will run sounds when the sound file is done playing to make the sounds loop.

  // Set the sound to start immediately once
  if (isStartingScreenTimerSet == false) {
    playStartingScreenSoundAfterXsecondsTimer = int(millis()/1000) + 1;
    isStartingScreenTimerSet = true;
  }

  // The starting screen sound loop (initially starts at 0. Subsequently runs as soon as it stops)
  if (playStartingScreenSoundAfterXsecondsTimer == int(millis()/1000)) {
    // Print message to console
    println("Playing the background music");

    // Play the starting screen sound again
    backgroundMusicPlayer(STARTING_SCREEN_SOUND_FILENAME, muteSoundsSetting);

    // Increment the timer
    playStartingScreenSoundAfterXsecondsTimer = playStartingScreenSoundAfterXsecondsTimer + incrementStartScreenSoundTimerByX;
  }

  // Set the full house draw settings
  FullHouse();

  // Set the starting screen animation
  switch(selectedStartingScreenAnimationSetting) {
  case 0: // The nothing setting
    // Do nothing for the animation

    // Draw the house
    HauntedHouseSet1.DrawTheHauntedHouse();

    // End the selection
    break;
  case 1: // The rain setting
    // Check if the rain has loaded before
    if (hasStartingRainTimeBeenSetSetting == false) {
      // Set the time to be the current program time
      playRainSFXAgainAfterXSecondsTimer = int(millis()/1000);

      // Set the setting to true
      hasStartingRainTimeBeenSetSetting = true;
    }

    // Play the rain SFX if the times line up
    if (int(millis()/1000) == playRainSFXAgainAfterXSecondsTimer) {
      // Set rain as not playing
      rainCurrentlyPlayingSetting = false;

      // Increment the timer
      playRainSFXAgainAfterXSecondsTimer = playRainSFXAgainAfterXSecondsTimer + incrementRainSoundTimerByX;

      // Load the SFX 1x
      if (rainCurrentlyPlayingSetting == false) {
        // Load the SFX
        SFXPlayer(RAIN_SOUND_FILENAME, muteSoundsSetting);

        // Set rain as playing
        rainCurrentlyPlayingSetting = true;
      }
    }

    // Clear the background after rain is drawn
    setBackground(true);

    // Draw the rain sets
    RainClass1.DrawRain();
    RainClass2.DrawRain();
    RainClass3.DrawRain();

    // Draw the house
    HauntedHouseSet1.DrawTheHauntedHouse();

    // End the selection
    break;
  case 2: // The lightning setting 

    // Prevent the lightning from moving the whole canvas
    pushMatrix();
    // Call the lightning
    LightningClass1.DrawLightningConditions();
    popMatrix();

    // Draw the house
    HauntedHouseSet1.DrawTheHauntedHouse(); 

    // End the selection
    break;
  case 3: // The name maker setting
    // Draw names
    NameMakerClass1.CallTheFunctions();

    // Draw the house
    HauntedHouseSet1.DrawTheHauntedHouse(); 

    // End the selection
    break;      
  case 4: // The trippy sky setting
    // Draw trippy sky
    TrippySkyClass1.SpookyFlashingSky();

    // Draw the house
    HauntedHouseSet1.DrawTheHauntedHouse(); 

    // End the selection
    break;
  }

  // Draw clouds
  SimpleCloudsClass1.DrawClouds();
  SimpleCloudsClass2.DrawClouds();

  // Combine two clouds to form one cloud
  SimpleCloudsClass3.DrawClouds();
  SimpleCloudsClass4.DrawClouds();

  SimpleCloudsClass5.DrawClouds();
  SimpleCloudsClass6.DrawClouds();

  // Custom font loader fixed to reduce lag
  // Apply text settings
  centreText();
  redFill(200);
  fontLoader(ProgramTitleHauntedFont); // Alternatively textSize(70);

  // Display the text
  text("The Haunted House", CANVAS_WIDTH/2, CANVAS_HEIGHT-100);

  // Text settings
  whiteFill();
  centreText();
  fontLoader(HugeHauntedFont); // Alternatively textSize(20);

  // Display the authors
  text("Created by Corey" + " " + "and Sara", CANVAS_WIDTH/2, CANVAS_HEIGHT-60);
} /** [-------END-------] **/

/** ------------------------------------------------- **/

/** PLAYING SCREEN FUNCTIONS: LOAD THE PLAYING SCREEN **/
void loadThePlayScreen() {
  // Load the game text
  gameText = loadStrings("gameText.txt");

  // Populate the valuesX array
  for (int i=4; i<valuesX.length; i++) {
    valuesX[i] = COLUMN_X_POS+(i-3)*109;
  }

  // Load the background images
  playingScreenBackgroundAttic = loadImage(PLAYING_BACKGROUND_ATTIC_IMAGE_FILENAME); // Attic background
  playingScreenBackgroundBasement = loadImage(PLAYING_BACKGROUND_BASEMENT_IMAGE_FILENAME); // Basement background
  playingScreenBackgroundBedroom1 = loadImage(PLAYING_BACKGROUND_BEDROOM1_IMAGE_FILENAME); // Bedroom 1 background
  playingScreenBackgroundBedroom2 = loadImage(PLAYING_BACKGROUND_BEDROOM2_IMAGE_FILENAME); // Bedroom 2 background 
  playingScreenBackgroundBedroom3 = loadImage(PLAYING_BACKGROUND_BEDROOM3_IMAGE_FILENAME); // Bedroom 3 background 
  playingScreenBackgroundFoyer = loadImage(PLAYING_BACKGROUND_FOYER_IMAGE_FILENAME); // Foyer background
  playingScreenBackgroundHallway1 = loadImage(PLAYING_BACKGROUND_HALLWAY1_IMAGE_FILENAME); // Hallway 1 background
  playingScreenBackgroundHallway2 = loadImage(PLAYING_BACKGROUND_HALLWAY2_IMAGE_FILENAME); // Hallway 2 background 
  playingScreenBackgroundKitchen = loadImage(PLAYING_BACKGROUND_KITCHEN_IMAGE_FILENAME); // Kitchen background
  playingScreenBackgroundLibrary = loadImage(PLAYING_BACKGROUND_LIBRARY_IMAGE_FILENAME); // Library background
}

/** ------------------------------------------------- **/

/** PLAYING SCREEN FUNCTIONS: DRAW THE PLAYING SCREEN **//** [-------START-------] **/
void showThePlayScreen() {

  // Set the background
  background(0);

  // Text settings
  whiteFill();
  fontLoader(NormalHauntedFont);
  centreText();

  // Object settings fix for the losing screen screwing up the text position
  cornerObject();

  if (textState==0) {
    // Show the table (the GameText)
    showTable();
  } else if (textState==1) {
    // Analyse the current line  
    parseText();
  }

  // Play the music again if you switch states
  if (startPlayingBackgroundMusicAgainSetting == true) {
    // Play the music
    println("Starting the sound again");

    // Change the settings
    playPlayScreenSoundAfterXSecondsTimer = int(millis()/1000) + 1;

    // Set the setting to false
    startPlayingBackgroundMusicAgainSetting = false;
  }

  // Check if this has been called before, if not set the start time to be the current time
  if (playScreenFirstRunSetting == false) {
    playPlayScreenSoundAfterXSecondsTimer = int(millis()/1000) + 1;
    playScreenFirstRunSetting = true;
  }

  // Play the background music after it stops playing
  if (playPlayScreenSoundAfterXSecondsTimer == int(millis()/1000)) {
    // Print message to console
    println("Playing the background music");

    // Increment the timer
    playPlayScreenSoundAfterXSecondsTimer = playPlayScreenSoundAfterXSecondsTimer + incrementPlayingScreenSoundTimerByX;

    // Play the background music
    backgroundMusicPlayer(PLAYING_SCREEN_SOUND_FILENAME, muteSoundsSetting);
  }
} 


// Display text and buttons
void parseText() {
  // Text settings
  whiteFill();
  centreText();

  // we use split to get the components of a line
  thisLine = split(gameText[pointer], "#"); 

  int lastComponent=thisLine.length-1; 
  callASpecialFunction(thisLine[lastComponent]); 

  // display number / this is more for testing / in the upper left corner (optional)
  textSize(14); // small text size
  text(pointer, 22, 22); 

  // build buttons 
  buildButtons(); 

  // show main text // same for all kinds of lines no matter how many components there are

  // Text settings
  textSize(22); // big text size

  // Display the text
  text (thisLine[QUESTION], CANVAS_WIDTH/2, CANVAS_HEIGHT/2-200);

  // Text settings
  textSize(14); // small text size

  // Display the buttons 
  for (Button b : ButtonClass1) {
    b.displayButton();
  }
}

// Call a specific function
void callASpecialFunction(String command) {

  String cmdNumber = trim (command.replace("command", ""));
  int cmd = int(cmdNumber);

  switch(cmd) {

  case 0:
    // Background check
    background(0);

    // Fix for background position
    imageMode(CENTER);

    // Use if conditionals to determine what line number / room you are at
    // The door background
    if (pointer == 0) {
      // Set background
      background(0);

      // Change house draw settings to just the door
      HouseDoor();

      // Display the house
      HauntedHouseSet1.DrawTheHauntedHouse();

      // Remove any issues that drawing the house caused
      // Restore text position
      cornerObject();

      // Make the text visible
      stroke(255);
      fill(255);
    }
    // The foyer backgrounds
    else if ( (pointer == 1) || (pointer == 2) || (pointer == 3) || (pointer == 4) ) {
      // Use image backgrounds
      image(playingScreenBackgroundFoyer, CANVAS_WIDTH/2, CANVAS_HEIGHT/2, CANVAS_WIDTH, CANVAS_HEIGHT);
    }
    // The library backgrounds
    else if ( (pointer == 5) || (pointer == 6) ) {
      // Use image backgrounds
      image(playingScreenBackgroundLibrary, CANVAS_WIDTH/2, CANVAS_HEIGHT/2, CANVAS_WIDTH, CANVAS_HEIGHT);
    }
    // The bedroom 1 backgrounds
    else if (pointer == 7) {
      // Use image backgrounds
      image(playingScreenBackgroundBedroom1, CANVAS_WIDTH/2, CANVAS_HEIGHT/2, CANVAS_WIDTH, CANVAS_HEIGHT);
    }
    // The kitchen backgrounds
    else if (pointer == 8) {
      // Use image backgrounds
      image(playingScreenBackgroundKitchen, CANVAS_WIDTH/2, CANVAS_HEIGHT/2, CANVAS_WIDTH, CANVAS_HEIGHT);
    }
    // The bedroom 2 backgrounds
    else if (pointer == 9) {
      // Use image backgrounds
      image(playingScreenBackgroundBedroom2, CANVAS_WIDTH/2, CANVAS_HEIGHT/2, CANVAS_WIDTH, CANVAS_HEIGHT);
    }
    // Attic backgrounds
    else if (pointer == 10) {
      // Use image backgrounds
      image(playingScreenBackgroundAttic, CANVAS_WIDTH/2, CANVAS_HEIGHT/2, CANVAS_WIDTH, CANVAS_HEIGHT);
    }
    // Hallway 1 backgrounds
    else if (pointer == 11) {
      // Use image backgrounds
      image(playingScreenBackgroundHallway1, CANVAS_WIDTH/2, CANVAS_HEIGHT/2, CANVAS_WIDTH, CANVAS_HEIGHT);
    }
    // Hallway 2 backgrounds
    else if (pointer == 12) {
      // Use image backgrounds
      image(playingScreenBackgroundHallway2, CANVAS_WIDTH/2, CANVAS_HEIGHT/2, CANVAS_WIDTH, CANVAS_HEIGHT);
    }
    // Basement backgrounds
    else if (pointer == 13) {
      // Use image backgrounds
      image(playingScreenBackgroundBasement, CANVAS_WIDTH/2, CANVAS_HEIGHT/2, CANVAS_WIDTH, CANVAS_HEIGHT);
    }
    // Bedroom 3 backgrounds
    else if (pointer == 14) {
      // Use image backgrounds
      image(playingScreenBackgroundBedroom3, CANVAS_WIDTH/2, CANVAS_HEIGHT/2, CANVAS_WIDTH, CANVAS_HEIGHT);
    }
    // Black backgrounds
    else {
      // Use blank background - fix issue
      background(0, 0, 0);
    }
    break;
  case 1:
    // Make sure you are on the right pointer
    if (pointer == 15) {
      // Check if the user wants to skip the lose screen animation
      if (skipDeath == false) {

        // Print the action to the console
        println("Action - Draw Losing Screen Again");

        // Stop all SFX
        clearSFX();

        // Clear the canvas setting change
        clearTheCanvasSetting = true;

        // Make the flash screen appear again
        resetFlashScreens();

        // Make the lose screen also load again
        commandToLoadTheLoseScreenAgain = true;

        // Print the action to the console
        println("Action - Go to the Losing Screen");

        // Change setting
        startPlayingBackgroundMusicAgainSetting = true;

        // Set the new state 
        currentStateSetting = LOSING_SCREEN_STATE;
      }

      // Reset the room position
      pointer = 0;
    } else {
      println("Wrong pointer");
    }
    break;
    // Victory: The victory screen
  case 2:
    // Make sure you are on the right pointer
    if (pointer == 16) { 
      // Print the action to the console
      println("Action - Go to the Victory Screen");

      // Stop all SFX
      clearSFX();

      // Clear the canvas setting change
      clearTheCanvasSetting = true;

      // Change the setting
      startPlayingBackgroundMusicAgainSetting = true;

      // Set the new state
      currentStateSetting = VICTORY_SCREEN_STATE;

      // Reset the room position
      pointer = 0;
      break;
    } else {
      println("Wrong pointer");
    }
    // Back to the starting screen
  case 3:
    // Make sure you are on the right pointer
    if (pointer == 18) {
      // Print the action to the console
      println("Action - Go to the Starting Screen");

      // Stop all SFX
      clearSFX();

      // Clear the canvas setting change
      clearTheCanvasSetting = true;

      // Set the new state
      currentStateSetting = STARTING_SCREEN_STATE;

      // Reset the rain
      hasStartingRainTimeBeenSetSetting = false;

      // Reset the room position
      pointer = 0;
    } else {
      println("Wrong pointer");
    }

    break;
  }
}

// Cycle through the buttons and see if the mouse is over the position
void checkMousePosition() {
  // Check which text state the user is on
  switch (textState) { 
  case 0:
    // Check if the left mouse button is pressed
    if (mouseButton == LEFT) {
      int k=0; 

      // Cycle through
      for (int i=textStart; i<min(textStart+18, gameText.length); i++) {

        // Check where the mouse is
        if (mouseY < k*32+55) { 
          pointer=i;
          textState=1; 
          println("Action - Go Here"); 
          return;
        }
        k++;
      }
      textState=1; 
      return;
    } 
    // Check if the middle mouse button is pressed
    else if (mouseButton == CENTER) {
      // Change setting
      dragCenter=true;
    }
    // Finish process if the middle mouse button was pressed 
    if (textState==0) {
      return;
    }
    break;

  case 1: 
    if (pointer==UNDEFINED) {
      // restart 
      pointer = 0;
      return;
    }
    // branch, go to line associated button
    for (Button b : ButtonClass1) {
      if (b.mouseOver()) {
        //go to next line
        b.setPointer();
      }
    }
    break;
  }
}

// Build the buttons
void buildButtons() {
  // This function is complicated.  
  // Here we bring the current line into buttons and their pointers. 
  // - There are 5 different types of lines:
  //   - Those with 0 button (= text for the room + line to jump to) 
  //   - Those with 1 button (= text for the room + text for button + line to jump to) 
  //   - Those with 2 buttons (= text for the room + 2 texts for button + 2 lines to jump to)
  //   - Those with 3 buttons (= text for the room + 3 texts for button + 3 lines to jump to)
  //   - Those with 4 buttons (= text for the room + 4 texts for button + 4 lines to jump to)
  // - As you can see, the number of components varies from 3 to 10.  

  // Set the constants for the buttons
  float wButton=300, hButton=25;

  // Reset all buttons 
  for (int i=0; i<4; i++) {
    ButtonClass1[i]=new Button(2, 2, wButton, hButton, "", "");
    ButtonClass1[i].buttonExists=false;
  }

  // Draw buttons according to the number of components in the line
  switch (thisLine.length) {
  case 4:
    ButtonClass1[0]=new Button(50, 250, CANVAS_WIDTH+10, CANVAS_HEIGHT+10, "", thisLine[THREE_COMPONENTS_POINTER]);
    break; 
  case 5:
    ButtonClass1[0]=new Button(50, 250, wButton, hButton, thisLine[FOUR_COMPONENTS_TEXT_1], thisLine[FOUR_COMPONENTS_BUTTON_POINTER]);
    break; 
  case 7: 
    ButtonClass1[0]=new Button(50, 250, wButton, hButton, thisLine[SIX_COMPONENTS_TEXT_1], thisLine[SIX_COMPONENTS_POINTER_1]);
    ButtonClass1[1]=new Button(50, 250+hButton+80, wButton, hButton, thisLine[SIX_COMPONENTS_TEXT_2], thisLine[SIX_COMPONENTS_POINTER_2]);  
    break; 
  case 9:
    ButtonClass1[0]=new Button(50, 250, wButton, hButton, thisLine[EIGHT_COMPONENTS_TEXT_1], thisLine[EIGHT_COMPONENTS_POINTER_1]);
    ButtonClass1[1]=new Button(50, 250+hButton+80, wButton, hButton, thisLine[EIGHT_COMPONENTS_TEXT_2], thisLine[EIGHT_COMPONENTS_POINTER_2]);
    ButtonClass1[2]=new Button(50, 250+hButton*2+80*2, wButton, hButton, thisLine[EIGHT_COMPONENTS_TEXT_3], thisLine[EIGHT_COMPONENTS_POINTER_3]);    
    break; 

  case 11:
    // Declare data structures
    int index  = TEN_COMPONENTS_TEXT_1; 
    int index2 = TEN_COMPONENTS_POINTER_1;

    // Cycle through a for loop
    for (int i=0; i<4; i++) {
      // Populate the button array
      ButtonClass1[i]=new Button(50, 250+hButton*(i)+80*(i), wButton, hButton, thisLine[index], thisLine[index2]);

      // Increment the index values
      index++;
      index2++;
    }        
    break;
  }
}

// Display a table of the text file
void showTable() {
  // Set the background
  setBackground(true);

  // Text settings
  leftText();

  if (dragCenter) {
    textStart=int(map(mouseY, 0, height, 0, gameText.length-18));
    if (textStart<0)
      textStart=0;
    if (textStart>gameText.length-18)
      textStart=gameText.length-18;

    if (textStart<0)
      textStart=0;
  }

  // Text settings
  redFill(200);
  textSize(20); 

  // Display the text
  text(" *** View Entire List ***", 10, 20);

  // Text settings
  redFill(200);
  textSize(12);

  // Display the text
  text("Mouse wheel: Scroll down (gameText.txt must be long enough)", 10, height -100);
  text("LMB: Open a line", 10, height - 80);
  text("Press any key, including ESC to return to this screen", 10, height - 60);

  // Text settings
  whiteFill();
  textSize(10);

  int k=0;   
  // Cycle through
  for (int i=textStart; i<min(textStart+18, gameText.length); i++) {
    // we use split to get the components of a line
    thisLine = split(gameText[i], "#"); 
    textArray(thisLine, k*32+55, i);
    k++;
  }
}

// Display text lines as table lines
void textArray(String[] textArrayLocal, int y, int lineNumber ) {
  // Text settings
  fill(255);

  // Display text
  text(lineNumber, valuesX[0], y) ;

  for (int i=0; i<textArrayLocal.length; i++) {
    text(textArrayLocal[i], valuesX[i+1], y) ;
  }
}

/** [-------END-------] **/

/** ------------------------------------------------- **/

/** LOSING SCREEN FUNCTIONS: LOAD THE LOSING SCREEN **//** [-------START-------] **/
void losingScreenLoad() {
  // Load the monster images
  batImage = loadImage(BAT_IMAGE_FILENAME); // Bat image
  catImage = loadImage(CAT_IMAGE_FILENAME); // Cat image
  demonImage = loadImage(DEMON_IMAGE_FILENAME); // Demon image
  devilImage = loadImage(DEVIL_IMAGE_FILENAME); // Devil image
  ghostImage = loadImage(GHOST_IMAGE_FILENAME); // Ghost image
  skeletonImage = loadImage(SKELETON_IMAGE_FILENAME); // Skeleton image
  slimeMonsterImage = loadImage(SLIME_MONSTER_IMAGE_FILENAME); // Slime monster image
  spiderImage = loadImage(SPIDER_IMAGE_FILENAME); // Spider image
  zombieImage = loadImage(ZOMBIE_IMAGE_FILENAME); // Zombie image
  gillManImage = loadImage(GILL_MAN_IMAGE_FILENAME); // Gill man image
  pinkMonsterImage = loadImage(PINK_MONSTER_IMAGE_FILENAME); // Pink monster image
  serialKillerImage = loadImage (SERIAL_KILLER_IMAGE_FILENAME); // Serial Killer image

  // Load the background images
  losingScreenBackground0Image = loadImage(LOSING_BACKGROUND_0_IMAGE_FILENAME); // Background 0 image
  losingScreenBackground1Image = loadImage(LOSING_BACKGROUND_1_IMAGE_FILENAME); // Background 1 image
  losingScreenBackground2Image = loadImage(LOSING_BACKGROUND_2_IMAGE_FILENAME); // Background 2 image
  losingScreenBackground3Image = loadImage(LOSING_BACKGROUND_3_IMAGE_FILENAME); // Background 3 image
  losingScreenBackground4Image = loadImage(LOSING_BACKGROUND_4_IMAGE_FILENAME); // Background 4 image
  losingScreenBackground5Image = loadImage(LOSING_BACKGROUND_5_IMAGE_FILENAME); // Background 5 image

  // Initial load of the lose screen, no conditions
  loadTheLoseScreenOnDemand();
}

void loadTheLoseScreenOnDemand() {
  // Select a random monster to be displayed
  selectedMonsterSetting = int(random(numberOfMonstersSetting+1));

  // Select a random death threat to be displayed
  selectedDeathThreatSetting = int(random(numberOfDeathThreatsSetting+1));

  // Select a random death threat to display
  switch(selectedDeathThreatSetting) {
  case 0:
    deathThreat = "Nice to eat you";
    break;
  case 1:
    deathThreat = "There is no escape";
    break;
  case 2:
    deathThreat = "Death approaches you";
    break;
  case 3:
    deathThreat = "This game will scar you for life";
    break;
  case 4:
    deathThreat = "Get triggered";
    break;
  case 5:
    deathThreat = "The monsters are not meant to scare you, the graphics are.";
    break;
  case 6:
    deathThreat = "You are about to find out what death feels like";
    break;
  case 7:
    deathThreat = "I am going to kill you";
    break;
  case 8:
    deathThreat = "Die";
    break;
  case 9:
    deathThreat = "gg";
    break;
  case 10:
    deathThreat = "Game over";
    break;
  case 11:
    deathThreat = "Next stop... Hell.";
    break;
  case 12:
    deathThreat = "It is time for you to die";
    break;
  case 13:
    deathThreat = "Just give up";
    break;
  case 14:
    deathThreat = "You ballsed up";
    break;
  case 15:
    deathThreat = "You shall not pass to the next stage";
    break;
  case 16:
    deathThreat = "Your life ends now";
    break;
  case 17:
    deathThreat = "Get recked";
    break;
  case 18:
    deathThreat = "You are out of luck";
    break;
  case 19:
    deathThreat = "No sequel for you";
    break;
  case 20:
    deathThreat = "Today is your funeral";
    break;
  }

  // Select a random background to be displayed
  selectedBackgroundSetting = int(random(numberOfBackgroundsSetting+1));

  // Set the command to false now
  commandToLoadTheLoseScreenAgain = false;
}  /** [-------END-------] **/

/** ------------------------------------------------- **/

/** LOSING SCREEN FUNCTIONS: DRAW THE LOSING SCREEN **//** [-------START-------] **/
void showTheLosingScreen() {
  if (isFlashScreenDoneSetting == false) {
    // Call this function to flash the screen
    callFlashTheScreenConditions();
  } else if (isFlashScreenDoneSetting == true) {
    // Display the losing screen
    callTheLoseScreen();
  }
}

// Reset flash screens to initial conditions
void resetFlashScreens() { 
  // Make sure the class itself is working properly by resetting it
  FlashingScreenClass1.programWidth = CANVAS_WIDTH;
  FlashingScreenClass1.programHeight = CANVAS_HEIGHT;

  // Then reset all of the structures I use to control multiple flashing screens (if needed)

  // Use these two variables to flash different sets of flashing screens
  flashScreenStartTimer = float((millis()/100)); // I set it to run at the program time
  flashScreenIncrementTimerByX = 35.0; // Default increment time is 3.5 seconds

  // Use this var to change between the sets of flashing screens
  countNumberOfScreensFlashed = 0;

  // Set the FlashScreenStartTimer to run as soon as it is called via a conditional
  flashScreenStartTimerDeclaredSetting = false;

  // Check if flash screen has finished running
  isFlashScreenDoneSetting = false;

  // Trigger sound reset
  SFXSmallReset();
}   

void SFXSmallReset() {
  // Allow SFX to be played again
  monsterSoundsPlayedOnceSetting = false;
}

// Run the flash the screen function
void callFlashTheScreenConditions() {
  // Set the FlashScreenStartTimer to be the program time that is is initially called at (so that it runs at any time)
  if (flashScreenStartTimerDeclaredSetting == false) {
    flashScreenStartTimer = float((millis()/100));

    // Prevent FlashScreenStartTimer from changing from the time it is called at
    flashScreenStartTimerDeclaredSetting = true;
  }

  // Check if the program timer is now equal to the FlashScreenStartTimer
  if (float((millis()/100)) == flashScreenStartTimer) {
    // If it is increment the FlashScreenStartTimer by a value
    flashScreenStartTimer = flashScreenStartTimer + flashScreenIncrementTimerByX;

    // If it is increase the count for the number of times this condition has been run
    countNumberOfScreensFlashed = countNumberOfScreensFlashed +1;
  }

  // if the program timer has been equal to FlashScreenStartTimer once 
  if (countNumberOfScreensFlashed == 1) {
    // Flash the first screen
    FlashingScreenClass1.FlashTheScreen();
  } else if (countNumberOfScreensFlashed == 2) {
    // Set the flash screens to be done as I only have 1 flashing screen to display
    isFlashScreenDoneSetting = true;
  }
}

void callTheLoseScreen() {
  // Load the lose screen again if necessary
  if (commandToLoadTheLoseScreenAgain == true) {
    // Run this function to load everything again
    loadTheLoseScreenOnDemand();
  }

  // Play the music again if you switch states
  if (startPlayingBackgroundMusicAgainSetting == true) {
    // Play the music
    println("Starting the sound again");

    // Reset the setting
    playLosingScreenSoundAfterXSecondsTimer = int(millis()/1000) + 1;

    // Set the setting to false
    startPlayingBackgroundMusicAgainSetting = false;
  }

  // Check if this has been called before, if not set the start time to be the current time
  if (loseScreenFirstRunSetting == false) {
    playLosingScreenSoundAfterXSecondsTimer = int(millis()/1000) + 1;
    loseScreenFirstRunSetting = true;
  }

  // Play the background music after it stops playing
  if (playLosingScreenSoundAfterXSecondsTimer == int(millis()/1000)) {
    // Print message to console
    println("Playing the background music");

    // Increment the timer
    playLosingScreenSoundAfterXSecondsTimer = playLosingScreenSoundAfterXSecondsTimer + incrementLosingScreenSoundTimerByX;

    // Play the background music
    backgroundMusicPlayer(LOSING_SCREEN_SOUND_FILENAME, muteSoundsSetting);
  }

  // Set the losing screen background
  setLosingScreenBackground(); 

  // Monster draw settings
  centreObject();

  // Draw the randomly selected monster and play its associated sound effect once
  switch(selectedMonsterSetting) {
  case 0:
    // Display the image
    image(batImage, CANVAS_WIDTH/2, CANVAS_HEIGHT-500, 300+300, 300);

    // Play the sound once, make sure flash screen is done
    if (monsterSoundsPlayedOnceSetting == false && isFlashScreenDoneSetting == true) {
      SFXPlayer(BAT_SOUND_FILENAME, muteSoundsSetting);
      monsterSoundsPlayedOnceSetting = true;
    }
    break;
  case 1:
    // Display the image
    image(catImage, CANVAS_WIDTH/2, CANVAS_HEIGHT-200, 300, 100+300);

    // Play the sound once
    if (monsterSoundsPlayedOnceSetting == false && isFlashScreenDoneSetting == true) {
      SFXPlayer(CAT_SOUND_FILENAME, muteSoundsSetting);
      monsterSoundsPlayedOnceSetting = true;
    }
    break;
  case 2:
    // Display the image
    image(demonImage, CANVAS_WIDTH/2+60, CANVAS_HEIGHT-300-50, 400+300, 400+300);

    // Play the sound once
    if (monsterSoundsPlayedOnceSetting == false && isFlashScreenDoneSetting == true) {
      SFXPlayer(DEMON_SOUND_FILENAME, muteSoundsSetting);
      monsterSoundsPlayedOnceSetting = true;
    }
    break;
  case 3:
    // Display the image
    image(devilImage, CANVAS_WIDTH/2, CANVAS_HEIGHT-300-50, 400+300, 400+300);

    // Play the sound once
    if (monsterSoundsPlayedOnceSetting == false && isFlashScreenDoneSetting == true) {
      SFXPlayer(DEVIL_SOUND_FILENAME, muteSoundsSetting);

      monsterSoundsPlayedOnceSetting = true;
    }
    break;
  case 4:
    // Display the image
    image(ghostImage, CANVAS_WIDTH/2, CANVAS_HEIGHT-300-50, 400+300, 400+300);

    // Play the sound once
    if (monsterSoundsPlayedOnceSetting == false && isFlashScreenDoneSetting == true) {
      SFXPlayer(GHOST_SOUND_FILENAME, muteSoundsSetting);
      monsterSoundsPlayedOnceSetting = true;
    }
    break;
  case 5:
    // Display the image
    image(skeletonImage, CANVAS_WIDTH/2, CANVAS_HEIGHT-350, 150+300, 400+300);

    // Play the sound once
    if (monsterSoundsPlayedOnceSetting == false && isFlashScreenDoneSetting == true) {
      SFXPlayer(SKELETON_SOUND_FILENAME, muteSoundsSetting);
      monsterSoundsPlayedOnceSetting = true;
    }
    break;
  case 6:
    // Display the image
    image(slimeMonsterImage, CANVAS_WIDTH/2, CANVAS_HEIGHT-300-50, 400+300, 400+300);

    // Play the sound once
    if (monsterSoundsPlayedOnceSetting == false && isFlashScreenDoneSetting == true) {
      SFXPlayer(SLIME_MONSTER_SOUND_FILENAME, muteSoundsSetting);
      monsterSoundsPlayedOnceSetting = true;
    }
    break;
  case 7:
    // Display the image
    image(spiderImage, CANVAS_WIDTH/2, CANVAS_HEIGHT-300-50, 300+300, 100+300);

    // Play the sound once
    if (monsterSoundsPlayedOnceSetting == false && isFlashScreenDoneSetting == true) {
      SFXPlayer(SPIDER_SOUND_FILENAME, muteSoundsSetting);
      monsterSoundsPlayedOnceSetting = true;
    }
    break;
  case 8:
    // Display the image
    image(zombieImage, CANVAS_WIDTH/2, CANVAS_HEIGHT-300-50, 400+300, 400+300);

    // Play the sound once
    if (monsterSoundsPlayedOnceSetting == false && isFlashScreenDoneSetting == true) {
      SFXPlayer(ZOMBIE_SOUND_FILENAME, muteSoundsSetting);
      monsterSoundsPlayedOnceSetting = true;
    }
    break;
  case 9:
    // Display the image
    image(gillManImage, CANVAS_WIDTH/2, CANVAS_HEIGHT-300-50, 400, 400+300);

    // Play the sound once
    if (monsterSoundsPlayedOnceSetting == false && isFlashScreenDoneSetting == true) {
      SFXPlayer(GILL_MAN_SOUND_FILENAME, muteSoundsSetting);
      monsterSoundsPlayedOnceSetting = true;
    }
    break;
  case 10:
    // Display the image
    image(pinkMonsterImage, CANVAS_WIDTH/2, CANVAS_HEIGHT-300-50, 400+200, 400+200);

    // Play the sound once
    if (monsterSoundsPlayedOnceSetting == false && isFlashScreenDoneSetting == true) {
      SFXPlayer(PINK_MONSTER_ROAR_FILENAME, muteSoundsSetting);
      monsterSoundsPlayedOnceSetting = true;
    }
    break;
  case 11:
    // Display the image
    image(serialKillerImage, CANVAS_WIDTH/2, CANVAS_HEIGHT-300-50, 400, 400+300);

    // Play the sound once
    if (monsterSoundsPlayedOnceSetting == false && isFlashScreenDoneSetting == true) {
      SFXPlayer(SERIAL_KILLER_SOUND_FILENAME, muteSoundsSetting);
      monsterSoundsPlayedOnceSetting = true;
    }
    break;
  }

  // Display one of the death threats
  // Text settings
  whiteFill();
  fontLoader(HugeHauntedFont);
  centreText();

  // Display the text
  text(deathThreat, CANVAS_WIDTH/2, 0+50);
}

void setLosingScreenBackground() {
  switch(selectedBackgroundSetting) {
  case 0:
    image(losingScreenBackground0Image, CANVAS_WIDTH/2, CANVAS_HEIGHT/2, CANVAS_WIDTH, CANVAS_HEIGHT);
    break;
  case 1:
    image(losingScreenBackground1Image, CANVAS_WIDTH/2, CANVAS_HEIGHT/2, CANVAS_WIDTH, CANVAS_HEIGHT);
    break;
  case 2:
    image(losingScreenBackground2Image, CANVAS_WIDTH/2, CANVAS_HEIGHT/2, CANVAS_WIDTH, CANVAS_HEIGHT);
    break;
  case 3:
    image(losingScreenBackground3Image, CANVAS_WIDTH/2, CANVAS_HEIGHT/2, CANVAS_WIDTH, CANVAS_HEIGHT);
    break;
  case 4:
    image(losingScreenBackground4Image, CANVAS_WIDTH/2, CANVAS_HEIGHT/2, CANVAS_WIDTH, CANVAS_HEIGHT);
    break;
  case 5:
    image(losingScreenBackground5Image, CANVAS_WIDTH/2, CANVAS_HEIGHT/2, CANVAS_WIDTH, CANVAS_HEIGHT);
    break;
  }
} /** [-------END-------] **/

/** ------------------------------------------------- **/

/** VICTORY SCREEN FUNCTIONS: LOAD THE VICTORY SCREEN **//** [-------START-------] **/
void victoryScreenLoad() {
  // Load the images
  // The sun
  sunImage = loadImage(SUN_IMAGE_FILENAME);

  // The bush
  bushImage = loadImage(BUSH_IMAGE_FILENAME);

  // The tree
  treeImage = loadImage(TREE_IMAGE_FILENAME);
} /** [-------END-------] **/

/** ------------------------------------------------- **/

/** VICTORY SCREEN FUNCTIONS: DRAW THE VICTORY SCREEN **//** [-------START-------] **/
void showTheVictoryScreen() {
  // Sound settings
  // Play the music again if you switch between states
  if (startPlayingBackgroundMusicAgainSetting == true) {
    // Play the music
    println("Starting the sound again");

    // Change the setting
    playVictoryScreenSoundAfterXSecondsTimer = int(millis()/1000) + 1;

    // Set the setting to false
    startPlayingBackgroundMusicAgainSetting = false;
  }

  // Check if this has been called before, if not set the start time to be the current time
  if (victorySoundFirstRunSetting == false) {
    playVictoryScreenSoundAfterXSecondsTimer = int(millis()/1000) + 1;
    victorySoundFirstRunSetting = true;
  }

  // Afterward, loop the sound every time the timer has ellapsed
  if (playVictoryScreenSoundAfterXSecondsTimer == int(millis()/1000)) {
    // Print message to console
    println("Playing the background music");

    // Increment the timer
    playVictoryScreenSoundAfterXSecondsTimer = playVictoryScreenSoundAfterXSecondsTimer + incrementVictoryScreenSoundTimerByX;

    // Play the victory screen sfx
    backgroundMusicPlayer(VICTORY_SOUND_FILENAME, muteSoundsSetting);
  }

  drawVictoryScreenBackground();

  // Draw the car
  CarClass1.DrawTheCar();

  // Start drawing the cookie monster if the car is towards the end
  if (CarClass1.carBodyXPos >= CANVAS_WIDTH - 500) {
    displayFinalMonsterSetting = true;
  }

  // Draw the tree above everything else
  image(treeImage, 50, CANVAS_HEIGHT-350, 300, 300);

  // Set the victory screen as loaded
  if (victoryScreenLoadedBeforeSetting == false) {
    victoryScreenLoadedBeforeSetting = true; 
    victoryScreenLockStatus = "Unlocked";

    // Redraw
    loadGameMenuBar();
    redraw();
  }
}

// Function to draw the background to the car
void drawVictoryScreenBackground() {
  // Draw the blue sky background (Dark settings = false)
  setBackground(false);

  // Shape settings
  cornerObject();

  // Draw the grass
  greenFill();
  rect(0, CANVAS_HEIGHT/2, CANVAS_WIDTH, CANVAS_HEIGHT/2);

  // Draw the grey steet
  greyFill();
  rect(0, CANVAS_HEIGHT/2+10, CANVAS_WIDTH, CANVAS_HEIGHT/2 - 250);

  // Draw the white lines for the grey steet
  whiteStroke();
  largeStrokeWeight();

  // Line variables
  int YPosition = CANVAS_HEIGHT-320;
  int XPosition = 50;
  int NumberOfLines = int(CANVAS_WIDTH/200);

  for (int i = 0; i < NumberOfLines; i ++) {
    // Draw the line
    line(XPosition, YPosition, XPosition+100, YPosition);

    // Change the position of the next line
    XPosition = XPosition + 200;
  }

  // Shape settings
  centreObject();

  // Generate clouds
  SimpleCloudsClass7.DrawClouds();

  // Combine two clouds to form one cloud
  SimpleCloudsClass8.DrawClouds();
  SimpleCloudsClass9.DrawClouds();

  SimpleCloudsClass10.DrawClouds();
  SimpleCloudsClass11.DrawClouds();

  // Draw the sun
  centreObject();
  image(sunImage, 10, 0, 250, 250);

  // Draw the bushes
  image(bushImage, 770, CANVAS_HEIGHT - 103, 50, 50);
  image(bushImage, 492, CANVAS_HEIGHT - 236, 50, 50);
  image(bushImage, 204, CANVAS_HEIGHT - 172, 50, 50);
  image(bushImage, 259, CANVAS_HEIGHT - 179, 50, 50);
  image(bushImage, 277, CANVAS_HEIGHT - 147, 50, 50);
  image(bushImage, 447, CANVAS_HEIGHT - 154, 50, 50);
  image(bushImage, 175, CANVAS_HEIGHT - 243, 50, 50);
  image(bushImage, 647, CANVAS_HEIGHT - 110, 50, 50);
  image(bushImage, 672, CANVAS_HEIGHT - 176, 50, 50);
  image(bushImage, 478, CANVAS_HEIGHT - 138, 50, 50);
  image(bushImage, 145, CANVAS_HEIGHT - 209, 50, 50);
  image(bushImage, 50, CANVAS_HEIGHT - 100, 50, 50);
  image(bushImage, 80, CANVAS_HEIGHT - 180, 50, 50); 
  image(bushImage, 800, CANVAS_HEIGHT - 100, 50, 50);
  image(bushImage, 900, CANVAS_HEIGHT - 180, 50, 50); 

  // Draw the cookie monster
  if (displayFinalMonsterSetting == true) {

    // Set the car to a fixed position
    CarClass1.carBodyXPos = CANVAS_WIDTH/2;
    CarClass1.wheelTurnSpeed = 0;
    CarClass1.angle = 0;

    // Text settings
    whiteFill();
    centreText();
    fontLoader(LargeHauntedFont);

    // Display the text
    text("You escape the Haunted House but can never escape the monsters", CANVAS_WIDTH/2, 250);

    // Text settings
    redFill(200);
    fontLoader(HugeHauntedFont);

    text("The end", CANVAS_WIDTH/2, 220);

    // The cookie monster image
    cornerObject();

    image(pinkMonsterImage, CANVAS_WIDTH/2 + 240, CANVAS_HEIGHT - 500, 250, 250);

    // Play the cookie monster sound once
    if (monsterSoundRunSetting == false) {
      SFXPlayer(PINK_MONSTER_LAUGH_FILENAME, muteSoundsSetting);
      monsterSoundRunSetting = true;
    }
  }
} /** [-------END-------] **/

/** ------------------------------------------------- **/