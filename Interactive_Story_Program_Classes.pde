/** ------------------------------------------------- ***/
/** THE CLASSES SECTION OF THE PROGRAM ***/
// End-users of the program: Do not touch any of the following classes! 
// If you want to change any of the parameters do so at Interactive_Story_Program
// If you want to see the references (where applicable) for the following classes view Interactive_Story_Notes_Modules
/** ------------------------------------------------- ***/

/** MUTUAL SCREEN CLASS: THE MENU LISTENER CLASS ***//** [-------START-------] ***/
class MenuListener implements ActionListener { 

  MenuListener() {
  }

  public void actionPerformed(ActionEvent e) {
    // Retrieve the menu items
    MenuItem source = (MenuItem)(e.getSource());

    // See which menu item is clicked
    if (source.getLabel().equals("Safely Exit")) {
      // Print the action to the console
      println("Action - Safely Exit The Program"); 

      // Code called on exit
      println("Safely exiting the program");

      // Exit
      exit();
    } else if (source.getLabel().equals("License")) {
      // Print the action to the console
      println("Action - Open the license file");

      // Launch the file
      launch(dataPath(LICENSE_FILENAME));
    } else if (source.getLabel().equals("Documentation")) {
      // Print the action to the console
      println("Action - Open the documentation file");

      // Launch the file
      launch(dataPath(DOCUMENTATION_FILENAME));
    } else if (source.getLabel().equals("Starting Screen")) {
      // Print the action to the console
      println("Action - Go to the Starting Screen");

      // Stop all SFX
      clearSFX();

      // Set the new state
      currentStateSetting = STARTING_SCREEN_STATE;

      // Reset the rain
      hasStartingRainTimeBeenSetSetting = false;

      // Clear the canvas setting change
      clearTheCanvasSetting = true;
    } else if (source.getLabel().equals("Playing Screen")) {

      // Print the action to the console
      println("Action - Go to the Playing Screen");

      // Stop all SFX
      clearSFX();

      // Set the new state
      currentStateSetting = PLAYING_SCREEN_STATE;

      // Clear the canvas setting change
      clearTheCanvasSetting = true;
    } else if (source.getLabel().equals("Losing Screen")) {

      // Print the action to the console
      println("Action - Go to the Losing Screen");

      // Stop all SFX
      clearSFX();

      // Set the new state
      currentStateSetting = LOSING_SCREEN_STATE;

      // Clear the canvas setting change
      clearTheCanvasSetting = true;
    } else if (source.getLabel().equals("Victory Screen"+ " *" + victoryScreenLockStatus)) {

      // Check if it has been unlocked
      if (victoryScreenLoadedBeforeSetting == true) {
        // Print the action to the console
        println("Action - Go to the Victory Screen");

        // Stop all SFX
        clearSFX();

        // Set the new state
        currentStateSetting = VICTORY_SCREEN_STATE;

        // Clear the canvas setting change
        clearTheCanvasSetting = true;
      } else if (victoryScreenLoadedBeforeSetting == false) {
        // Print to the console
        println("You have not unlocked the Victory Screen yet");
      }
    } else if (source.getLabel().equals("Mute / Unmute Sounds Setting")) {

      // Check the current setting
      // Check if sound is muted
      if (muteSoundsSetting == true) {

        // Print the action to the console
        println("Action - Unmute Sounds");

        // Change the setting
        muteSoundsSetting = false;
      }
      // Check if sound is not muted
      else if (muteSoundsSetting == false) {

        // Print the action to the console
        println("Action - Mute Sounds");

        // Change the setting
        muteSoundsSetting = true;

        // Stop whatever is currently playing
        SFXPlayer(SILENT_SOUND_FILENAME, muteSoundsSetting);
      }
    } else if (source.getLabel().equals("Increase Jump Scare Probability")) {

      // Print the action to the console
      println("Action - Increase Jump Scare Probability");

      // Change the setting
      if (likelihoodOfScareSetting != 0) {
        likelihoodOfScareSetting = likelihoodOfScareSetting - 10;
      } else {
        // Print message to console
        println("You cannot increase the likelihood beyond certainty");
      }

      // Print message to console
      println("The current probability is 1 out of: "+likelihoodOfScareSetting);
    } else if (source.getLabel().equals("Reset Jump Scare Probability")) {

      // Print the action to the console
      println("Action - Reset Jump Scare Probability");

      // Change the setting
      if (likelihoodOfScareSetting != defaultLikelihoodOfScare) {
        likelihoodOfScareSetting = defaultLikelihoodOfScare;
      } else {
        // Print message to console
        println("The probability is already at the default state");
      }
    } else if (source.getLabel().equals("Unlock Victory Screen Cheat Setting")) {

      // Print the action to the console
      println("Action - Cheat");

      // Change the setting
      if (victoryScreenLoadedBeforeSetting == false) {
        victoryScreenLoadedBeforeSetting = true; 
        victoryScreenLockStatus = "Unlocked";

        // Redraw
        loadGameMenuBar();
        redraw();
      }
    } else if (source.getLabel().equals("Draw Nothing Setting")) {

      // Make sure you are on the starting screen
      if (currentStateSetting == STARTING_SCREEN_STATE) {

        // Print the action to the console
        println("Action - Switch to Nothing");

        // Stop all SFX
        clearSFX();

        // Make the setting change
        selectedStartingScreenAnimationSetting = 0;
        manuallySelectStartingScreenAnimationSetting = true;

        // Clear canvas
        partialClearTheCanvasSetting = true;
      } else {
        println("You must be on the starting screen!");
      }
    } else if (source.getLabel().equals("Draw Rain Setting")) {

      // Make sure you are on the starting screen
      if (currentStateSetting == STARTING_SCREEN_STATE) {

        // Print the action to the console
        println("Action - Switch to Rain");

        // Make the setting change
        selectedStartingScreenAnimationSetting = 1;
        manuallySelectStartingScreenAnimationSetting = true;

        // Reset the starting time for the rain so that it displays (must apply for each rain set)
        RainClass1.startingRainTime = int(millis()/1000);
        RainClass1.nextRainTime = int(millis()/1000) + incrementRainSoundTimerByX;
        RainClass2.startingRainTime = int(millis()/1000);
        RainClass2.nextRainTime = int(millis()/1000) + incrementRainSoundTimerByX;
        RainClass3.startingRainTime = int(millis()/1000);
        RainClass3.nextRainTime = int(millis()/1000) + incrementRainSoundTimerByX;

        // Start the rain sound
        playRainSFXAgainAfterXSecondsTimer = int(millis()/1000);

        // Clear canvas
        partialClearTheCanvasSetting = true;
      } else {
        println("You must be on the starting screen!");
      }
    } else if (source.getLabel().equals("Draw Lightning Setting")) {

      // Make sure you are on the starting screen
      if (currentStateSetting == STARTING_SCREEN_STATE) {

        // Print the action to the console
        println("Action - Switch to Lightning");

        // Stop all SFX
        clearSFX();

        // Make the setting change
        selectedStartingScreenAnimationSetting = 2;
        manuallySelectStartingScreenAnimationSetting = true;

        // Reset the lightning starting time so that it displays (must apply for each lightning set)
        LightningClass1.drawLightningAfterXSecondsCurrentValue = int(millis()/1000);
        LightningClass1.stopLightningAfterXSecondsCurrentValue = LightningClass1.drawLightningAfterXSecondsCurrentValue + 2;

        // Clear canvas
        partialClearTheCanvasSetting = true;
      } else {
        println("You must be on the starting screen!");
      }
    } else if (source.getLabel().equals("Draw Names Setting")) {

      // Make sure you are on the starting screen
      if (currentStateSetting == STARTING_SCREEN_STATE) {

        // Print the action to the console
        println("Action - Switch to Names");

        // Stop all SFX
        clearSFX();

        // Make the setting change
        selectedStartingScreenAnimationSetting = 3;
        manuallySelectStartingScreenAnimationSetting = true;

        // Reset the name maker starting time so that it displays (must apply for each name maker)
        NameMakerClass1.startTheNameTimer = int(millis()/1000);

        // Clear canvas
        partialClearTheCanvasSetting = true;
      } else {
        println("You must be on the starting screen!");
      }
    } else if (source.getLabel().equals("Draw Trippy Sky Setting")) {

      // Make sure you are on the starting screen
      if (currentStateSetting == STARTING_SCREEN_STATE) {

        // Print the action to the console
        println("Action - Switch to Trippy Sky");

        // Stop all SFX
        clearSFX();

        // Make the setting change
        selectedStartingScreenAnimationSetting = 4;
        manuallySelectStartingScreenAnimationSetting = true;

        // Clear canvas
        partialClearTheCanvasSetting = true;
      } else {
        println("You must be on the starting screen!");
      }
    } else if (source.getLabel().equals("View Game Text File")) {

      // Make sure you are on the playing screen
      if (currentStateSetting == PLAYING_SCREEN_STATE) {

        // Print the action to the console
        println("Action - Display Game Text");

        // Set the setting to display the table instead of the normal text
        textState = 0;

        // Clear canvas
        partialClearTheCanvasSetting = true;
      } else {
        println("You must be on the playing screen!");
      }
    } else if (source.getLabel().equals("Skip / Play Death Animation")) {

      // Make sure you are on the playing screen
      if (currentStateSetting == PLAYING_SCREEN_STATE) {
        // Check the current setting
        if (skipDeath == false) {
          // Print the action to the console
          println("Action - Skip Death Screen Animations");

          // Change the setting
          skipDeath = true;
        } else if (skipDeath == true) {
          // Print the action to the console
          println("Action - Play Death Screen Animations");

          // Change the setting
          skipDeath = false;
        }
      } else {
        println("You must be on the playing screen!");
      }
    } else if (source.getLabel().equals("Draw screen again")) {

      // Make sure you are on the losing screen
      if (currentStateSetting == LOSING_SCREEN_STATE) {

        // Print the action to the console
        println("Action - Draw Losing Screen Again");

        // Stop all SFX
        clearSFX();

        // Make the flash screen appear again
        resetFlashScreens();

        // Make the lose screen also load again
        commandToLoadTheLoseScreenAgain = true;

        // Clear canvas
        partialClearTheCanvasSetting = true;
      } else {
        println("You must be on the losing screen!");
      }
    }
  }
} /** [-------END-------] ***/

