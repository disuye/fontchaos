# Font Chaos
Processing animation that displays some text using random fonts for each letter, each frame.

# Features
Parses the text into characters and checks every font to see if glyphs exist to display the text. All the OK fonts are used (a list of which is saved as theWord.DAT), meanwhile fonts missing the required glyphs are ignored. 

If you run the sketch a second time with the same text, the font check is skipped and the DAT file used instead. 

# Installation
Place all the fonts you wish to use into one dedicated folder, preferably somewhere easy to reach like Desktop. Fonts *do not* need to be installed on your system, just place the OTF anf TTF files into one folder.

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
