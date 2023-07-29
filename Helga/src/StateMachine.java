import java.io.DataOutputStream;
import java.io.IOException;
import java.util.LinkedList;

public class StateMachine {
    private State state;
    private boolean expectsArgs;
    private int line;
    private String buffer;
    private LinkedList<SyntaxError> errors = new LinkedList<SyntaxError>();
    private LinkedList<Instruction> instructions = new LinkedList<Instruction>();
    private LinkedList<Label> labels = new LinkedList<Label>();

    public StateMachine() {
        state = State.whitespace;
        expectsArgs = false;
        line = 1;
        buffer = "";
    }

    //if assembler encountered errors, they handeled and function returns true
    public boolean handleSyntaxErrors() {
        if(errors.size() > 0) {
            System.out.println("Failed to parse code:");
            for(SyntaxError error: errors)
                error.print();
            return true;
        } else
            return false;
    }

    public void insertCharacter(char c) {
        try {
            switch(state) {
                case whitespace:
                    inWhitespace(c);
                    break;
                case symbol:
                    inSymbol(c);
                    break;
                case singlelinecomment:
                    inSinglelinecomment(c);
                    break;
                case multilinecomment:
                    inMultilinecomment(c);
                    break;
            }
        } catch(AssemblerException e) {
            errors.add(new SyntaxError(e, line));
            if(c == '\n')
                state = State.whitespace;
            else
                state = State.singlelinecomment;
            buffer = "";
            expectsArgs = false;
        }
        if(c == '\n')
            line++;
    }

    public void writeInstructionToFile(DataOutputStream out) throws IOException {
        boolean disableOutput = false;
        int currentInstruction = 0;
        for(Instruction instruction: instructions) {
            if(instruction.needsLabelReplaced) {
                boolean found = false;
                for(Label label: labels) {
                    if(label.name.equals(instruction.jumpsToLabel)) {
                        try {
                            instruction.replaceLabel(label, currentInstruction);
                        } catch(AssemblerException e) {
                            errors.add(new SyntaxError("Label is too far away to jump to", instruction.line));
                            disableOutput = true;
                        }
                        
                        found = true;
                        break;
                    }
                }
                if(!found) {
                    errors.add(new SyntaxError("Failed to find label " + instruction.jumpsToLabel, instruction.line));
                    disableOutput = true;
                }
            }
            if(!disableOutput)
                out.writeInt(instruction.getBin());
            currentInstruction++;
        }
    }

    private void inWhitespace(char c) throws AssemblerException {
        if(c == ':' || c == ',')
            throw new AssemblerException("Unexpected " + c);
        else if(!Character.isWhitespace(c)) {
            buffer += c;
            state = State.symbol;
        }
    }

    private void inSymbol(char c) throws AssemblerException {
        switch(c) {
            case '/', '*':
                if(buffer.endsWith("/")) {
                    if(c == '/')
                        state = State.singlelinecomment;
                    else
                        state = State.multilinecomment;
                    buffer = "";
                } else
                    buffer += c;
                break;
            case ':':
                if(expectsArgs)
                    throw new AssemblerException("Unexpexted :");
                else {
                    labels.add(new Label(buffer, instructions.size()));
                    state = State.whitespace;
                    buffer = "";
                }
                break;
            case ',':
                if(!expectsArgs)
                    throw new AssemblerException("Unexpected ,");
                else {
                    if(!instructions.getLast().insertInput(buffer))
                        expectsArgs = false;
                    state = State.whitespace;
                    buffer = "";
                }
                break;
            default:
                if(Character.isWhitespace(c)) {
                    if(!expectsArgs) {
                        instructions.add(new Instruction(buffer, line));
                        expectsArgs = true;
                    } else {
                        if(!instructions.getLast().insertInput(buffer))
                            expectsArgs = false;
                    }
                    state = State.whitespace;
                    buffer = "";
                } else
                    buffer += c;
                break;
        }
    }

    private void inSinglelinecomment(char c) {
        if(c == '\n')
            state = State.whitespace;
    }

    private void inMultilinecomment(char c) {
        switch(c) {
            case '*':
                buffer = "*";
                break;
            case '/':
                if(buffer.charAt(0) == '*')
                    state = State.whitespace;
            default:
                buffer = "";
                break;
        }
    }
}
