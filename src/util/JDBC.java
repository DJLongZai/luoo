package util;

import java.sql.Connection;
import java.sql.SQLException;

import com.mysql.jdbc.jdbc2.optional.MysqlDataSource;
/**
 * 获取数据库链接
 * @author DjLong
 *
 */
public class JDBC {
	public static MysqlDataSource ds;
	static{
		ds = new MysqlDataSource();
		ds.setUrl("jdbc:mysql://localhost:3306/users?useUnicode=true&characterEncoding=utf8");
		ds.setUser("root");
		ds.setPassword("");
	}
	public static Connection getConnection(){
		try {
			return ds.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
}
