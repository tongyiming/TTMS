package com.web.dao;

import java.util.List;
import com.web.entity.Studio;
import org.springframework.stereotype.Repository;

/**
 * Created by Administrator on 2016/9/27 0027.
 */
@Repository("StudioDAO")
public interface StudioDAO {
    public List<Studio> selectAllStudio();
    public Studio selectStudioFromId(int id);

    public Studio selectStudioFromName(String name);

    public List<Studio> selectStudioFromStudioStatus(int studio_status);

    public int insertStudio(Studio studio);

    public int deleteStudioFromId(int id);

    public int updateStudioFromId(Studio studio);
}
