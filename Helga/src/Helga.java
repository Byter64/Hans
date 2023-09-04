import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

public class Helga {
    public static void main(String[] args) {
        if(args.length < 1) {
            System.err.println("Please provide an input program");
            System.exit(1);
        }

        StateMachine assembler = new StateMachine();

        try (InputStream in = new FileInputStream(args[0]); BufferedReader r = new BufferedReader(new InputStreamReader(in))) {
            int intch;
            while((intch = r.read()) != -1 ) {
                assembler.insertCharacter((char) intch);
            }
        } catch(FileNotFoundException e) {
            System.err.println("Failed to find input program " + args[0]);
            System.exit(1);
        } catch(IOException e) {
            System.err.println("Failed to close file " + args[0]);
            System.exit(1);
        }

        if(assembler.handleSyntaxErrors())
            System.exit(1);
        else
            System.out.println("Successfully converted input program to instructions");
        
        String name = args[0];
        if(name.endsWith(".txt"))
            name = name.substring(0, name.length()-4);
        name += ".bin";

        try (DataOutputStream out = new DataOutputStream(new FileOutputStream(name))) {
            assembler.writeInstructionToFile(out);
        } catch(FileNotFoundException e) {
            System.err.println("Failed to open output file " + name);
            System.exit(1);
        } catch(IOException e) {
            System.err.println("Failed to close file " + name);
            System.exit(1);
        }

        if(assembler.handleSyntaxErrors()) {
            new File(name).delete();
            System.exit(1);
        } else
            System.out.println("Successfully converted input program to binary");
        
    }
}
