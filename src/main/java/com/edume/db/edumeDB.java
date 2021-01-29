package com.edume.db;
import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class edumeDB {
	//바로 실행될수 있도록static영역 활성화
	
		private static DataSource ds;
		
		static{
			
			try {//이 위치에 있는 지역변수가 되어버림
				Context initContext = new InitialContext();
				Context envContext  = (Context)initContext.lookup("java:/comp/env");
				ds = (DataSource)envContext.lookup("jdbc/myoracle");
			}catch (Exception e) {
				e.printStackTrace();
			}
		}

		//원할때마다 빌려갈수있도록
		public static Connection getConn() throws Exception{
			return ds.getConnection();
		}
}
