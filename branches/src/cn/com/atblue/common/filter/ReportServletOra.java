package cn.com.atblue.common.filter;

import cn.com.atblue.common.SpringFactory;
import com.runqian.base4.util.DBTypes;
import com.runqian.report4.usermodel.Context;
import com.runqian.report4.usermodel.DataSourceConfig;
import com.runqian.report4.usermodel.IConnectionFactory;
import com.runqian.report4.view.ReportServlet;

import javax.servlet.ServletException;
import javax.sql.DataSource;
import java.sql.Connection;

public class ReportServletOra extends ReportServlet {
    public void init() throws ServletException {
        super.init();
        Context context = Context.getInitCtx();
        final DataSource ds = SpringFactory.instance.getDataSource();

        context.setConnectionFactory("default", new IConnectionFactory() {
            public Connection getConnection() throws Exception {
                return ds.getConnection();
            }
        });
        context.setDataSourceConfig("default", new DataSourceConfig(DBTypes
                .getDBType("1"), true, "gbk", "gbk", false));
    }
}