/** -------------------------------------------------- ***/

/** MUTUAL SCREEN CLASS: THE TRAPEZIUM CREATOR CLASS ***//** [-------START-------] ***//**
 class Trapeziums {
 
 // Declare the data structures
 int trapeziumXPos;
 int trapeziumYPos;
 int trapeziumTopLeftXPointPos;
 int trapeziumHeight;
 int trapeziumWidth;
 int trapzeiumScaleAmount;
 
 
 Trapeziums(int inputTrapeziumXPos, int inputTrapeziumYPos, int inputTrapeziumTopLeftXPointPos, int inputTrapeziumHeight, int inputTrapeziumWidth, int inputTrapzeiumScaleAmount) {
 // Parse through the input
 trapeziumXPos = inputTrapeziumXPos;
 trapeziumYPos = inputTrapeziumYPos;
 trapeziumTopLeftXPointPos = inputTrapeziumTopLeftXPointPos;
 trapeziumHeight = inputTrapeziumHeight;
 trapeziumWidth = inputTrapeziumWidth;
 trapzeiumScaleAmount = inputTrapzeiumScaleAmount;
 }
 
 void DrawTrapezium() {
 pushMatrix();
 
 translate(trapeziumXPos, trapeziumYPos);
 scale(trapzeiumScaleAmount);
 
 beginShape();
 // Bottom left
 vertex(0, trapeziumHeight);
 
 // Top left
 vertex(trapeziumXPos, 0);
 
 // Top right
 vertex(trapeziumWidth - trapeziumXPos, 0);
 
 // Bottom right
 vertex(trapeziumWidth, trapeziumHeight);
 endShape(CLOSE);
 
 popMatrix();
 }
 }***//** [-------END-------] ***/

/** ------------------------------------------------- ***/

/** MUTUAL SCREENS CLASS: THE SIMPLE CLOUDS CLASS ***//** [-------START-------] ***/
class SimpleClouds {
  // Declare data structures
  // User input
  /// Cloud part positions
  int cloudXPos;
  int cloudYPos;

  // Cloud part colour
  color cloudColour;

  // Program input
  // Cloud body size
  final int CLOUD_BODY_WIDTH = 200;
  final int CLOUD_BODY_HEIGHT = 100;

  // Bloud part size
  final int CLOUD_PART_SIZE = 50;

  // I restricted the size inputs because if I do not restrict the size inputs: 
  // - The cloud points are no longer in the right position 
  // - The clouds points cannot be aligned correctly automatically (using a for loop or by scaling the point positions)
  // - Not having the cloud points in the right spot is ugly

