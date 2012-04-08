package cn.com.atblue.common.codegen.jdbc;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class SqlSupport {
    private String sql = "";
    private List<String> sqlPartList = new ArrayList();
    private List<String> paramList = new ArrayList();

    public SqlSupport(String sql, Map<String, Object> sqlPartMap) {
        this.sql = parse(sql, sqlPartMap);
    }

    private String parse(String sql, Map<String, Object> sqlPartMap) {
        if (sqlPartMap == null) {
            sqlPartMap = new HashMap();
        }
        this.sqlPartList = parseSqlPartList(sql);
        for (int i = 0; i < this.sqlPartList.size(); i++) {
            String sqlPartKey = (String) this.sqlPartList.get(i);
            String sqlPart = (String) sqlPartMap.get(sqlPartKey);
            sql = sql.replaceAll("\\$" + sqlPartKey + "\\$", sqlPart);
        }
        this.paramList = parseParamList(sql);
        for (int i = 0; i < this.paramList.size(); i++) {
            sql = sql.replaceAll("#" + (String) this.paramList.get(i) + "#", "?");
        }
        return sql;
    }

    private List<String> parseParamList(String sql) {
        List paramList = new ArrayList();
        int paramIndex = -1;
        StringBuffer buff = new StringBuffer(sql);
        for (int i = 0; i < buff.length(); i++) {
            if (buff.charAt(i) == '#') {
                if (paramIndex != -1) {
                    paramList.add(buff.substring(paramIndex + 1, i));
                    paramIndex = -1;
                } else {
                    paramIndex = i;
                }
            }
        }
        return paramList;
    }

    private List<String> parseSqlPartList(String sql) {
        List sqlPartList = new ArrayList();
        int sqlpartIndex = -1;
        StringBuffer buff = new StringBuffer(sql);
        for (int i = 0; i < buff.length(); i++) {
            if (buff.charAt(i) == '$') {
                if (sqlpartIndex != -1) {
                    sqlPartList.add(buff.substring(sqlpartIndex + 1, i));
                    sqlpartIndex = -1;
                } else {
                    sqlpartIndex = i;
                }
            }
        }
        return sqlPartList;
    }

    public String getSql() {
        return this.sql;
    }

    public List<String> getSqlPartList() {
        return this.sqlPartList;
    }

    public List<String> getParamList() {
        return this.paramList;
    }

    public static void main(String[] args) {
        Map sqlPartMap = new HashMap();
        String c = "(select id from ttt where e=#a#)";
        sqlPartMap.put("c", c);
        String sql = "select * from dual where a=#a# and b=#b# and c=$c$ and d=#a#";
        SqlSupport s = new SqlSupport(sql, sqlPartMap);
        System.out.println(s.getSql());
        List p = s.getParamList();
        for (int i = 0; i < p.size(); i++)
            System.out.println((String) p.get(i));
    }
}