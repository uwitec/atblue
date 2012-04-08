package cn.com.atblue.oa.action;

import java.util.HashMap;
import java.util.Map;

import cn.com.atblue.common.Pagination;

import com.opensymphony.xwork2.ActionSupport;

public class BaseAction extends ActionSupport {
	private Map<String, String> params = new HashMap<String, String>();
    private String json;

	private Pagination pagination = new Pagination();

	public Pagination getPagination() {
		return pagination;
	}

	public void setPagination(Pagination pagination) {
		this.pagination = pagination;
	}

	public Map getParams() {
		return params;
	}

	public void setParams(Map params) {
		this.params = params;
	}

    public String getJson() {
        return json;
    }

    public void setJson(String json) {
        this.json = json;
    }
}