  SimpleClouds(int inputCloudXPos, int inputCloudYPos, color inputCloudColour) {
    cloudXPos = inputCloudXPos; 
    cloudYPos = inputCloudYPos;
    cloudColour = inputCloudColour;
  }

  void DrawClouds() {
    // Cloud draw settings
    centreObject();

    // Shape settings
    noStroke();

    // Cloud Colour
    fill(cloudColour);

    // Cloud body
    ellipse(cloudXPos, cloudYPos, CLOUD_BODY_WIDTH, CLOUD_BODY_HEIGHT);

    // Cloud body points
    // Point 1 - Far left
    ellipse(cloudXPos-100, cloudYPos, CLOUD_PART_SIZE, CLOUD_PART_SIZE);

    // Point 2
    ellipse(cloudXPos-75, cloudYPos+40, CLOUD_PART_SIZE, CLOUD_PART_SIZE); // Positive
    ellipse(cloudXPos-75, cloudYPos-40, CLOUD_PART_SIZE, CLOUD_PART_SIZE); // Negative

    // Point 3
    ellipse(cloudXPos-30, cloudYPos+50, CLOUD_PART_SIZE, CLOUD_PART_SIZE); // Positive
    ellipse(cloudXPos-30, cloudYPos-50, CLOUD_PART_SIZE, CLOUD_PART_SIZE); // Negative

    // Point 4
    ellipse(cloudXPos+20, cloudYPos+50, CLOUD_PART_SIZE, CLOUD_PART_SIZE); // Positive
    ellipse(cloudXPos+20, cloudYPos-50, CLOUD_PART_SIZE, CLOUD_PART_SIZE); // Negative

    // Point 5
    ellipse(cloudXPos+70, cloudYPos+40, CLOUD_PART_SIZE, CLOUD_PART_SIZE); // Positive
    ellipse(cloudXPos+70, cloudYPos-40, CLOUD_PART_SIZE, CLOUD_PART_SIZE); // Negative

    // Point 6 - Far right
    ellipse(cloudXPos+100, cloudYPos, CLOUD_PART_SIZE, CLOUD_PART_SIZE);
  }
} /** [-------END-------] ***/

/** ------------------------------------------------- ***/

/** STARTING SCREEN CLASS: THE HAUNTED HOUSE ***//** [-------START-------] ***/
class HauntedHouse {
  // Declare the data structures
  // User controlled data structures
  // The position of the house
  int houseXPos = 0;
  int houseYPos = 0;

  // The scale amount of the house
  float houseScaleSize = 0;

  // Class controlled data structures
  // Door only setting
  boolean displayDoorOnlySetting = false;

  // Red or yellow windows settings
  boolean windowsMakeRedSetting = false;

  // The Haunted House brown parts
  final color LIGHTER_BROWN_COLOUR = color(82, 50, 17);
  final color DARKER_BROWN_COLOUR = color(52, 30, 7);

  // The Haunted House grey parts
  final color LIGHT_GREY_COLOUR = color(114, 98, 144);
  final color LIGHTER_GREY_COLOUR = color(80);
  final color DARK_GREY_COLOUR = color(62, 51, 82);
  final color DARKER_GREY_COLOUR = color(30, 25, 41);

  // The Haunted House yellow parts
  final color YELLOW_COLOUR = color(238, 255, 170);

  // The Haunted House red parts
  final color RED_COLOUR = color(255, 0, 0);

  // The Haunted House blue parts
  final color BLUE_COLOUR = color(94, 118, 232);

  // The Haunted House black parts
  final color BLACK_COLOUR = color(0);

  HauntedHouse(int inputHouseXPos, int inputHouseYPos, float inputHouseScaleSize) {
    // Pass the values through
    houseXPos = inputHouseXPos;
    houseYPos = inputHouseYPos;
    houseScaleSize = inputHouseScaleSize;
  }

  void DrawTheHauntedHouse() {

    // Draw settings
    centreObject();

    // Main stroke settings
    stroke(BLACK_COLOUR);
    strokeWeight(2);

    // Keep the changes within this function
    pushMatrix();

    // Translate all of the elements - translate first!
    translate(houseXPos, houseYPos);

    // Scale all of the elements - scale second!
    scale(houseScaleSize);

    // Draw the house
    if (displayDoorOnlySetting == false) {

      // Haunted House: Brown Structural Elements
      // Fill colour
      fill(LIGHTER_BROWN_COLOUR);

      // The brown part to the left and right of the staircase
      quad(175, 200, 625, 200, 675, 450, 125, 450);

      // Fill colour
      fill(DARKER_BROWN_COLOUR);

      // The brown part next to the staircase
      quad(50, 525, 750, 525, 700, 450, 100, 450);

      // The centre brown part
      quad(300, 250, 500, 250, 550, 450, 250, 450);

      // The upper brown parts
      // Top left part
      quad(325, 250, 475, 250, 475, 75, 325, 75);

      // The middle part
      quad(200, 150, 285, 150, 300, 250, 175, 250);

      // The top right small brown part
      quad(565, 250, 600, 250, 600, 85, 565, 85);

      // The top right larger brown part (behind element)
      quad(520, 150, 605, 150, 625, 250, 500, 250);

      // Haunted House: Yellow Window Elements
      // The fill colour for the windows setting
      if (windowsMakeRedSetting == false) {
        fill(YELLOW_COLOUR);
      } else if (windowsMakeRedSetting == true) {
        fill(RED_COLOUR);
      }

      // The upmost top right small window
      beginShape();
      vertex(582.5, 105);
      vertex(570.4, 120.5);
      vertex(560, 172.5);
      vertex(605.5, 172.5);
      vertex(594.5, 120.5);
      endShape(CLOSE);

      // The top left window
      beginShape();
      vertex(242.5, 155);
      vertex(222.4, 172.5);
      vertex(212, 222.5);
      vertex(267.5, 222.5);
      vertex(262.5, 172.5);
      endShape(CLOSE);

      // The right window from the centre
      beginShape();
      vertex(562.5, 265);
      vertex(532.4, 287.5);
      vertex(554, 402.5);
      vertex(646.5, 402.5);
      vertex(602.5, 287.5);
      endShape(CLOSE);

      // The left window from the centre
      beginShape();
      vertex(235.5, 265);
      vertex(195.4, 287.5);
      vertex(154, 402.5);
      vertex(247.5, 402.5);
      vertex(266.5, 287.5);
      endShape(CLOSE);

      // The top window from the centre
      beginShape();
      vertex(400, 110);
      vertex(359, 132.5);
      vertex(352, 202.5);
      vertex(447.5, 202.5);
      vertex(442.5, 132.5);
      endShape(CLOSE);

      /** Start - Leave these structural elements out of order ***/

      // Haunted House: Brown Structural Elements
      // Fill colour
      fill(DARKER_BROWN_COLOUR);

      // The top right larger brown bit
      quad(520, 150, 605, 150, 625, 250, 500, 250);

      // Haunted House: Yellow Window Elements
      // The fill colour for the windows setting
      if (windowsMakeRedSetting == false) {
        fill(YELLOW_COLOUR);
      } else if (windowsMakeRedSetting == true) {
        fill(RED_COLOUR);
      }

      // The top right larger window
      beginShape();
      vertex(562.5, 155);
      vertex(542.4, 172.5);
      vertex(534, 222.5);
      vertex(591.5, 222.5);
      vertex(582.5, 172.5);
      endShape(CLOSE);

      /** End - Leave these structural elements out of order ***/

      // Haunted House: Lavendar Roof Parts
      // The furthest roof part
      // Darker parts fill colour
      fill(DARK_GREY_COLOUR);

      // The darker parts of the roof
      quad(125, 200, 675, 200, 700, 250, 100, 250);
      quad(185, 150, 300, 150, 275, 100, 215, 100);

      // Lighter parts fill colour
      fill(LIGHT_GREY_COLOUR);

      // The lighter parts of the roof
      triangle(75, 250, 325, 250, 225, 200);
      triangle(475, 250, 725, 250, 575, 200);
      triangle(275, 250, 525, 250, 400, 150);
      triangle(180, 150, 305, 150, 242.5, 110);
      triangle(500, 150, 625, 150, 560.5, 110);
      triangle(555, 100, 610, 100, 583, 35);
      quad(350, 25, 450, 25, 500, 100, 300, 100);

      // The staircase
      fill(LIGHT_GREY_COLOUR);
      quad(245, 460, 555, 460, 580, 480, 219, 480);
      quad(620, 530, 180, 530, 204, 510, 596, 510);

      fill(DARKER_GREY_COLOUR);
      quad(245, 450, 555, 450, 565, 470, 235, 470);
      quad(580, 480, 220, 480, 204, 510, 596, 510);
      quad(620, 530, 180, 530, 160, 565, 640, 565);

      // The door
      DrawTheHauntedHouseDoor();
    }
    // Draw just the door
    else {
      DrawTheHauntedHouseDoor();
    }

    // Restore normal coordinate system
    popMatrix();
  }

