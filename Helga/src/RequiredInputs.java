public class RequiredInputs {
    boolean destination, source1, source2;
    private boolean od, os1, os2;
    public RequiredInputs(boolean destination, boolean source1, boolean source2) {
        this.destination = destination;
        this.source1 = source1;
        this.source2 = source2;
        od = destination;
        os1 = source1;
        os2 = source2;
    }

    public boolean wasDestinationRequired() {
        return od;
    }
    
    public boolean wasSource1Required() {
        return os1;
    }

    public boolean wasSource2Required() {
        return os2;
    }
}
