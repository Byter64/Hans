package org.example;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.nio.file.Path;
import javax.imageio.ImageIO;

public class Main {
    public static final int Width = 160;
    public static final int Height = 120;
    public static void main(String[] args) {
        try {
            // Load the input image
            Path homeuser = Path.of(System.getProperty("user.dir"));
            System.out.println(homeuser);
            BufferedImage inputImage = ImageIO.read(new File(homeuser.toString()+"/picture.png")); // Replace with your image path
            PrintWriter writer = new PrintWriter(homeuser+"/picture.mem", StandardCharsets.UTF_8);
            if(inputImage.getHeight()<Height||inputImage.getWidth()<Width){
                return;
            }

            // Iterate over each pixel in the input image
            for (int y = 0; y < Height; y++) {
                for (int x = 0; x < Width; x++) {
                    // Get the RGB values of the pixel
                    int pixel = inputImage.getRGB(x, y);
                    String answer = getString(pixel);
                    writer.println(answer);
                }
            }
            writer.close();
            // Save the output image

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private static String getString(int pixel) {
        int blue = pixel & 0xff;
        int green = (pixel & 0xff00) >> 8;
        int red = (pixel & 0xff0000) >> 16;

        // Convert the RGB values to 8-bit format
        int rBits = (red >> 5);
        int gBits = (green >> 5);  // Bit 4-2
        int bBits = (blue >> 6) ;         // Bit 1-0

        // Combine the converted values into an 8-bit integer
        int newPixel = (rBits << 5) | (gBits << 2) | bBits;

        // Set the pixel in the output image with the new value
        String result = Integer.toBinaryString(newPixel);
        return String.format("%8s", result).replace(" ", "0");
    }
}