  void DrawTheHauntedHouseDoor() {
    // The door
    fill(BLUE_COLOUR);
    quad(332, 294, 467, 294, 500, 450, 300, 450);
    arc(400, 295, 135, 65, PI, TWO_PI);
    strokeWeight(3);

    // Door downwards lines
    line(360, 270, 340, 450);
    line(385, 264, 380, 450);
    line(410, 264, 420, 450);
    line(435, 268, 460, 450);

    // Door horizontal bars
    fill(LIGHTER_GREY_COLOUR);
    quad(332, 294, 467, 294, 470, 305, 330, 305);
    quad(318, 364, 482, 364, 485, 378, 315, 378);

    // Door ring little circle
    fill(BLACK_COLOUR);
    ellipse(444, 330, 12, 12);

    // Door ring outer circle
    noFill();
    strokeWeight(3);
    ellipse(445, 339, 20, 20);

    // Door ring little circle
    fill(BLACK_COLOUR);
    ellipse(446, 350, 5, 5);
  }
} /** [-------END-------] ***/

/** ------------------------------------------------- ***/

/** STARTING SCREEN CLASS: THE MOVING NAME MAKER CLASS ***/
class NameMaker { /** [-------START-------] ***/
  // User controlled input
  // Timer for when the names should be displayed
  int startTheNameTimer;
  int incrementTheNameTimerByX;

  // Canvas bounds
  int canvasWidth;

  // Program controlled input
  // Placeholder for the random thing's name
  String displayRandomThingName; 

  // Where should the text be displayed settings
  int randomWidth;
  int randomHeight;

  // Controller for if names names will be drawn
  boolean isNameDrawn;

  // Generate a random value
  int numberBetween0And11;

  // Display the text at a particular side
  int leftOrRightSide;

  NameMaker(int inputStartTheNameTimer, int inputIncrementTheNameTimerByX, int inputCanvasWidth) {

    // Parse the user values
    startTheNameTimer = inputStartTheNameTimer;
    incrementTheNameTimerByX = inputIncrementTheNameTimerByX;
    canvasWidth = inputCanvasWidth;

    // Set program defined values
    isNameDrawn = false;
    displayRandomThingName = "";
    randomWidth = 0;
    randomHeight = 0;
    numberBetween0And11 = 0;
    leftOrRightSide = 0;
  }

  // Function caller
  void CallTheFunctions() {    
    // Check if the time is equal to the time to start the name timer
    if (int(millis()/1000) == startTheNameTimer) {
      // Increment the name timer
      startTheNameTimer = startTheNameTimer + incrementTheNameTimerByX;

      // Set the name to having not been drawn
      isNameDrawn = false;

      // Clear previous names
      setBackground(true);
    }

    if (isNameDrawn == false) {
      // Randomly generate a name
      RandomlyGenerateAName();

      // Display the randomly generated name
      DisplayRandomlyGeneratedName();  

      // Set the name to having been drawn
      isNameDrawn = true;
    }
  }

  // Generate a random name
  void RandomlyGenerateAName() {
    // Choose what name to display
    numberBetween0And11 = int(random(12)); // Generate a random number between 0 and 11

    // Use the random number to pick a particular name to display
    switch(numberBetween0And11) {
    case 0:
      displayRandomThingName = "Werewolves";
      break;
    case 1:
      displayRandomThingName = "Vampires";
      break;
    case 2:
      displayRandomThingName = "Witches";
      break;
    case 3:
      displayRandomThingName = "Zombies";
      break;
    case 4:
      displayRandomThingName = "Mummys";
      break;
    case 5:
      displayRandomThingName = "Goblins";
      break;
    case 6:
      displayRandomThingName = "Skeletons";
      break;
    case 7:
      displayRandomThingName = "Demons";
      break;
    case 8:
      displayRandomThingName = "Aunt Agatha";
      break;
    case 9:
      displayRandomThingName = "Satan";
      break;
    case 10:
      displayRandomThingName = "Frankenstein";
      break;
    case 11:
      displayRandomThingName = "Hell";
      break;
    }
  }

