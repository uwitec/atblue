package cn.com.atblue.common;

import java.sql.Connection;
import java.sql.SQLException;
import javax.sql.DataSource;

import org.apache.commons.dbcp.BasicDataSource;
import org.apache.log4j.Logger;

public class DBPool {
	private static Logger LOG = Logger.getLogger(DBPool.class);
	private String poolName = null;

	private String dbDriver = null;

	private String dbUsername = null;

	private String dbPassword = null;

	private String dbUrl = null;

	private int maxActive = 50;

	private int maxIdle = 10;

	private int maxWait = 10000;

	private int minIdle = 2;

	private int initSize = 10;

	private DataSource dataSource = null;

	public DBPool() {
	}

	public DBPool(String poolName, String dbDriver, String dbUsername,
			String dbPassword, String dbUrl, int maxActive, int maxIdle,
			int maxWait, int minIdle, int initSize) {
		this.poolName = poolName;
		this.dbDriver = dbDriver;
		this.dbUsername = dbUsername;
		this.dbPassword = dbPassword;
		this.dbUrl = dbUrl;
		this.maxActive = maxActive;
		this.maxIdle = maxIdle;
		this.maxWait = maxWait;
		this.minIdle = minIdle;
		this.initSize = initSize;

		dataSource = setupDataSource();
	}

	private DataSource setupDataSource() {
		try {
			Class.forName(dbDriver);
		} catch (ClassNotFoundException ex) {
			ex.printStackTrace();
		}
		BasicDataSource ds = new BasicDataSource();
		ds.setDriverClassName(dbDriver);
		ds.setUsername(dbUsername);
		ds.setPassword(dbPassword);
		ds.setUrl(dbUrl);
		ds.setMaxActive(maxActive);
		ds.setMaxIdle(maxIdle);
		ds.setMaxWait(maxWait);
		ds.setMinIdle(minIdle);
		ds.setInitialSize(initSize);
		ds.setValidationQuery("select 1 from dual");
		ds.setPoolPreparedStatements(true);
		ds.setMaxOpenPreparedStatements(maxActive);
		return ds;
	}

	public void destory() {
		try {
			((BasicDataSource) dataSource).close();
		} catch (Exception e) {
		}
	}

	public Connection getConnection() {
		Connection conn = null;
		try {
			conn = dataSource.getConnection();
		} catch (SQLException ex) {
		}
		return conn;
	}

	public void setDbUsername(String dbUsername) {
		this.dbUsername = dbUsername;
	}

	public void setDbDriver(String dbDriver) {
		this.dbDriver = dbDriver;
	}

	public void setDbPassword(String dbPassword) {
		this.dbPassword = dbPassword;
	}

	public void setDbUrl(String dbUrl) {
		this.dbUrl = dbUrl;
	}

	public void setMaxActive(int maxActive) {
		this.maxActive = maxActive;
	}

	public void setMaxIdle(int maxIdle) {
		this.maxIdle = maxIdle;
	}

	public void setMaxWait(int maxWait) {
		this.maxWait = maxWait;
	}

	public void setMinIdle(int minIdle) {
		this.minIdle = minIdle;
	}

	public void setPoolName(String poolName) {
		this.poolName = poolName;
	}

	public String getPoolName() {
		return this.poolName;
	}

	public String getDbDriver() {
		return this.dbDriver;
	}

	public String getDbUsername() {
		return this.dbUsername;
	}

	public String getDbPassword() {
		return this.dbPassword;
	}

	public String getDbUrl() {
		return this.dbUrl;
	}

	public int getMaxActive() {
		return this.maxActive;
	}

	public int getMaxIdle() {
		return this.maxIdle;
	}

	public int getMaxWait() {
		return this.maxWait;
	}

	public int getMinIdle() {
		return this.minIdle;
	}

	public int getNumActive() {
		return ((BasicDataSource) dataSource).getNumActive();
	}

	public int getNumIdle() {
		return ((BasicDataSource) dataSource).getNumIdle();
	}

	public DataSource getDataSource() {
		return dataSource;
	}

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
}
