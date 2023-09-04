public class AssemblerException extends Exception {
    public AssemblerException(String errorMessage) {
        super(errorMessage);
    }

    public AssemblerException(String errorMessage, Throwable e) {
        super(errorMessage, e);
    }
}