  // Display the name generated
  void DisplayRandomlyGeneratedName() {
    // Display the text at a particular side
    leftOrRightSide = int(random(2)); // Generate a random number between 0 and 1

    // Local variable placeholders
    int xPosXValue = 0;
    int yPosYValue = 0;

    // Left side
    if (leftOrRightSide == 0) {
      xPosXValue = generateWidthValue(100, 250);
      xPosXValue = generateHeightValue(225, 620);
    }
    // Right side
    else if (leftOrRightSide == 1) {
      xPosXValue = generateWidthValue(750, canvasWidth-100);
      yPosYValue = generateHeightValue(225, 620);
    }

    // Display the text
    // Print to console
    println("Display a name");

    // Text settings
    redFill(200);
    centreText();
    textSize(14);

    // Display the random name
    text(displayRandomThingName, xPosXValue, yPosYValue);
  }

  // Use external functions to calculate the width / height of the text so that the text does not jump all over the place (as an external position is used and saved)
  int generateWidthValue(int inputStartingValue, int inputEndingValue) {
    // Generate a random width value between the specified range
    int randomWidthValue = int(random(inputStartingValue, inputEndingValue));
    return randomWidthValue;
  }

  int generateHeightValue(int inputStartingValue, int inputEndingValue) {
    // Generate a random height value between the specified range
    int randomHeightValue = int(random(inputStartingValue, inputEndingValue));
    return randomHeightValue;
  }
} /** [-------END-------] ***/

/** ------------------------------------------------- ***/

/** STARTING SCREEN: THE TRIPPY SKY CLASS ***/
class TrippySky { /** [-------START-------] ***/
  // User controlled input
  // The position of the rings
  int ringXPos;
  int ringYPos;

  // The number of rings
  int numberOfRings;

  // Class controlled vars
  // Generate a random shade
  int selectRandomShade;

  // Store the colour value
  int generateDarkColour;

  // Pass the colour value into a colour
  color convertDarkColour;

  TrippySky(int inputRingXPos, int inputRingYPos, int inputNumberOfRings) {
    // User controlled input
    // The position of the rings
    ringXPos = inputRingXPos;
    ringYPos = inputRingYPos;

    // The number of rings
    numberOfRings = inputNumberOfRings;

    // Program controlled input blank settings
    selectRandomShade = 0;
    generateDarkColour = 0;
    convertDarkColour = color(0, 0, 0);
  }

  // The trippy sky settings
  void SpookyFlashingSky() {

    // Draw the rings
    for (int i=numberOfRings; i > 0; i -= 1) {
      selectRandomShade = int(random(3)); // Generate a number between 0 and 2
      generateDarkColour = 0; // Use this var to store colour values 

      // Store a particular colour value depending on the random number generated
      if (selectRandomShade == 0) {
        generateDarkColour = 0;
      } else if (selectRandomShade == 1) {
        generateDarkColour = 25;
      } else if (selectRandomShade == 2) {
        generateDarkColour = 50;
      }

      // Make a colour out of the colour values
      convertDarkColour = color(generateDarkColour, generateDarkColour, generateDarkColour);

      // Make the ellipse the colour generated
      fill(convertDarkColour);
      stroke(convertDarkColour);

      // Draw the ellipse
      ellipse(ringXPos, ringYPos, i*80, i*80);
    }
  }
} /** [-------END-------] ***/

/** ------------------------------------------------- ***/

/** STARTING SCREEN: THE ANIMATED RAIN CLASS ***/
class Rain { /** [-------START-------] ***/
  // Declare the data structures
  // User controlled input
  // Set rain creation settings
  float startingRainTime;
  float nextRainTime; 

  // Set number of rain drops
  int numberOfRainDrops;

  // Send these input values into the rain drop class
  int rainDropYLocation;
  int rainDropXMinValue;
  int rainDropXMaxValue;
  int minFallingSpeed;
  int maxFallingSpeed;

  // Program controlled input
  /// Create the rain array using the RainDrop class and a variable
  RainDrop[] theRain;

  // Prevent constant loop of rain drops
  boolean rainCreated;

  Rain(int inputStartingRainTime, int inputNextRainTime, int inputNumberOfRainDrops, 
    int inputRainDropYLocation, int inputRainDropXMinValue, int inputRainDropXMaxValue, int inputMinFallingSpeed, int inputMaxFallingSpeed) {

    // User controlled input for the rain
    startingRainTime = inputStartingRainTime;
    nextRainTime = inputNextRainTime; 
    numberOfRainDrops = inputNumberOfRainDrops;

    // User controlled input for the rain drops
    rainDropYLocation = inputRainDropYLocation;
    rainDropXMinValue = inputRainDropXMinValue;
    rainDropXMaxValue = inputRainDropXMaxValue;
    minFallingSpeed = inputMinFallingSpeed;
    maxFallingSpeed = inputMaxFallingSpeed;

    // Program controlled input
    rainCreated = false;
    theRain = new RainDrop[numberOfRainDrops];
  }

  void DrawRain() {
    // Create the rain every time the time is equal to TimeToWaitPerRainSession
    if (int(millis()/1000) == startingRainTime) {
      // Print message
      println("Creating Rain");

      // Increase TimerToWait by itself
      startingRainTime = startingRainTime + nextRainTime;

      // Allow raindrops to be created
      rainCreated = false;
    }

    // Run these conditions only if the rain has not been created
    if (rainCreated == false) {

      // Populate the rain array
      for (int i = 0; i < theRain.length; i++) {
        // Refer to class to make new raindrops
        theRain[i] = new RainDrop(rainDropYLocation, rainDropXMinValue, rainDropXMaxValue, minFallingSpeed, maxFallingSpeed);
      }

      // Set the rain to having been created
      rainCreated = true;
    }
    // Draw raindrops only if they have been made
    else if (rainCreated == true) {
      // Draw raindrops and make them fall
      for (int i = 0; i < theRain.length; i++) {
        // Display the shape of the rain drop
        theRain[i].RainDropDisplay();

        // Make the raindrop go down
        theRain[i].RainDropFall();
      }
    }
  }

  /** THE RAIN DROP SUB CLASS ***/
  class RainDrop { /** [-------START-------] ***/
    // User controlled data structures
    // Position of the raindrops
    int locationX;
    int locationY;

    // Speed of the raindrops
    int fallingSpeed;

