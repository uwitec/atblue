package cn.com.atblue.common.codegen.ftl;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;

import java.io.*;
import java.util.Locale;

public class TemplateFactory {
    private static final String CONFIGURATION_ENCODEING = "UTF-8";

    public static Template getTemplate(String templete) {
        return getTemplate("CONFIGURATION_DEFAULT", templete);
    }

    public static Template getTemplate(String cfgKey, String templete) {
        Configuration cfg = new Configuration();
        cfg.setDefaultEncoding("UTF-8");
        cfg.setEncoding(Locale.SIMPLIFIED_CHINESE, "UTF-8");
        cfg.setClassForTemplateLoading(TemplateFactory.class,"");
        try {
            Template template = cfg.getTemplate(templete);
            template.setEncoding("UTF-8");
            return template;
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void write(Template template, Object model, OutputStream output) {
        Writer writer = null;
        try {
            writer = new BufferedWriter(new OutputStreamWriter(output, "UTF-8"));
            template.process(model, writer);
            writer.flush();
        } catch (TemplateException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}