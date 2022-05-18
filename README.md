# Font Chaos
Processing animation that displays some text using random fonts for each letter, each frame.

![https://github.com/disuye/fontchaos/blob/main/FontChaos.gif](https://github.com/disuye/fontchaos/blob/main/FontChaos.gif "Font Chaos demo GIF")

# Functionality
Parses the text into characters, removes duplicates. Checks every font in a specific folder to see if they contain glyphs to display the text. All OK fonts are used in the animation (a list of OK fonts is saved as theWord.DAT), meanwhile fonts missing the required glyphs are ignored. 

If you run the sketch a second time using the same text, the font check routine is skipped and the DAT file used instead. Multiple DAT files are created, see the folder named 'previous/'. 

# Installation
Fonts *do not* need to be installed on your system. Simply collect all the OTF/TTF fonts you wish to use into one dedicated folder, preferably somewhere easy to reach like your Desktop. Font Chaos will only access fonts from one specific folder.

# Edit These Variables:
```java
String theWord = "# font chaos !";
int sizeWidth = 1100;
int sizeHeight = 800;
int frameRate = 24;
String fontFolder = "/Volumes/macOS/Users/disuye/Desktop/Font-Collection/";
String projectFolder = "/Volumes/Evo2/processing/fontsmash/";
```

# To Do:
- Morphing between glyphs.
- Multi line text and paragraphs.
- A smart way to scale font size & transform placement on screen.
- Refactor. I'm still a noob.