    RainDrop(int inputLocationX, int inputRainDropXMinValue, int inputRainDropXMaxValue, int inputMinFallingSpeed, int inputMaxFallingSpeed) {

      // Make sure the rain drops are drawn at the location where the clouds are
      locationY = inputLocationX;
      locationX = int(random(inputRainDropXMinValue, inputRainDropXMaxValue)); 

      // Set the falling speed to this defined value
      fallingSpeed = int(random(inputMinFallingSpeed, inputMaxFallingSpeed));
    }

    // Make the raindrops look like raindrops
    void RainDropDisplay() {
      // Shape settings
      noStroke();
      paleBlueFill();

      // Bottom shape
      ellipse(locationX, locationY, 10, 10);

      // Top shape
      triangle(locationX-5, locationY, 
        locationX, locationY-10, 
        locationX + 5, locationY);
    }

    // Make the raindrops go down
    void RainDropFall() {
      // Make the location decrement by the speed
      locationY +=fallingSpeed;
    }
  } /** [-------END-------] ***/
} /** [-------END-------] ***/

/** ------------------------------------------------- ***/

/** STARTING SCREEN: THE ANIMATED LIGHTNING CLASS ***/
class Lightning { /** [-------START-------] ***/
  // Declare the data structures
  // User controlled input
  // Line points
  // First point
  float lightningLinePoint1XPos;
  float lightningLinePoint1YPos;

  // Line ending point
  int initialEndingYPos; // The value is ~ the height of the canvas
  int endingYPos; // The default value is ~ the height of the canvas though it changes to be less than this

  // Timer to start drawing lightning
  int drawLightningAfterXSecondsCurrentValue; // The initial start timer is 5 seconds
  int drawLightningAfterXSecondsIncrementValue; // The initial start timer will be incremented by 5 each time 5 seconds has passed

  // Canvas size
  int canvasWidth;

  // Program controlled input
  // Line points
  // Second point
  float lightningLinePoint2XPos; // The default value is Line_Point_1_XPos
  float lightningLinePoint2YPos; // The default value is Line_Point_1_YPos

  // Move the x point across the canvas
  int generateRandomXValue = 0; 
  boolean xPointTranslated = true; 

  // Lightning Time settings
  // Count how much time has passed
  int currentSecondsElapsed;

  // Timer to stop drawing lightning
  int stopLightningAfterXSecondsCurrentValue; // The initial stop timer is 6 seconds
  int stopLightningAfterXSecondsIncrementValue; // The initial stop timer will increment by 6 seconds

  // Controller to start / stop drawing lightning
  boolean startDrawingLightning = false; // The default value is false (as I auto change it to true)

  // Set the colourn of the lines
  color lightningColour;

  Lightning(float inputLightningLinePoint1XPos, float inputLightningLinePoint1YPos, int inputEndingYPos, 
    int inputDrawLightningAfterXSecondsCurrentValue, int inputDrawLightningAfterXSecondsIncrementValue, int inputCanvasWidth) {

    // Set the settings
    // Canvas width
    canvasWidth = inputCanvasWidth;

    // Set line points
    lightningLinePoint1XPos = inputLightningLinePoint1XPos;
    lightningLinePoint1YPos = inputLightningLinePoint1YPos;

    lightningLinePoint2XPos = lightningLinePoint1XPos;
    lightningLinePoint2YPos = lightningLinePoint1YPos;

    // Line ending point
    endingYPos = inputEndingYPos;
    initialEndingYPos = inputEndingYPos;

    // Lightning Time settings
    // Timer to start drawing lightning
    drawLightningAfterXSecondsCurrentValue = inputDrawLightningAfterXSecondsCurrentValue; 
    drawLightningAfterXSecondsIncrementValue = inputDrawLightningAfterXSecondsIncrementValue; 

    // Timer to stop drawing lightning
    stopLightningAfterXSecondsCurrentValue = drawLightningAfterXSecondsCurrentValue + 2; 
    stopLightningAfterXSecondsIncrementValue = drawLightningAfterXSecondsIncrementValue; 

    // Controller to start / stop drawing lightning
    startDrawingLightning = false;

    // Program defined input
    xPointTranslated = true;
  }

  void DrawLightningConditions() {
    // Count the time passed since the program is started in seconds for second timers
    currentSecondsElapsed = int(millis()/1000);

    // Check if the time elapsed equals the timer event value and if StartDrawingLightning = false
    if ( (currentSecondsElapsed == drawLightningAfterXSecondsCurrentValue) && (startDrawingLightning == false) ) {
      // Print to console
      println("Drawing lightning");
      startDrawingLightning = true; 

      // Update the new timer event value
      drawLightningAfterXSecondsCurrentValue = drawLightningAfterXSecondsCurrentValue + drawLightningAfterXSecondsIncrementValue;
    }
    // If the controller to draw lightning says to draw lightning then draw lightning
    else if ( (startDrawingLightning == true) && (currentSecondsElapsed != stopLightningAfterXSecondsCurrentValue) ) {

      // Move the lightning across the x-axes randomly once (if XPointTranslated = false)
      if (xPointTranslated == false) {
        xPointTranslated = true; 
        generateRandomXValue = int(random(20, canvasWidth-100)); // Make it 100 pixels from edge
      }

      // Move the lightning
      translate(generateRandomXValue, 0);

      // Start drawing lightning (at last)
      LightningCallFunctions();
    }
    // Use this timer to check if the program should stop drawing lightning
    // Check if the time elapsed equals the timer event value
    else if ( (startDrawingLightning == true) && (currentSecondsElapsed == stopLightningAfterXSecondsCurrentValue) ) {
      // Print to console
      println("Stop drawing lightning and reset the position");

      // Update the new timer event value
      stopLightningAfterXSecondsCurrentValue = stopLightningAfterXSecondsCurrentValue + stopLightningAfterXSecondsIncrementValue;

      // Change the settings so that lightning will not be drawn anymore
      startDrawingLightning = false;

      // Reset the lightning position so that it does not resume from where it left off and instead draws from new values upon starting again
      LightningReset();

      // Make a new lightning X position
      xPointTranslated = false;
    }
  }

  // Call the various lightning functions if the conditions are met
  void LightningCallFunctions() {
    // Reset Lightning Set 1 when its Y value exceeds the EndingYPos value
    if (lightningLinePoint2YPos > endingYPos) {
      // Call an outside function - reset line values
      LightningReset();
    }
    // Draw Lightning Set 1 if its Y value does not exceed the EndingYPos value
    else if (lightningLinePoint2YPos <= endingYPos) {

      // Call an outside function - draw lightning
      LightningDraw();

      // Call an outside function - update the position of the lightning
      LightningUpdatePosition();
    }
  }

