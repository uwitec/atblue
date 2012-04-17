package cn.com.atblue.common.job;

public class JobBean {
    private String name;//名字
    private String description;//描述
    private Class jobClass;//用到的类,需要继承org.quartz.Job接口
    private String cronTime;//小时:分,现在暂时支持这一中时间设置格式

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Class getJobClass() {
        return jobClass;
    }

    public void setJobClass(Class jobClass) {
        this.jobClass = jobClass;
    }

    public String getCronTime() {
        return cronTime;
    }

    public void setCronTime(String cronTime) {
        this.cronTime = cronTime;
    }
}
