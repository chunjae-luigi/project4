package kr.ed.haebeop.persistence;

import kr.ed.haebeop.domain.Unavailable;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface UnavailableMapper {
    @Select("select * from unavailable WHERE MONTH(rdate)=MONTH(#{rdate});")
    public List<Unavailable> unavailableMonthList(Unavailable unavailable);

    @Insert("insert into unavailable(rdate, reason) values(#{rdate}, #{reason})")
    public void unavailableInsert(Unavailable unavailable);


    @Delete("delete from unavailable where uno=#{uno}")
    public void unavailableDelete(int unNo);
}