  // Reset the position of the lightning
  void LightningReset() {
    // Play the lightning strike sound
    SFXPlayer(LIGHTNING_STRIKE_SOUND_FILENAME, muteSoundsSetting);

    // Clear previous lightning bolts
    setBackground(true);

    // Reset Y position
    lightningLinePoint2YPos = 80; // At cloud height
    lightningLinePoint1YPos = lightningLinePoint2YPos; 

    // Make the next YPos ending point random
    // Make sure the lightning does not end instantly by making first value > 100
    endingYPos = int(random(100, initialEndingYPos));
  }

  // Draw the lightning
  void LightningDraw() {
    // Set the colourn of the lines
    lightningColour = color(255, random(100, 256), 0);

    // Set the stroke settings of the lines
    smallStrokeWeight();
    stroke(lightningColour);

    // Change the XPos of the second point to make it rock back and forth
    lightningLinePoint2XPos=noise(lightningLinePoint2XPos+lightningLinePoint2YPos)*125;

    // Draw the lines using the point values
    line(lightningLinePoint1XPos, lightningLinePoint1YPos, lightningLinePoint2XPos, lightningLinePoint2YPos);
  }

  // Update the position of the lines of lightning
  void LightningUpdatePosition() {
    // Add points to the lines to give the lightning a more ragged effect (the edges stand out more)
    whiteFill();
    largeStrokeWeight();
    point(lightningLinePoint2XPos, lightningLinePoint2YPos);

    // Update the position of the lines by making the first point where the second point ends up
    lightningLinePoint1XPos = lightningLinePoint2XPos;
    lightningLinePoint1YPos = lightningLinePoint2YPos;

    // Increase the position of the second point by 5
    lightningLinePoint2YPos += 5;
  }
} /** [-------END-------] ***/

/** ------------------------------------------------- ***/

/** PLAYING SCREEN CLASSES: THE BUTTON CLASS FOR MOUSE CLICKABLE AREAS ***/
class Button { /** [-------START-------] ***/
  // Declare the data structures
  // User input
  // Button position
  float buttonXPos;
  float buttonYPos;

  // Button size
  float buttonWidth;
  float buttonHeight;

  // Text to display
  String textButton;

  // The line number we jump to
  String pointerButton;

  // Program input
  // Check if the button exists
  boolean buttonExists = false;

  Button(float inputButtonXPos, float inputButtonYPos, float inputButtonWidth, float inputButtonHeight, String inputTextButton, String inputPointerButton) {

    // Pass through the user input
    buttonXPos=inputButtonXPos;
    buttonYPos=inputButtonYPos;
    buttonWidth=inputButtonWidth;
    buttonHeight=inputButtonHeight;
    textButton=inputTextButton;
    pointerButton=inputPointerButton;

    // Set the button as existent
    buttonExists = true;
  }

  // Display the button
  void displayButton() {

    // Only draw the button if the button exists
    if (!buttonExists) {
      // Do not draw the button if the button does not exist
      return;
    } else {
      // Draw the buttons
      // Button draw settings 
      noFill(); 
      stroke(255, 0, 0); 

      // Draw the buttons
      rect(buttonXPos, buttonYPos, buttonWidth, buttonHeight);

      // Text settings
      whiteFill();
      centreText();
      textSize(18);

      // Draw the text for the buttons
      text(textButton, buttonXPos+buttonWidth/2, buttonYPos+buttonHeight/2+5);
    }
  }

  boolean mouseOver() {
    // Check if the button exists
    if (!buttonExists) {
      // If it does not state that it does not
      return false;
    } else {
      // If it does return the position of where the button area is
      return mouseX > buttonXPos && mouseY > buttonYPos && mouseX < buttonXPos + buttonWidth && mouseY < buttonYPos + buttonHeight;
    }
  }

  void setPointer() { 
    // Check if the button exists
    if (!buttonExists) {
      // If it does not do nothing
      return;
    } else {
      // Set the pointer to the relevant pointer
      pointer=int(getLineNumberFromLabel(pointerButton));
    }
  }

  int getLineNumberFromLabel(String label) { 
    // Return the line number from the label
    return hashMap.get(label);
  }
} /** [-------END-------] ***/

/** ------------------------------------------------- ***/

/** LOSING SCREEN CLASSES: THE SCREENFLASHER CLASS ***/
class ScreenFlasher { /** [-------START-------] ***/
  // User input
  // Declare the screen colours
  int minValueR;
  int minValueG;
  int minValueB;

  // Amount to deviate from the value entered
  int maxValueR;
  int maxValueG;
  int maxValueB;

  // Set the size of the rectangle
  // Program width
  int programWidth = 0;

  // Program height
  int programHeight = 0;

  // Pass the input into the data structures
  ScreenFlasher(int inputMinValueR, int inputMaxValueR, int inputMinValueG, int inputMaxValueG, int inputMinValueB, int inputMaxValueB, int inputProgramWidth, int inputProgramHeight) {

    // Declare the min colours
    minValueR = inputMinValueR; 
    minValueG = inputMinValueG; 
    minValueB = inputMinValueB; 

    // Declare the max colours
    maxValueR = inputMaxValueR;
    maxValueG = inputMaxValueG;
    maxValueB = inputMaxValueB;

    // Set the size of the rectangle
    programWidth = inputProgramWidth;
    programHeight = inputProgramHeight;
  }

  void FlashTheScreen() {
    // Declare data structures (locally)
    int generateRedColour = int(random(minValueR, maxValueR));
    int generateGreenColour = int(random(minValueG, maxValueG));
    int generateBlueColour = int(random(minValueB, maxValueB));

    color newColour = color(generateRedColour, generateGreenColour, generateBlueColour);

    // Make the colour the screen colour (it should update)
    fill(newColour);
    stroke(newColour);

    // Draw the flashing screen settings
    rectMode(CORNER);

    // Draw the flashing screen
    rect(0, 0, programWidth, programHeight);
  }
} /** [-------END-------] ***/

/** VICTORY SCREEN CLASS: THE ANIMATED CAR CLASS ***/
class Car { /** [-------START-------] ***/
  // Declare the data structures
  // User input variables
  // The position of the car
  float carBodyXPos;
  float carBodyYPos;

  // The speed of the car
  float carSpeed;

  // The speed of the car axels
  float wheelTurnSpeed;

  // The angle of the car axels
  float angle;

  // The colour of the car
  color carBodyColour;

  // The outmost rim colour of the car
  color carOuterOuterRimColour;

  // The outer rim colour of the car
  color carOuterRimColour;

