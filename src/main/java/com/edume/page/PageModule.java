<<<<<<< HEAD
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
=======
package com.edume.page;

public class PageModule {
	//페이징을 위한 모듈
	public static String makePage(String pagename,int totalCnt,int cp,int listSize, int pageSize) {
		//pageTest.jsp 에서 가져와서 사용
		
		StringBuffer sb=new StringBuffer();
		/*StringBuffer 클래스의 객체는 한 번 생성된 후에도 계속하여 저장하고 있는 문자열의 내용을 변경할 수 있다.원본 수정 o //일반 스트링은 문자열 조작 불가 ,원본 수정x
		 * 그러므로, StringBuffer 클래스의 메소드는 문자열 처리 후의 결과를 원래의 StringBuffer 객체에 반영하고, 메소드 리턴 타입은 void 이다.
		스트링 버퍼에 int 넣어도 문자가 됨.*/

		
		
		//int totalCnt=83;//페이징 구현하려는 게시판의 전체 게시글 갯수
		//int listSize=5;//보여줄 리스트 수 5
		//int pageSize=5;//보여줄 페이지
		//int cp=Integer.parseInt(cp_s);//프론트 페이지  현재 위치

		//사용자 위치 얻은 코드
		int totalPage=(totalCnt/listSize)+1;//나눠 떨어질때마다 페이지 하나 더 많은 상황 생김
		if(totalCnt%listSize==0)totalPage--;//총 페이지가 하나 더 많을 경우 하나를 빼서 총 페이지 정보 구함

		int userGroup=cp/pageSize;// 현재 그룹번호 가져옴. 나눠떨어지면 또 하나더 많은 상황생기니까
		if(cp%pageSize==0)userGroup--;//나눠 떨어진다면 하나를 빼준다.

		
		if(userGroup!=0){
			//태그 부분을 쪼개서 넣음.
			sb.append("<a href='");
			sb.append(pagename);//"pageTest.jsp
			sb.append("?cp=");//cp=
			int temp=(userGroup-1)*pageSize+pageSize;
			sb.append(temp);
			sb.append("'>&lt;&lt; </a>");
			//<a href="pageTest.jsp?cp=<%=(userGroup-1)*pageSize+pageSize%>">&lt;&lt; </a> ->이걸 쪼개서 위에 담음
			// &lt 왼쪽으로 가는 녀석 <<
		}

		for(int i=(userGroup*pageSize)+1;
				i<=(userGroup*pageSize)+pageSize;i++){//1페이지 부터 총 페이지까지 
			//append : 데이터를 현재 문자열 끝에 추가한다.
			sb.append("&nbsp;&nbsp;<a href='");//속성의 시작이라 ' 붙임
			sb.append(pagename);
			sb.append("?cp=");
			sb.append(i);
			sb.append("'>");
			sb.append(i);
			sb.append("</a>&nbsp;&nbsp;");
			//&nbsp;&nbsp;<a href="pageTest.jsp?cp=<%=i%>"><%=i%></a>&nbsp;&nbsp;//1부터 17 페이지까지 출력하여 보여줌 ->이걸 쪼개서 위에 담음
			//현재 페이지 위치에서 
			if(i==totalPage){
				break; // 총 17페이지라서 거기까지만 보여줌 없으면 20페이지 보여준다..
			}
			
		}

	
		if(userGroup!=(totalPage/pageSize)-(totalPage%pageSize==0?1:0)){//마지막 번호일때/ 딱 나눠 떨어지면 빼준다. 
			
			sb.append("<a href='");
			sb.append(pagename);//페이지 이름연결
			sb.append("?cp=");
			int temp=(userGroup+1)*pageSize+1;
			sb.append(temp);//결과값을 문자열 결합
			sb.append("'>&gt;&gt;</a>");
			
			//<a href="pageTest.jsp?cp=<%=(userGroup+1)*pageSize+1%>">&gt;&gt;</a><% //오른쪽으로 가는 녀석 >> ->이걸 쪼개서 위에 담음
			
		}

		return sb.toString(); //String으로 변환한다.
		//메소드 반환타입 String
	}
}
>>>>>>> branch 'develop' of https://github.com/nowontae/EduMe.git
