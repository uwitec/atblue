package cn.com.atblue.common.codegen.jdbc;

import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class JdbcSupport<T> {
    private DataSource dataSource;

    public JdbcSupport() {
    }

    public JdbcSupport(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    public T queryForObject(String sql, Class<T> injectClass) {
        BeanInjector injector = new BeanInjector(injectClass);
        return (T) injector.inject(queryForMap(sql));
    }

    public T queryForObject(String sql, Map<String, Object> map, Class<T> injectClass) {
        BeanInjector injector = new BeanInjector(injectClass);
        return (T) injector.inject(queryForMap(sql, map));
    }

    public Map<String, Object> queryForMap(String sql) {
        return queryForMap(sql, new HashMap());
    }

    public Map<String, Object> queryForMap(String sql, Map<String, Object> map) {
        List list = queryForList(sql, map);
        return (list == null) || (list.size() <= 0) ? null : (Map) list.get(0);
    }

    public List<T> queryForList(String sql, Class<T> injectClass) {
        BeanInjector injector = new BeanInjector(injectClass);
        return injector.inject(queryForList(sql));
    }

    public List<T> queryForList(String sql, Map<String, Object> map, Class<T> injectClass) {
        BeanInjector injector = new BeanInjector(injectClass);
        return injector.inject(queryForList(sql, map));
    }

    public List<Map<String, Object>> queryForList(String sql) {
        return queryForList(sql, new HashMap());
    }

    public List<Map<String, Object>> queryForList(String sql, Map<String, Object> map) {
        List list = new ArrayList();
        SqlSupport ss = new SqlSupport(sql, map);
        Connection conn = getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = conn.prepareStatement(ss.getSql());
            List paramList = ss.getParamList();
            for (int i = 0; i < paramList.size(); i++) {
                pstmt.setObject(i + 1, map.get(paramList.get(i)));
            }
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Map beanMap = new HashMap();
                ResultSetMetaData meta = rs.getMetaData();
                int columnSize = meta.getColumnCount();
                for (int i = 0; i < columnSize; i++) {
                    String columnName = meta.getColumnName(i + 1);
                    beanMap.put(columnName, rs.getObject(columnName));
                }
                list.add(beanMap);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return list;
    }

    public int execute(String sql) {
        return execute(sql, null);
    }

    public int execute(String sql, Map<String, Object> map) {
        int executeNum = 0;
        SqlSupport ss = new SqlSupport(sql, map);
        Connection conn = getConnection();
        PreparedStatement pstmt = null;
        try {
            pstmt = conn.prepareStatement(ss.getSql());
            List paramList = ss.getParamList();
            for (int i = 0; i < paramList.size(); i++) {
                pstmt.setObject(i + 1, map.get(paramList.get(i)));
            }
            executeNum = pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return executeNum;
    }

    public Connection getConnection() {
        try {
            return this.dataSource.getConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public DataSource getDataSource() {
        return this.dataSource;
    }

    public void setDataSource(DataSource dataSource) {
        this.dataSource = dataSource;
    }
}