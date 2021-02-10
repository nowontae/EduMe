package com.edume.teacherTestvideo.model;

import java.util.*;

public interface TeacherTestvideoDAO {

	public int testvideoInsert(TeacherTestvideoDTO dto);
	public List testvideoN(Map map);
	public List testvideoAll(Map map);
}
