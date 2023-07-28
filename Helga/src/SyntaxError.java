public class SyntaxError {
    private String message;
    
    public SyntaxError(AssemblerException e, int line) {
        this.message = "Syntax Error in line " + line + ": " + e.getMessage();
    }

    public SyntaxError(String message, int line) {
        this.message = "Syntax Error in line " + line + ": " + message;
    }

    public void print() {
        System.out.println(message);
    }
}
