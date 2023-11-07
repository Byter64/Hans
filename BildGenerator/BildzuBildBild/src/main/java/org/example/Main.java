package org.example;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import javax.imageio.ImageIO;

public class Main {
    public static void main(String[] args) {
        try {
            // Load the input image
            String homeuser = System.getProperty("user.home");
            BufferedImage inputImage = ImageIO.read(new File(homeuser+"\\Pictures\\Unbenannt.png")); // Replace with your image path
            PrintWriter writer = new PrintWriter(homeuser+"\\Pictures\\test.txt", StandardCharsets.UTF_8);

            // Iterate over each pixel in the input image
            for (int x = 0; x < inputImage.getWidth(); x++) {
                for (int y = 0; y < inputImage.getHeight(); y++) {
                    // Get the RGB values of the pixel
                    int pixel = inputImage.getRGB(x, y);
                    String answer = getString(pixel, y, x);
                    writer.println(answer);
                }
            }
            writer.close();
            // Save the output image

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private static String getString(int pixel, int y, int x) {
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
        String formatResult = String.format("%8s", result).replace(" ", "0");
        String answer = "ram[" + (y *160+ x) + "]= 8'b" + formatResult +";";
        return answer;
    }
}