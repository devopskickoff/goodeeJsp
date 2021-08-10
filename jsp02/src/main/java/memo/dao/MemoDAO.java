package memo.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;

import memo.dto.MemoDTO;
import sqlmap.MybatisManager;

public class MemoDAO {
	public List<MemoDTO> listMemo(String searchkey, String search) {
// mybatis framework에 접속하여 sql 구문을 실행시키는 역할을 하는 객체
		SqlSession session = MybatisManager.getInstance().openSession();
// 세션.selectList(" select 태그의 id ")
// selectList() 목록이 넘어오는 경우, selectOne 레코드 한 건이 넘어오는 경우
// mybatis에서는 ArrayList를 사용할 수 없고 List를 사용해야함
		System.out.println(searchkey + "," + search);
		List<MemoDTO> list = null;
		if (searchkey.equals("writer_memo")) { // 이름+메모로 찾기
			list = session.selectList("memo.listAll", search);
		} else {
			Map<String, Object> map = new HashMap<>();
			map.put("searchkey", searchkey);
			map.put("search", search);
			System.out.println(map);
			list = session.selectList("memo.list", map);
		}
		return list;
	}

	public void insertMemo(MemoDTO dto) {
		SqlSession session = MybatisManager.getInstance().openSession();
// 세션.insert(" insert id ", 입력매개변수 )
		session.insert("memo.insert", dto);
// mybatis는 오토커밋이 되지 않으므로 세션.commit()을 해야함
		session.commit();
		session.close();
	}

	public MemoDTO viewMemo(int idx) {
		SqlSession session = MybatisManager.getInstance().openSession();
// 결과 레코드가 한건이므로 selectOne( "select id", 매개변수 )
		MemoDTO dto = session.selectOne("memo.view", idx);
		session.close();
		return dto;
	}

	public void updateMemo(MemoDTO dto) {
		SqlSession session = MybatisManager.getInstance().openSession();
		session.update("memo.update", dto);
// insert, delete, update 구문은 mybatis에서 자동commit이 되지 않으므로
// 세션을 commit()한 후 close() 해야 함
		session.commit();
		session.close();
	}

	public void deleteMemo(int idx) {
		SqlSession session = MybatisManager.getInstance().openSession();
		session.delete("memo.delete", idx);
		session.commit();
		session.close();
	}

	public int countMemo(String searchkey, String search) {
		int count = 0;
		SqlSession session = MybatisManager.getInstance().openSession();
// select 결과가 레코드 한건인 경우 ==> selectOne
// 네임스페이스.태그id or 태그id
		if (searchkey.equals("writer_memo")) { // 이름+메모로 찾기
			count = session.selectOne("memo.countAll", search);
		} else {
			Map<String, Object> map = new HashMap<>();
			map.put("searchkey", searchkey);
			map.put("search", search);
			count = session.selectOne("memo.count", map);
		}
		return count;
	}
}