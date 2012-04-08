package cn.com.atblue.workflow.runtime;

public class WorkflowException extends Exception {
    private String message;

    public WorkflowException(String message) {
        super(message);
        this.message = message;
    }
}
