/////////////////////////////////////////////////
// Code by Dan F @disuye 2022 "FontChaos" v1.0
/////////////////////////////////////////////////

import java.awt.*;
import java.io.*;
import java.nio.file.*;
import java.util.*;

/////////////////////////////////////////////////

String theWord = "# font chaos !";
int sizeWidth = 1100;
int sizeHeight = 800;
int frameRate = 24;
String fontFolder = "/Volumes/macOS/Users/disuye/Desktop/Font-Collection/"; // tested OK with 10,000 fonts in one directory
String projectFolder = "/Volumes/Evo2/processing/fontsmash/";

File fontDir;
File [] fontFiles;
String [] fontArray;
PFont pfont;
ArrayList<File> fontName = new ArrayList<File>();
InputStream ipst;
int posX;
int posY;

/////////////////////////////////////////////////

void settings() {
    size(sizeWidth, sizeHeight);
}

/////////////////////////////////////////////////

void setup() {
    frameRate(frameRate);
    colorMode(RGB, 1.0);
    surface.setLocation(2560, 0);
    surface.setTitle("FontChaos v1.0");

// Create an empty directory called "previous/" to store *.dat files
    try {
        String dir = projectFolder + "previous/";
        Path path = Paths.get(dir);
        Files.createDirectories(path);
    } catch (IOException e) {
        System.err.println(e.getMessage());
    }

// Remove duplicate chars from theWord. Speeds up checking if every font contains the necessary glyphs to display theWord...
    LinkedHashSet<Character> uniqueChars = new LinkedHashSet<>();   
    for(int i = 0; i < theWord.length(); i++) uniqueChars.add(theWord.charAt(i));   
    String regex = "^\\[|\\]$|,(?!,) "; // regex to remove [,] seperators from LinkedHashSet<Characters>
    char [] arr = (uniqueChars.toString().replaceAll(regex, "")).toCharArray();
    fontDir = new File(fontFolder);
    fontFiles = fontDir.listFiles();
    println(fontFiles.length + " fonts available.\nChecking fonts have the glyphs required to display '" + theWord + "'.");
// If theWord has been used before, load the previous *.dat file that lists all OK fonts...    
    Path source = Paths.get(projectFolder + "previous/" + theWord + ".dat");
        if (Files.exists(source)) {
            println("Reading previous DAT file...");
            println(source);
            try {
                FileInputStream fis = new FileInputStream(source.toString());
                ObjectInputStream ois = new ObjectInputStream(fis);
                fontName = (ArrayList) ois.readObject();
                ois.close();
                fis.close();
            } catch (IOException e) {
                e.printStackTrace();
                return;
            } catch (ClassNotFoundException c) {
             c.printStackTrace();
             return;
            }
        } else {
            for (int i = 0; i < fontFiles.length; i++) {
                if (fontFiles[i].getName().startsWith("._")) {
                    fontFiles[i].delete();
                }
                if (fontFiles[i].toString().matches(".*(ttf|otf)$")) {
                    PFont font = createFont(fontFiles[i].toString(), 1, true);
                    fontName.add(fontFiles[i]); // add _all_ available fonts to ArrayList
                    for (int g = 0; g < arr.length; g++) {
                        if (font.getGlyph(arr[g]) == null) { // check if the font contains glyphs to display theWord
                            fontName.remove(fontFiles[i]); // if glyphs are not available, remove unuseable font from ArrayList
                        } else {
                            print(fontName.size() + " out of " + i, "\r"); // Return to line start "\r" does not work with Processing 4.0
                        }
                    }
                }
            }
        }   
    print("\r");
    println(fontName.size() + " fonts are OK.");

// save a *.dat file listing all OK fonts for theWord, so we can use these result again [see above]...
    try {
        FileOutputStream fos = new FileOutputStream(source.toString());
        ObjectOutputStream oos = new ObjectOutputStream(fos);
        oos.writeObject((ArrayList<File>) fontName);
        oos.close();
    } catch (IOException e) {
        e.printStackTrace();
    }
}

/////////////////////////////////////////////////

void draw() {
    background(0);
// TO DO: Create method to adjust scale and transformation and remain centered...
    translate(width/8, height/8);
    scale(0.75);
    fontChanger();
// saveFrame("output/frame_####.tif");
}

/////////////////////////////////////////////////

void fontChanger() {
    int l = theWord.length();
    for (int i = 0; i < l; i++) {
        int r = int(random(0, fontName.size()));
        float fontSize = width / l;
        fontSize = Math.min(height / 2, Math.max(width / l, fontSize)); 
        pfont = createFont(fontName.get(r).toString(), fontSize);
        textAlign(CENTER, CENTER);
        textFont(pfont);
        if (l > 1) {
            posX = (i * int(fontSize * 1.0)) + (width / (l + 1)) / 2;
        } else {
            posX = width / 2;
        }
        posY = (height / 2) - (int(fontSize) / 4);
        text(theWord.charAt(i), posX, posY);
    }
}

/////////////////////////////////////////////////
