package cn.com.atblue.common.codegen.jdbc;

import cn.com.atblue.common.codegen.bean.Column;
import cn.com.atblue.common.codegen.bean.Table;

import javax.sql.DataSource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DaoSupport extends JdbcSupport {
    public DaoSupport(DataSource dataSource) {
        super(dataSource);
    }

    public List<Table> getTableList() {
        String sql = "SELECT A.TABLE_NAME, A.COMMENTS FROM USER_TAB_COMMENTS A WHERE A.TABLE_TYPE='TABLE' ORDER BY A.TABLE_NAME ASC";

        return queryForList(sql, Table.class);
    }    
    public List<Table> getTableList(String prefixOfTable) {
        String sql = "SELECT A.TABLE_NAME, A.COMMENTS, " +
                "(SELECT MAX(T.COLUMN_NAME) FROM USER_CONS_COLUMNS T WHERE T.TABLE_NAME=A.TABLE_NAME AND T.POSITION='1') PK_NAME  " +
                "FROM USER_TAB_COMMENTS A WHERE A.TABLE_TYPE='TABLE' AND TABLE_NAME LIKE '%"+prefixOfTable+"%' ORDER BY A.TABLE_NAME ASC";

        return queryForList(sql, Table.class);
    }

    public Table getTableInfo(String tableName) {
        String sql = "SELECT A.TABLE_NAME, A.COMMENTS FROM USER_TAB_COMMENTS A WHERE A.TABLE_TYPE='TABLE' AND A.TABLE_NAME=#TABLE_NAME#";

        Map paramMap = new HashMap();
        paramMap.put("TABLE_NAME", tableName);
        return (Table) queryForObject(sql, paramMap, Table.class);
    }

    public List<Column> getColumnList(String tableName) {
        String sql = "SELECT A.COLUMN_NAME ,A.DATA_TYPE ,A.DATA_LENGTH ,A.DATA_PRECISION ,A.DATA_SCALE ,B.COMMENTS FROM USER_TAB_COLS A LEFT OUTER JOIN USER_COL_COMMENTS B ON A.TABLE_NAME=B.TABLE_NAME AND A.COLUMN_NAME=B.COLUMN_NAME WHERE A.TABLE_NAME=#TABLE_NAME# ORDER BY A.INTERNAL_COLUMN_ID ASC";

        Map paramMap = new HashMap();
        paramMap.put("TABLE_NAME", tableName);
        return queryForList(sql, paramMap, Column.class);
    }

    public static void main(String[] args) {
        DataSource dataSource = null;
        DaoSupport fi = new DaoSupport(dataSource);
        List tableList = fi.getTableList();
        for (int i = 0; i < tableList.size(); i++) {
            Table table = (Table) tableList.get(i);
            System.out.println("TableName=" + table.getTableName());
        }
        List columnList = fi.getColumnList("T_T1_T2");
        for (int i = 0; i < columnList.size(); i++) {
            Column column = (Column) columnList.get(i);
            System.out.println("ColumnName=" + column.getColumnName());
        }
    }
}