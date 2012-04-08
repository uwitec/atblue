package cn.com.atblue.workflow.test;

import cn.com.atblue.common.SpringFactory;
import cn.com.atblue.workflow.runtime.Workflow;
import cn.com.atblue.workflow.runtime.WorkflowException;

public class Main {
    public static void main(String[] args) throws WorkflowException {
        Workflow workflow = (Workflow) new SpringFactory().getBean("workflow");
//            System.out.println(workflow.startWorkflow("1","blue"));
        //ce300022-2984-4304-a28e-feb5483cc5ce
//        System.out.println(workflow.receiveMission("ce300022-2984-4304-a28e-feb5483cc5ce","test"));
        //id:8731b537-dcff-4fcc-9ab9-5604a895be65
//        workflow.completeMission("8731b537-dcff-4fcc-9ab9-5604a895be65", "test", "test", "4");
    }
}
