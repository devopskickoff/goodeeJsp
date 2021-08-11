package survey.dao;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import sqlmap.MybatisManager;
import survey.dto.SurveyDTO;


public class SurveyDAO {
	public SurveyDTO viewQuestion(int survey_idx) {
		SqlSession session = MybatisManager.getInstance().openSession();
		SurveyDTO dto = session.selectOne("survey.view_question", survey_idx);
		session.close();
		return dto;
	}

}
