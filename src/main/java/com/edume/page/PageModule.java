package com.edume.page;

public class PageModule {
	
	public static String makePage(String pageName,int cp,int totalCnt, int listSize, int pageSize,int midx,String boardtype) {
		
		StringBuffer sb=new StringBuffer();
		
		
		int totalPage=(totalCnt/listSize)+1;
		if(totalCnt%listSize==0)totalPage--;
		int userGroup=cp/listSize;
		if(cp%listSize==0)userGroup--;
		
		if(userGroup!=0) {
			sb.append("<a href='");
			sb.append(pageName);
			sb.append("?cp=");
			int temp=(userGroup-1)*pageSize+pageSize;
			sb.append(temp);
			sb.append("&midx=");
			sb.append(midx);
			sb.append("&boardtype=");
			sb.append(boardtype);
			sb.append("'>&lt;&lt</a>");
		}
		
		
		
		for(int i=(userGroup*pageSize)+1;i<=(userGroup*pageSize)+pageSize;i++) {
			sb.append("&nbsp;&nbsp;<a href='");
			sb.append(pageName);
			sb.append("?cp=");
			sb.append(i);
			sb.append("&midx=");
			sb.append(midx);
			sb.append("&boardtype=");
			sb.append(boardtype);
			sb.append("'>");
			sb.append(i);
			sb.append("</a>&nbsp;&nbsp;");
			
			if(i==totalPage) {
				break;
			}
		}
		
		if(userGroup!=(totalPage/pageSize)-(totalPage%pageSize==0?1:0)) {
			sb.append("<a href='");
			sb.append(pageName);
			sb.append("?cp=");
			int temp=(userGroup+1)*pageSize+1;
			sb.append(temp);
			sb.append("&midx=");
			sb.append(midx);
			sb.append("&boardtype=");
			sb.append(boardtype);
			sb.append("'>&gt;&gt;</a>");
		}
		return sb.toString();
	}
	
}
