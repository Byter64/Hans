import java.io.DataInputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

public class ReadBin {
    public static void main(String[] args) {
        if(args.length < 1) {
            System.err.println("Please provide an input program");
            System.exit(1);
        }
        try (DataInputStream in = new DataInputStream(new FileInputStream(args[0]))) {
            int intch;
            while((intch = in.readInt()) != -1 ) {
                System.out.println(String.format("%32s", Integer.toBinaryString(intch)).replace(' ', '0'));
            }
        } catch(FileNotFoundException e) {
            System.exit(1);
        } catch(IOException e) {
            System.exit(1);
        }
    }
}
