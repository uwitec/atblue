package cn.com.atblue.common.codegen;

import cn.com.atblue.common.SpringFactory;

public class Main {
    public static void main(String[] args) {
        SpringFactory springFactory = new SpringFactory();
        CodeManager codeManager = springFactory.getCodeManager();
        codeManager.generate();
    }
}
