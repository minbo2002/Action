package com.mycom.notice.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.mycom.notice.domain.ImageFileVO;
import com.mycom.notice.domain.Notice;

//DAO(Repository)<->(MyBatis)->db

@Repository
public class NoticeRepositoryImpl implements NoticeRepository{

	/*action-mybatis.xml에서   sqlSession이름으로  bean객체만들어진 것을
	 * 자동주입(@Autowired)시켜준다
	<bean id="sqlSession"
		  class="org.mybatis.spring.SqlSessionTemplate">
		<constructor-arg index="0" ref="sqlSessionFactory"></constructor-arg>
	</bean>*/

	//필드
	@Autowired
	private SqlSession sqlSession;
	
	
	/*여기에서는 action-mybatis.xml에서   
	 실행하고자하는 쿼리를 가진 문서는 아래와 같이 설정하였다
	 <property name="mapperLocations" 
	           value="classpath:mybatis/mappers/*.xml" />*/
	//전체 게시물수 조회
	@Override
	public int getTotalCnt(String keyword) throws DataAccessException {
		int cnt = (Integer)sqlSession.selectOne("mapper.notice.totalCnt", keyword);
		return cnt;
	}
	
	//특정글의 글번호 조회
	//파라미터 int no:조회하고자하는 글번호
	public int getNoticeNo(int no) throws DataAccessException {
		return sqlSession.selectOne("mapper.notice.getNoticeNo",no);
	}
	
	
	//상세보기
	@Override
	public Notice getNoticeDetail(int no) throws DataAccessException {
		//Article article=(Article)sqlSession.selectOne("mapper.article.articleDetail", no);
		//return article;
		
		return (Notice)sqlSession.selectOne("mapper.notice.noticeDetail", no);
	}
	
	
	
	//전체 목록 조회
	@Override
	public List<Notice> getNoticeAllList(String keyword) throws DataAccessException {
		List<Notice> list = sqlSession.selectList("mapper.notice.noticeAllList",keyword);
		return list;
	}

	//저장하기
	public void insertNotice(Notice notice) throws DataAccessException {
		int cnt=sqlSession.insert("mapper.notice.insertNotice", notice);
	}
	
	//특정글 수정
	public int updateNotice(Notice notice) throws DataAccessException {
		int cnt=sqlSession.update("mapper.notice.updateNotice", notice);
		System.out.println("cnt="+cnt);
		//update가 적용된 레코드수를 반환받는다
		//여기에서는 1이면 수정성공, 0이면 실패
		return cnt;
	}
	
	//삭제하기   
	public int deleteNotice(int no) throws DataAccessException {
		int cnt=sqlSession.delete("mapper.notice.deleteNotice", no);
		System.out.println("cnt="+cnt);
		//delete가 적용된 레코드수를 반환받는다
		//여기에서는 1이면 삭제성공, 0이면 실패
		return cnt;
	}





	
}
















