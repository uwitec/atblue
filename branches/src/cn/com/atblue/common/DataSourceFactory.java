package cn.com.atblue.common;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.jdom.Document;
import org.jdom.Element;
import org.jdom.JDOMException;
import org.jdom.input.SAXBuilder;

public class DataSourceFactory {
	
	private Map DBPools = new HashMap();
	
	private static String configFileName = "/config/datasource.xml";
	
	public void init(){
		DBPools.clear();
		SAXBuilder sb = new SAXBuilder();
		Document doc = null;
		try {
			doc = sb.build(DataSourceFactory.class.getResourceAsStream(configFileName));
		} catch (JDOMException ex) {
		} catch (Exception ex) {
		}
		Element root = doc.getRootElement();
		List items = root.getChildren();
		List childList = ((Element) items.get(0)).getChildren();
		for (int i = 0; i < childList.size(); i++) {
			Element _thisElement = ((Element) childList.get(i));
			String poolName = _thisElement.getChild("name").getText();
			String dbDriver = _thisElement.getChild("driver").getText();
			String dbUsername = _thisElement.getChild("dbUsername").getText();
			String dbPassword = _thisElement.getChild("dbPassword").getText();
			String dbUrl = _thisElement.getChild("dbUrl").getText();
			String _maxActive = _thisElement.getChild("maxActive").getText();
			String _maxIdle = _thisElement.getChild("maxIdle").getText();
			String _maxWait = _thisElement.getChild("maxWait").getText();
			String _minIdle = _thisElement.getChild("minIdle").getText();
			String _initSize = _thisElement.getChild("initSize").getText();
			if (poolName == null || dbDriver == null || dbUsername == null
					|| dbPassword == null || dbUrl == null) {
				continue;
			}

			int maxActive = _maxActive == null ? 50 : Integer.parseInt(_maxActive);
			int maxIdle = _maxIdle == null ? 10 : Integer.parseInt(_maxIdle);
			int maxWait = _maxWait == null ? 10000 : Integer.parseInt(_maxWait);
			int minIdle = _minIdle == null ? 5 : Integer.parseInt(_minIdle);
			int initSize = _initSize == null ? 10 : Integer.parseInt(_initSize);

			DBPools.put(poolName, new DBPool(poolName, dbDriver, dbUsername,
					dbPassword, dbUrl, maxActive, maxIdle, maxWait, minIdle,initSize));
		}
	}
	
	public DataSource getDataSource(String poolName){
		if(DBPools.containsKey(poolName)){
			DBPool pool = (DBPool)DBPools.get(poolName);
			return pool.getDataSource();
		}
		return null;
	}
}
