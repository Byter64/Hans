public class Instruction {
    Source2Type q2type;
    OperationType optype;
    byte opcode;
    int destination, source1, source2;
    RequiredInputs reqi;
    //the String jumpsToLabel is usually empty for most instructions
    //it is required for jump operations to labels
    public String jumpsToLabel;
    public boolean needsLabelReplaced;

    public int line;
    public static String[] arithmetic_codes = {"add", "sub", "mul", "sqrt", "div", "mod", "sl", "sr", "slc", "src"};
    public static String[] comparison_codes = {"ce", "cne", "cg", "cge", "cl", "cle"};
    public static String[] bitwise_codes = {"not", "and", "or", "xor", "xnor"};
    public static String[] special_codes = {"ld", "store", "jreg", "bez", "jal"};

    public Instruction(String code, int line) throws AssemblerException {

        code = code.toLowerCase();
        if(code.endsWith("i")) {
            q2type = Source2Type.immediate;
            code = code.substring(0, code.length()-1);
        } else if(code.endsWith(".s")) {
            q2type = Source2Type.floatreg;
            code = code.substring(0, code.length()-2);
        } else {
            q2type = Source2Type.intreg;
        }
        
        tryAssignOperation(code);

        needsLabelReplaced = false;
        this.line = line;
    }

    //inserts the next input into instruction
    //returns true if intstruction still requires inputs
    public boolean insertInput(String input) throws AssemblerException {
        assignNextInput(getNumberTooAssign(input));
        return reqi.destination || reqi.source1 || reqi.source2;
    }

    public void replaceLabel(Label label, int jumpsFrom) throws AssemblerException {
        int number = label.getInstructionNumber() - jumpsFrom - 1;
        if(optype == OperationType.jump)
                    if(!inBigImmediate(number))
                        throw new AssemblerException("Jump too big");
                else
                    if(!inSmallImmediate(number))
                        throw new AssemblerException("Jump too big");
        source2 = number;
        needsLabelReplaced = false;
    }

    //returns the binary representation of the instruction
    public int getBin() {
        int bin = getBinOperation();

        if(reqi.wasDestinationRequired())
            bin |= (destination << 21);
        
        if(reqi.wasSource1Required())
            bin |= (source1 << 16);

        if (reqi.wasSource2Required())
            if(q2type != Source2Type.immediate)
                bin |= (source2 << 11);
            else if(optype == OperationType.jump)
                bin |= source2 & ((1 << 26) - 1);
            else
                bin |= source2 & ((1 << 16) - 1);

        return bin;
    }

    //matches the given instruction with the available codes and adjusts instruction variables accordingly
    //throws an exception if instruction couldn't find a match
    private void tryAssignOperation(String lowercaseCode) throws AssemblerException {
        if(tryAssignOptype(lowercaseCode, arithmetic_codes, OperationType.arithmetic)) {

            if(opcode == 0b000011)
                reqi = new RequiredInputs(true, true, false);
            else
                reqi = new RequiredInputs(true, true, true);
            
        } else if(tryAssignOptype(lowercaseCode, comparison_codes, OperationType.comparison)) {

            reqi = new RequiredInputs(true, true, true);

        } else if(tryAssignOptype(lowercaseCode, bitwise_codes, OperationType.bitwise)) {

            if(opcode == 0b000000)
                reqi = new RequiredInputs(true, true, false);
            else
                reqi = new RequiredInputs(true, true, true);
            
        } else if(tryAssignOptype(lowercaseCode, special_codes, OperationType.special)) {
            if(opcode > 0 || q2type == Source2Type.floatreg)
                opcode++;
            q2type = Source2Type.immediate;

            if(opcode == 3)
                reqi = new RequiredInputs(false, true, false);
            else if(opcode == 4)
                reqi = new RequiredInputs(false, true, true);
            else if(opcode == 5)
                reqi = new RequiredInputs(true, false, true);
            else
                reqi = new RequiredInputs(true, true, true);
            
        } else if(lowercaseCode.equals("jmp")) {
            optype = OperationType.jump;
            opcode = 0;
            q2type = Source2Type.immediate;

            reqi = new RequiredInputs(false, false, true);

        } else
            throw new AssemblerException("Failed to match instruction with available codes");
    }

    //assigns operation type with given instruction and returns false if not successfull
    private boolean tryAssignOptype(String code, String[] codes, OperationType optype) {
        for(byte i = 0; i < codes.length; i++)
            if(code.equals(codes[i])) {
                this.optype = optype;
                opcode = i;
                return true;
            }
        return false;
    }


    private int getNumberTooAssign(String input) throws AssemblerException {
        int number;
        switch(getExpectedInput()) {
            case register:
                if(input.startsWith("r") || input.startsWith("R"))
                    number = getNumberFromString(input.substring(1));
                else
                    throw new AssemblerException("Expected Register");
                if(number < 0 || number > 31)
                    throw new AssemblerException("Register out of bounds");
                else
                    return number;
            case immediate:
                number = getNumberFromString(input);
                if(!inSmallImmediate(number))
                    throw new AssemblerException("Immediate too big");
                else
                    return number;
            case label:
                try {
                    number = getNumberFromString(input);
                } catch(Exception e) {
                    jumpsToLabel = input;
                    needsLabelReplaced = true;
                    return 0;
                }
                if(optype == OperationType.jump)
                    if(!inBigImmediate(number))
                        throw new AssemblerException("Jump too big");
                else
                    if(!inSmallImmediate(number))
                        throw new AssemblerException("Jump too big");
                return number;
            default:
                throw new AssemblerException("Unexpected Input");
        }
    }
    //returns the next expected input
    private ExpectedInput getExpectedInput() {
        if(reqi.destination || reqi.source1)
            return ExpectedInput.register;
        else if(reqi.source2)
            if(q2type != Source2Type.immediate)
                return ExpectedInput.register;
            else if(optype == OperationType.jump || (optype == OperationType.special && (opcode == 4 || opcode == 5)))
                return ExpectedInput.label;
            else
                return ExpectedInput.immediate;
        else
            return ExpectedInput.none;
    }
    //converts a given string into a number and throws an exception if not successfull
    private int getNumberFromString(String input) throws AssemblerException {
        boolean isNegative = false;
        if(input.startsWith("-")) {
            isNegative = true;
            input = input.substring(1);
        }
        int radix = 10;
        if(input.startsWith("0")) {
            radix = 8;
            input = input.substring(1);
        }

        if(input.length() == 0)
            return 0;
        char c = input.charAt(0);

        switch(c) {
            case 'b', 'B':
                radix = 2;
                input = input.substring(1);
                break;
            case 'o', 'O':
                radix = 8;
                input = input.substring(1);
                break;
            case 'd', 'D':
                radix = 10;
                input = input.substring(1);
                break;
            case 'x', 'X', '#':
                radix = 16;
                input = input.substring(1);
                break;
        }
        int number;
        try {
            number = Integer.parseInt(input, radix);
        } catch(Exception e) {
            throw new AssemblerException("Invalid number sequence", e);
        }
        if(isNegative)
            number *= -1;
        
        return number;
    }

    private void assignNextInput(int number) {
        if(reqi.destination) {
            destination = number;
            reqi.destination = false;
        } else if(reqi.source1) {
            source1 = number;
            reqi.source1 = false;
        } else if(reqi.source2) {
            source2 = number;
            reqi.source2 = false;
        }
    }

    private boolean inSmallImmediate(int number) {
        return !tooBig(number, 16);
    }

    private boolean inBigImmediate(int number) {
        return !tooBig(number, 26);
    }

    private boolean tooBig(int number, int size) {
        return number >= (1 << size) || number < -(1 << size);
    }

    //returns the binary representation of the operation
    private int getBinOperation() {
        int bin = 0;
        switch(q2type) {
            
            case intreg:
                switch(optype) {
                    case comparison:
                        bin |= 0b010000;
                        break;
                    case bitwise:
                        bin |= 0b011000;
                        break;
                    default:
                        break;
                }
                bin |= opcode;
                break;

            case floatreg:
                bin |= 0b100000;
                bin |= opcode;
                break;

            case immediate:
                switch(optype) {
                    case arithmetic:
                        bin |= (0b100000 << 26);
                        break;
                    case comparison:
                        bin |= (0b110000 << 26);
                        break;
                    case bitwise:
                        bin |= (0b111000 << 26);
                        break;
                    case special:
                        bin |= (0b101000 << 26);
                        opcode += 0b010;
                        break;
                    case jump:
                        bin |= (0b010000 << 26);
                        break;
                }
                bin |= (opcode << 26);
                break;
        }
        return bin;
    }
}