  // The inner rims
  color carInnerRimColour;

  // Pass the input into the data structures
  Car(float inputCarBodyXPos, float inputCarBodyYPos, float inputCarSpeed, float inputWheelTurnSpeed, color inputCarBodyColour, color inputCarOuterOuterRimColour, color inputCarOuterRimColour, color inputCarInnerRimColour) {

    // The position of the car
    carBodyXPos = inputCarBodyXPos;
    carBodyYPos = inputCarBodyYPos;

    // The speed of the car
    carSpeed = inputCarSpeed;

    // The speed of the car axels
    wheelTurnSpeed = inputWheelTurnSpeed;

    // The colour of the car
    carBodyColour = inputCarBodyColour;
    carOuterOuterRimColour = inputCarOuterOuterRimColour;
    carOuterRimColour = inputCarOuterRimColour;
    carInnerRimColour = inputCarInnerRimColour;
  }


  void DrawTheCar() {
    // Display the car car
    RenderTheCar();

    // Make the car move
    UpdateTheCarPosition();
  }

  void RenderTheCar() {
    // Car drawing settings
    centreObject();
    smallStrokeWeight();

    // Local variables
    // The car skeleton size
    final int CAR_BODY_WIDTH = 300; // Avoid changing
    final int CAR_BODY_HEIGHT = 80; // Avoid changing
    final int CAR_WINDOW_SIZE = 100; // Avoid changing
    final int CAR_ROOF_SIZE = 120; // Avoid changing

    // The car wheel size
    final int CAR_OUTER_OUTER_RIM_SIZE = 80; // Avoid changing
    final int CAR_OUTER_RIM_SIZE = CAR_OUTER_OUTER_RIM_SIZE - 15; // Avoid changing
    final int CAR_INNER_RIM_SIZE = CAR_OUTER_OUTER_RIM_SIZE - 30; // Avoid changing

    // Draw the skeleton of the car
    // Set the colour of the skeleton
    fill(carBodyColour);
    stroke(carBodyColour);

    // The body
    rect(carBodyXPos, carBodyYPos, CAR_BODY_WIDTH, CAR_BODY_HEIGHT); 

    // The missing bottom part of the body
    rect(carBodyXPos, carBodyYPos+45, 200, 20); 

    // The missing left part of the body
    beginShape();
    // Left wheel point
    vertex(carBodyXPos-140, carBodyYPos+50);

    // Forward from left trunk point
    vertex(carBodyXPos-180, carBodyYPos+20);

    // Up from forward left trunk point
    vertex(carBodyXPos-180, carBodyYPos-40);

    // Back into the car body
    vertex(carBodyXPos-120, carBodyYPos-40);
    endShape(CLOSE);

    // The missing right part of the body
    beginShape();
    // Left wheel point
    vertex(carBodyXPos+140, carBodyYPos+50);

    // Forward from left trunk point
    vertex(carBodyXPos+180+20, carBodyYPos+20);

    // Up from forward left trunk point
    vertex(carBodyXPos+180+20, carBodyYPos-40);

    // Back into the car body
    vertex(carBodyXPos+120, carBodyYPos-40);
    endShape(CLOSE);

    // The roof
    // Middle roof section
    rect(carBodyXPos-10, carBodyYPos-60, 20, 80);

    // left roof
    arc(carBodyXPos-20, carBodyYPos-40, 65+CAR_ROOF_SIZE, CAR_ROOF_SIZE, radians(180), radians(270));

    // right roof
    arc(carBodyXPos, carBodyYPos-40, 65+CAR_ROOF_SIZE, CAR_ROOF_SIZE, radians(270), radians(360));

    // The windows
    greyFill();

    // The left roof
    arc(carBodyXPos-20, carBodyYPos-40, 65+CAR_WINDOW_SIZE, CAR_WINDOW_SIZE, radians(180), radians(270));

    // The right window
    arc(carBodyXPos, carBodyYPos-40, 65+CAR_WINDOW_SIZE, CAR_WINDOW_SIZE, radians(270), radians(360));

    // The door handle
    whiteFill();
    ellipse(carBodyXPos+30, carBodyYPos-10, 15, 15);

    // The light on the car
    redFill(100);

    // Top light
    ellipse(carBodyXPos+200, carBodyYPos, 10, 10);

    // Bottom light
    ellipse(carBodyXPos+200, carBodyYPos-15, 10, 10);

    // Draw the wheels of the car
    // The outmost (outer outer) rims
    fill(carOuterOuterRimColour);
    ellipse(carBodyXPos-100, carBodyYPos+60, CAR_OUTER_OUTER_RIM_SIZE, CAR_OUTER_OUTER_RIM_SIZE);
    ellipse(carBodyXPos+100, carBodyYPos+60, CAR_OUTER_OUTER_RIM_SIZE, CAR_OUTER_OUTER_RIM_SIZE);

    // The outer rims
    fill(carOuterRimColour);
    ellipse(carBodyXPos-100, carBodyYPos+60, CAR_OUTER_RIM_SIZE, CAR_OUTER_RIM_SIZE);
    ellipse(carBodyXPos+100, carBodyYPos+60, CAR_OUTER_RIM_SIZE, CAR_OUTER_RIM_SIZE);

    // The inner rims
    fill(carInnerRimColour);
    ellipse(carBodyXPos-100, carBodyYPos+60, CAR_INNER_RIM_SIZE, CAR_INNER_RIM_SIZE);
    ellipse(carBodyXPos+100, carBodyYPos+60, CAR_INNER_RIM_SIZE, CAR_INNER_RIM_SIZE);

    // The left axel
    pushMatrix();
    CarWheelAxel(carBodyXPos-100, carBodyYPos+60);
    popMatrix();

    // The right axel
    pushMatrix();
    CarWheelAxel(carBodyXPos+100, carBodyYPos+60);
    popMatrix();
  }

  void CarWheelAxel(float inputXPos, float inputYPos) {
    // Increase the angle so that the axel continually moves around
    angle = angle + 5;

    // The position constantly focuses to the right spot so the rotate stops messing around 
    translate(inputXPos, inputYPos); 

    // Make the axel move around
    rotate(cos(angle));

    // Draw the axel rectangle
    blackFill();
    rect(0, 0, 25, 25);  

    // Draw the moving axel
    whiteFill();
    ellipse(0, 0, 10, 10);
  }

  void UpdateTheCarPosition() {
    // Make the car move
    carBodyXPos = carBodyXPos + carSpeed;
  }
} /** [-------END-------] ***/

/** ------------------------------------------------- ***/