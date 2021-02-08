package com.edume.teacherResult.model;

import java.util.*;

public interface TeacherResultDAO {
	
	public Integer getTeacherAllResult(Map map);
	
	public Integer getTeacherResult6M_1(Map map);
	public Integer getTeacherResult6M_2(Map map);
	public Integer getTeacherResult6M_3(Map map);
	public Integer getTeacherResult6M_4(Map map);
	public Integer getTeacherResult6M_5(Map map);
	public Integer getTeacherResult6M_6(Map map);
	
	public Integer getTeacherResult12M_2(Map map);
	public Integer getTeacherResult12M_4(Map map);
	public Integer getTeacherResult12M_6(Map map);
	public Integer getTeacherResult12M_8(Map map);
	public Integer getTeacherResult12M_10(Map map);
	public Integer getTeacherResult12M_12(Map map);
	
	public Integer getTeacherResult28D_7(Map map);
	public Integer getTeacherResult28D_14(Map map);
	public Integer getTeacherResult28D_21(Map map);
	public Integer getTeacherResult28D_28(Map map);
	
}
